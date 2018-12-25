# Asset Transfer

`Transfer` is the most basic transaction Binance Chain supports, it moves assets among different addresses.

Please note the fees must be paid first in BNB before the transaction can be executioned.

## Account and Balance

Whenever a new address receives any asset, the corresponding transaction would create an 
`Account` for that address, which contains balances across all assets that are owned on this address.

The balance (the amount of token) of each asset is composed of 3 different parts:

- Available: the amount of token can be transferred, and spent to swap (buy) other assets
- Locked: the amount of token has been used in any outstanding orders. Once the order terminates 
(either filled, canceled or expired), the locked amount would decrease.
- Frozen: the amount of token has been fronze via `Freeze` transactions.

## Simple Transfer and Memo

Before transferring token to someone else, please make sure that you have an account with enough balance
and have unlocked your wallet on web wallet or restored your key via CLI.

### Web wallet 

You can easily send tokens to another address on web wallet.

![](./assets/web_wallet_transfer.png)

First, you need to choose what asset you want to send.

Then you input the address you want to send tokens to and amount of token.

And you can also input memo here and size of memo is restricted to 128 bytes.

Fee charged and balance will be showed in below.

### CLI

If you want to send token to an address, make sure you have restored your key. You can list all of your keys:
```bash
➜  test git:(master) ✗ ./bnbcli keys list --home ~/.bnbcli
NAME:	TYPE:	ADDRESS:						PUBKEY:
test	local	bnc17kwznuljsy4n89wcjd6esx2j5t0w326c03xhyr	bncp1addwnpepq2gudmfe0dqqax3f57j9azy5rujlwcra4w8ueehsl5whzhlvczxuuakuldy
```

You can query your balance before send tokens.

```bash
➜  test git:(master) ✗ ./bnbcli account bnc17kwznuljsy4n89wcjd6esx2j5t0w326c03xhyr --trust-node --node tcp://172.22.41.165:26657
{  
   "type":"bnbchain/Account",
   "value":{  
      "base":{  
         "address":"bnc17kwznuljsy4n89wcjd6esx2j5t0w326c03xhyr",
         "coins":[  
            {  
               "denom":"BNB",
               "amount":"16893880000"
            },
            {  
               "denom":"NNB-C56",
               "amount":"400000000"
            }
         ],
         "public_key":{  
            "type":"tendermint/PubKeySecp256k1",
            "value":"ApHG7Tl7QA6aKaekXoiUHyX3YH2rj8zm8P0dcV/swI3O"
         },
         "account_number":"100016",
         "sequence":"15"
      },
      "name":"",
      "frozen":null,
      "locked":null
   }
}
``` 

Then you can send token.

```bash
➜  build git:(master) ✗ ./bnbcli send --from test --to=bnc1l7kr35dgj3jezjvw6nt6zyqcmyt2jh7rs2v4n9 --amount=200000000:BNB --chain-id chain-bnb --node 172.22.41.165:26657 --json --memo "Test transfer"
Password to sign with 'test':
{  
   "Height":"272155",
   "TxHash":"A8F78BF8736A35B9433CA9CD1CDD03A8FB3D5D82",
   "Response":{  
      "log":"Msg 0: ",
      "tags":[  
         {  
            "key":"c2VuZGVy",
            "value":"Ym5jMTdrd3pudWxqc3k0bjg5d2NqZDZlc3gyajV0MHczMjZjMDN4aHly"
         },
         {  
            "key":"cmVjaXBpZW50",
            "value":"Ym5jMWw3a3IzNWRnajNqZXpqdnc2bnQ2enlxY215dDJqaDdyczJ2NG45"
         },
         {  
            "key":"YWN0aW9u",
            "value":"c2VuZA=="
         }
      ]
   }
}
```

If you are not familiar with CLI, you can use `-h` to get helps:
```bash
➜  test git:(master) ✗ ./bnbcli send -h
Create and sign a send tx

Usage:
  bnbcli send [flags]

Flags:
      --account-number int   AccountNumber number to sign the tx
      --amount string        Amount of coins to send
      --async                broadcast transactions asynchronously
      --chain-id string      Chain ID of Binance Chain node
      --dry-run              ignore the perform a simulation of a transaction, but don't broadcast it
      --from string          Name or address of private key with which to sign
      --generate-only        build an unsigned transaction and write it to STDOUT
  -h, --help                 help for send
      --indent               Add indent to JSON response
      --json                 return output in json format
      --ledger               Use a connected Ledger device
      --memo string          Memo to send along with transaction
      --node string          <host>:<port> to tendermint rpc interface for this chain (default "tcp://localhost:26657")
      --print-response       return tx response (only works with async = false) (default true)
      --sequence int         Sequence number to sign the tx
      --source int           Source of tx
      --to string            Address to send coins
      --trust-node           Trust connected full node (don't verify proofs for responses) (default true)

Global Flags:
  -e, --encoding string   Binary encoding (hex|b64|btc) (default "hex")
      --home string       directory for config and data (default "/root/.bnbcli")
  -o, --output string     Output format (text|json) (default "text")
      --trace             print out full stack trace on errors
```
