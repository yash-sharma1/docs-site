# Binance Chain Command Line Interface (CLI) Reference

Binance Chain CLI is one of ways to access Binance Chain.

Binance Chain CLI can be used as a local wallet, you can manage your keys via Binance CLI. You can add a new
key or restore your key from mnemonic words. And you can list your keys and show specified key info. 

With Binance Chain CLI, you can send transactions to Binance Chain, like placing order, transferring token, 
issuing token and so on. Actually you can do almost everything you can do with Binance Chain web wallet. What is
more, you can propose to list trading pairs and join chain governance.

In addition, you can do some simple queries through CLI. For example, you can query your account's 
balance, transaction detail by transaction hash and etc.

## Where can I download the Binance Chain CLI?

TODO

## Where to connect

You can manage you keys locally without connecting to any node. But if you want to interact with Binance Chain, 
you need to connect to one of Binance Chain full nodes. 

You can run your own full node, which may automatically connect to Binance Chain, and you can run your CLI there 
with your own full node. In the mean time, you can connect to any full nodes provided by other people. Please 
check [here] (dataseed_list.md) for a list.

Full nodes will be denoted as the format of `ip:port`.

## How to use

When you have downloaded Binance Chain CLI, you can use `help` sub command to show all the available commands:

```bash
$  ./bnbcli help
BNBChain light-client

Usage:
  bnbcli [command]

Available Commands:
  init        Initialize light client
  status      Query remote node for status

  txs         Search for all transactions that match the given tags.
  tx          Matches this txhash over all committed blocks

  account     Query account balance
  send        Create and sign a send tx
  transfer

  api-server  Start the API server daemon
  keys        Add or view local private keys

  version     Print the app version
  token       issue or view tokens
  dex         dex commands
  gov         gov commands
  help        Help about any command

Flags:
  -e, --encoding string   Binary encoding (hex|b64|btc) (default "hex")
  -h, --help              help for bnbcli
      --home string       directory for config and data (default "/root/.bnbcli")
  -o, --output string     Output format (text|json) (default "text")
      --trace             print out full stack trace on errors

Use "bnbcli [command] --help" for more information about a command.
```

## CLI Reference

For detail usage, you can refer to:

- [transfer](../transfer.md)
- [list](../list.md)