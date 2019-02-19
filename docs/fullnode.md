# Run a full node to join Binance Chain

A `full node` of Binance Chain is a `witness node`, which observes the consensus messaging, 
downloads blocks and executes logics to achieve the consistent state as `validator node` (and other `witness node`).
Full nodes also help the network by accepting transactions from other nodes, and then relaying them to core Binance network.

## Platforms and System Requirement

### Platforms

We support running full node on `Mac OS X` and `Linux`.

### Minimum Requirements
The hardware must meet certain requirements to run a full node. 

- Desktop or laptop hardware running recent versions of Mac OS X, or Linux.
- 500 gigabytes of free disk space, accessible at a minimum read/write speed of 100 MB/s.
- 4 cores of CPU and 8 gigabytes of memory (RAM).
- A broadband Internet connection with upload/download speeds of at least 1 megabytes per second
- You full node has to run at least 4 hours per 24 hours in order to catch up with Binance Chain.
More hours would be better, and best of all would be if you can run your node continuously.

## Run a full node

Download: 
```bash
git clone https://github.com/binance-chain/node-binary.git
```

Go to directory according to the network you want to join in. Replace the `network` var with `testnet` or `prod` in the
following command:
```bash
cd node-binary/fullnode/{network}
```

Start the full node according to the platform. Replace the `platform` var with `mac` or `linux` in the following command:
```bash
./{{platform}}/bnbchaind start --home ./node  &
```

**Notice**: For now, it may takes long time to sync blocks from Binance Chain. The actual time depends on how long your full
node are lagged behind the core network. But we are working on fast sync mode can set you up in minutes. 
Only after catch up with Binance Chain, the full node can handle request correctly.

## Network and Seeding

For a full node, it must connect to one or more known nodes to join Binance Chain. There are several famous `seed node` that 
offer known nodes address of the network to newly joined full nodes. 

You cat get seeds info through a simple python script(notice to replace domain according to different network):

```python
import requests, json
d = requests.get('https://testnet-dex.binance.org/api/v1/peers').text
l = json.loads(d)
seeds = ",".join([ (seed["id"]+"@"+seed["original_listen_addr"]) for seed in l if "accelerated" not in seed ])
print seeds
```

If you want add or remove seed node, please feel free to edit the field `seeds` of `node-binary/fullnode/{network}/node/config.yaml`.


## More configuration

- Log: The log file is under `home`- the directory specified when start `bnbchaind`. The latest log file is `bnc.log`. The process will create 
a new log file every one hour. To make sure you have sufficient disk space to keep the log, we strongly recommend you to change the log location 
by changing `logFileRoot` option in `{home}/config/app.toml`.
- Service Port: RPC service listen on port 27147 and P2P service listen on port 27146 by default. Make sure these two ports 
are free before start a full node, else the full node have to listen on other ports.
- Store: All the state and block data will store under `{home}/data`, do not delete or edit any of these files.
- More detailed configuration options please visit `node-binary/fullnode/{network}/node/config.toml` and `node-binary/fullnode/{network}/node/app.toml`

## Upgrading a full node

For most case, download new binary and replace it, then restart the full node will work. If we release a incompatible version, 
we may be release both the data and binary, but is is still in discuss. More detail will come out later.


## Monitor

Prometheus is enabled on port 26660 by default, and the endpoint is `/metrics`.

## Work with full node

Full node has the same RPC interface as the list here [rpc-api](api-reference/node-rpc.md) 

If you are very interested in transactions in every block, or order book, or account changes or block fee charge, 
please refer to [work with full node](workwith-node.md). 
