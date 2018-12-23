# How to Access Binance Chain

[Get Started](get-started.md) pages already talk about access Binance Chain and DEX via Wallet and Explorers. Here we would like to dive into some technology details for access in a programming way.


## Read APIs
There are 3 ways to read data from Binance chain:
### Web API
The `Accelerated Node` infrastructure provide easy access via http REST API and WebSocket push APIs. There are mulitple endpoints from different validator infrastructures. Please check the [Web API Reference](api-reference/dex-api.md)


## Node, and Node RPC
There are public accessible node peers that joins the Binance Chain network. They usually provide RPC calls. Please check the [Node RPC Reference](api-reference/node-rpc.md).

You can also run a [full node](fullnode.md) by yourself, so that you would have a local server to send RPC requests and read Chain information off.

## Command Line Interface
Essentially command line interfaces are just tools that wrap the incoming command line arguments and call RPCs. Please check the [Command Line Referenace](cli.md).



## Write APIs
You can only write to Binance Chain via `Transactions`. Both Web API and Node RPC provide a `broadcastTx` API to submit a `signed and encoded` transaction onto the Binance Chain. 
Encoding and Signature
Encoding is a big part, which defines the way how transactions are persisted and transferred between clients and nodes, and different nodes themselves. [here](encoding.md) has a detailed specification on the transaction types and encoding logic.



## Sequence Number for Transactions