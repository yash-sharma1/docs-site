# Run a Full Node to Join Binance Chain

>  Note:  Please take a note that this is a pre-alpha version and the software is not stablized. Many changes and upgrades are expected to come.

A `full node` of Binance Chain is a `witness node`, which observes the consensus messaging,
downloads blocks and executes business logic to achieve the consistent state as `validator node` (and other `witness node`).
Full nodes also help the network by accepting transactions from other nodes  and then relaying them to the core Binance network.

## Platforms and System Requirement

### Platforms Requirements

We support running a full node on `Mac OS X` and `Linux`.

### Minimum System Requirements
The hardware must meet certain requirements to run a full node.

- Desktop or laptop hardware running recent versions of Mac OS X, or Linux.
- 500 gigabytes of free disk space, accessible at a minimum read/write speed of 100 MB/s.
- 4 cores of CPU and 8 gigabytes of memory (RAM).
- A broadband Internet connection with upload/download speeds of at least 1 megabytes per second
- Your full node has to run at least 4 hours per 24 hours in order to catch up with Binance Chain.
More hours would be better, and best of all would be if you can run your node continuously.

## Run a Full Node

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

**Notice**: For now, it may take a long time to sync blocks from Binance Chain. If you are not interested in sync historical blocks, you can change `state_sync` option in `{home}/config/app.toml` to true, it will catch up with the chain on most recent height after today's UTC 0:00. (so if now is 23:59, wait one more minute will get much faster sync up speed)

> Please note the `state sync` function is just usable and many improvements are still needed to be done, so it is not  encouraged to enable `state sync` for now.

Only after catching up with Binance Chain, the full node can handle requests correctly.

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

If you want to add or remove seed node, please feel free to edit the field `seeds` of `node-binary/fullnode/{network}/node/config.yaml`.


## More Configurations

- Log: The log file is under `home`- the directory specified when starting `bnbchaind`. The latest log file is `bnc.log`. The process will create a new log file every one hour. To make sure you have sufficient disk space to keep the log, we strongly recommend you to change the log location by changing `logFileRoot` option in `{home}/config/app.toml`.
- Service Port: RPC service listen on port 27147 and P2P service listens on port 27146 by default. Make sure these two ports are open before starting a full node, unless the full node has to listen on other ports.
- Store: All the state and block data will store under `{home}/data`, do not delete or edit any of these files.
- More detailed configuration options please visit `node-binary/fullnode/{network}/node/config.toml` and `node-binary/fullnode/{network}/node/app.toml`

## Upgrade a Full Node

For most cases, download the new binary and replace it, then restart the full node will work. For the special case, you may have to run some extra steps for an incompatible version (hard fork).

## Monitor

Prometheus is enabled on port 26660 by default, and the endpoint is `/metrics`.

## Get Extra Data From Your Full Node

Full node has the same RPC interface as the list here [rpc-api](api-reference/node-rpc.md)

If you want to get extra information about order book, balance changes or block fee changes from blocks, please refer to [get extra data from fullnode](get-extra-data-from-fullnode.md).

