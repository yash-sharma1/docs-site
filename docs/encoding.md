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


## Standard Transaction to Use and Encode for Binance Chain


#### Transfer

#### NewOrder

#### Cancel

#### Freeze

#### Unfreeze


