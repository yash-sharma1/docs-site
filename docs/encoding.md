# Binance Chain Transaction Encoding Specification

Binance Chain transactions are protocol-based data types and can be only submit in a compatible encoding frame.

The fundamental encoding logic is from [Tendermint Amino](https://github.com/tendermint/go-amino), which derives from and is "largely compatible with" Google protocol-buffer's Proto3. 

However the client sides only need to stick to the below specification for the most frequently used transactions.

## Encoding Output

Binance Chain (Amino) encoding logic may encode a data structure into two output formats: Binary and JSON.

### JSON Marshal
Amino supports JSON encoding natively, which is the same as other usual json marshaler. Except that it can add one more `type` info for registered type, as below.

```json
{
  "type": "<amino type name>",
  "value": <JSON>
}

```
### Binary Marshal

> **[Please note the below binary encoding logic is subjected to future change, from time to time. Please watch out for the community news](resources.md).**

Binary encoding is a variant of Google protocol buffer. The bytes are layed out in the below sequence:

1. a [varint](https://developers.google.com/protocol-buffers/docs/encoding#varints) encoded integer - it contains the length of the encoded bytes for the object.
2. an object type prefix of 4-8 bytes - For different type of objects, there would be different type prefixes, and they are showed as in the below specific objects (data structures).
3. a binary encoded object - the encoding is mostly the same as protocol buffer encoding mechnism, except the embedded fields of complex type:
    - to encode array of some specific types, a length in varint and an object type prefix would be added ahead of the real encoding
    - to encode data field of some specific types, an object type prefix for the field would be added ahead of the real encoding.

## Binance Chain Encoding Types

Here below are listed the real data types that should be sent to Binance Chain as request, and their encoding layout. To simply the presentation, here we use a variant of [Google protocol buffer proto3](https://developers.google.com/protocol-buffers/docs/proto3) language to illustrate how the data fields are organized. Except the all-capitalized fields, the other fields should use the default `proto3` encoding logic.


### Standard Transaction to Use and Encode for Binance Chain
Transaction submit are all wraped into the below `Standard Transaction`.

```go

// please note the field name is the JSON name.
message StdTx {
  uint64 SIZE-OF-ENCODED // varint encoded length of the structure after encoding
  0xF0625DEE   // hardcoded, object type prefix in 4 bytes
  repeated Msg msgs = 1 // array of size 1, containing the transaction message, which are one of the transaction type below
  repeated StdSignature signatures = 2 // array of size 1, containing the standard signature structure of the transaction sender
  string memo = 3 // a short sentence of remark for the transaction. Please only `Transfer` transaction allows 'memo' input, and other transactions with non-empty `Memo` would be rejected.
  int64 source = 4 // an identifier for transaction incoming tools
  bytes data = 5 //byte array, reserved for future use
}
```

### Transaction Types
Transactions are different types of write requests to Binance Chain, which can be inserted into `StdTx.msgs` field. So far every `StdTx` can only contain one transaction in one type.

#### Transfer
Transfer is the transaction for transfering fund to different addresses.

```go
// please note the field name is the JSON name.
message Send {
  uint64 SIZE-OF-ENCODED // varint encoded length of the structure after encoding
  0x2A2C87FA   // hardcoded, object type prefix in 4 bytes
  message Token {
    string denom = 1
    int64 amount = 2 
  }
  message Input {
    bytes address = 1
    repeated Token coins = 2    
  }
   message Output {
    bytes address = 1
    repeated Token coins = 2    
  }
  repeated Input inputs
  repeated Output outputs
}
```

#### NewOrder
NewOrder transaction would create a new order to buy and sell tokens on Binance DEX.

```go
// please note the field name is the JSON name.
message NewOrder {
  uint64 SIZE-OF-ENCODED // varint encoded length of the structure after encoding
  0xCE6DC043   // hardcoded, object type prefix in 4 bytes
  bytes sender = 1 // order originating address
  string id = 2 // order id, optional
  string symbol = 3 // symbol for trading pair in full name of the tokens
  int64 ordertype = 4 // only accept 2 for now, meaning limit order
  int64  side = 5 // 1 for buy and 2 fory sell
  int64 price = 6 // price of the order, which is the real price multiplied by 1e8 (10^8) and rounded to integer
  int64 quantity = 7 // quantity of the order, which is the real price multiplied by 1e8 (10^8) and rounded to integer
  int64 timeinforce = 8 // 1 for Good Till Cancel(GTC) order and 3 for Immediate Or Cancel (IOC)
```

#### Cancel
Cancel transactions cancel the outstanding (unfilled) orders from the Binance DEX. After cancel success, the locked quantity on the orders would return back to the address' balance and become free to use, i.e. transfer or send new orders.

```go
// please note the field name is the JSON name.
message CancelOrder {
  uint64 SIZE-OF-ENCODED // varint encoded length of the structure after encoding
  0x166E681B   // hardcoded, object type prefix in 4 bytes
  bytes sender = 1 // order originating address'
  string symbol = 2 // symbol for trading pair in full name of the tokens
  string id = 3 // order id, optional
  string refid = 4 // order id of the one to cancel
}
```
  
#### Freeze
Freeze transaction would move the amount of the tokens into a `fronze` state, in which it cannot be used to transfer or send new orders.

```go
// please note the field name is the JSON name.
message TokenFreeze {
  uint64 SIZE-OF-ENCODED // varint encoded length of the structure after encoding
  0xE774B32D   // hardcoded, object type prefix in 4 bytes
  bytes from = 1 // owner address
  string symbol = 2 // token symbol, in full name with "-" suffix
  string amount = 3 // amount of token to freeze
}
```

#### Unfreeze
Unfreezcanceltransaction would reversely turn the amount of `frozen` tokens back to free state.

```go
// please note the field name is the JSON name.
message TokenUnfreeze {
  uint64 SIZE-OF-ENCODED // varint encoded length of the structure after encoding
  0x6515FF0D   // hardcoded, object type prefix in 4 bytes
  bytes from = 1 // owner address
  string symbol = 2 // token symbol, in full name with "-" suffix
  string amount = 3 // amount of token to unfreeze
}
```
### Standard Signature Type
Request senders' signature is stored on the `Standard Transaction` data via a `Standard Signature` as below.

```go

message StdSignature {
  uint64 SIZE-OF-ENCODED // varint encoded length of the structure after encoding
  // please note there is no type prefix for StdSignature
  message PubKey {
    0xEB5AE987 // hardcoded, object type prefix in 4 bytes
    bytes // no name or field id, just encode the bytes
  }
  PubKey pub_key = 1 // public key bytes of the signer address
  bytes signature = 2 // signature bytes, please check chain access section for signature generation
  int64 account_number = 3 // another identifier of signer, which can be read from chain by account REST API or RPC
  int64 sequence // sequence number for the next transaction of the client, which can be read fro chain by account REST API or RPC. please check chain acces section for details.
}

```

