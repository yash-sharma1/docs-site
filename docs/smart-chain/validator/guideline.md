# How to join Binance Smart Chain as Validator?

## Before You Start

### Choose Your Validator hardware

- VPS running recent versions of Mac OS X or Linux.
- 2T GB of free disk space, solid-state drive(SSD).
- 8 cores of CPU and 32 gigabytes of memory (RAM)
- Suggest m5zn.2xlarge instance type on AWS, or c2-standard-8 on Google cloud.
- A broadband Internet connection with upload/download speeds of 10 megabyte per second

### Setup a fullnode at testnet

*If you are running a node in Testnet, 4CPU/8GB of RAM is sufficient*


## Steps to Be a Validator Candidate

### 1. Configure your VPS network ports, ssl, firewall

!!! Note
	If you are running a node in Testnet, 2CPU/8GB of RAM is sufficient.

We recommend using popular cloud providers as their reliability and uptime are close to 100%. These servers would be a good starting point:
* DigitalOcean: CPU optimized droplet 32GB/16CPU
* Amazon EC2: C5 instance
* Google Cloud Engine: n1-highcpu-16

### 2. Install BSC Fullnode

**Option 1: Build from source code**

Make sure that you have installed [Go 1.13+](https://golang.org/doc/install) and have added `GOPATH` to `PATH` environment variable

```bash
git clone https://github.com/binance-chain/bsc
# Enter the folder bsc was cloned into
cd bsc
# Comile and install bsc
make geth
```

**Option 2: Download the binaries**

or you can download the pre-build binaries from [release page](https://github.com/binance-chain/bsc/releases/latest) or follow the instructions below:

```bash
# Linux
wget --no-check-certificate https://github.com/binance-chain/bsc/releases/download/v1.1.0-beta/geth_linux
# MacOS
wget --no-check-certificate https://github.com/binance-chain/bsc/releases/download/v1.1.0-beta/geth_mac
```

**Download the config files**

Download `genesis.json` and `config.toml` by:

```bash
## mainet
wget --no-check-certificate  $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4)
unzip mainnet.zip

## testnet
wget --no-check-certificate  $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep testnet |cut -d\" -f4)
unzip testnet.zip
```

### 3.Write genesis state locally

```bash
geth --datadir node init genesis.json
```

You could see the following output:

```
INFO [05-19|14:53:17.468] Allocated cache and file handles         database=/Users/huangsuyu/Downloads/bsc/node/geth/chaindata cache=16.00MiB handles=16
INFO [05-19|14:53:17.498] Writing custom genesis block
INFO [05-19|14:53:17.501] Persisted trie from memory database      nodes=21 size=56.84KiB time=357.915µs gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=-574.00B
INFO [05-19|14:53:17.502] Successfully wrote genesis state         database=chaindata hash=7d79cc…fb0d1e
INFO [05-19|14:53:17.503] Allocated cache and file handles         database=/Users/huangsuyu/Downloads/bsc/node/geth/lightchaindata cache=16.00MiB handles=16
INFO [05-19|14:53:17.524] Writing custom genesis block
INFO [05-19|14:53:17.525] Persisted trie from memory database      nodes=21 size=56.84KiB time=638.396µs gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=-574.00B
INFO [05-19|14:53:17.528] Successfully wrote genesis state         database=lightchaindata hash=7d79cc…fb0d1e
```


### 4. Start a validator node

* Sync Mode

	* Archive Sync

Archive mode means that all states of values in smart contracts as well as all balances of an account are stored.

You need to create an account that represents a key pair first. Use the following command to create a new account and set a password for that account:
```bash
geth account new --datadir ./node
```

This command will return the public address and the path to your private key. BACKUP of keyfile is necessory!

If you already have an account, use the seed phrase to recover it:

```bash
geth account import --datadir ./node
```

!!! Warning
	Please do not expose your RPC endpoints to public network.

```bash
## generate the consensus key and input the password
geth account new --datadir ./node
echo {your-password} > password.txt
geth --config ./config.toml --datadir ./node --syncmode snap -unlock {your-validator-address} --password password.txt  --mine  --allow-insecure-unlock --cache 18000
```

!!! Note
	Because the default value of `TrieTimeout` in config.toml is large, it means `geth` will not persist state into database until reach this time threshold, if the node has been force shutdown, it will start syncing from last state which may take long time. The recommended setting for valiidators is `TrieTimeout = 100000000000`

### Wait for node to sync

Your node should now be catching up with the network by replaying all the transactions from genesis and recreating the blockchain state locally. This will take a long time, so make sure you've set it up on a stable connection so you can leave while it syncs.

View the status of the network with [https://bscscan.com/](https://bscscan.com/).

You can monitor the status from log: `$HOME/node/bsc.log` by default.

Congratulations! You've now successfully joined a network as a [full node](../developer/fullnode.md) operator.

### Using a data backup (recommended for the mainnet)

If you are connecting to an existing network for which you have a data backup (from a provider you trust), you can optionally load the backup into your node storage rather than syncing from scratch. Learn more [here](../developer/snapshot.md)

### 5. Declare Candidacy

You can use `bnbcli` or`tbnbcli` binaryto declare your candidacy by self-stake some of BNB


Staking On Binance Chain

* Download `bnbcli` from [GitHub](https://github.com/binance-chain/node-binary/tree/master/cli/prod/0.8.2)
* Download `tbnbcli `from [GitHub](https://github.com/binance-chain/node-binary/tree/master/cli/testnet/0.8.1)

Use `bnbcli` to create an account or recover an account, make sure the account get more than 100 BNB. You can get BNB from https://testnet.binance.org/faucet-smart, but the BNB is on Binance Smart Chain, you can follow the guide to transfer BNB from BSC to BC.

Before sending `create-validator` transaction, make sure your bsc validator have already catched up. Command for create validator:

Example on mainnet

```
bnbcli staking bsc-create-validator \
-side-cons-addr {validator address} \
--side-fee-addr {wallet address on BSC} \
--address-delegator {wallet address on BC} \
--side-chain-id bsc \
--amount 10000000000:BNB \
--commission-rate {10000000 represent 10%} \
--commission-max-rate {20000000 represent 20%} \
--commission-max-change-rate {500000000 represent 5%} \
--moniker {validator name} \
--details {validator detailed description} \
--identity {keybase identity} \
--website {website for validator} \
--from {key name} \
--chain-id Binance-Chain-Tigris \
--node https://dataseed5.defibit.io:443
```
Example on testnet

```
tbnbcli staking bsc-create-validator \
--side-cons-addr {validator address} \
--side-fee-addr {wallet address on BSC} \
--address-delegator {wallet address on BC} \
--side-chain-id chapel \
--amount 10000000000:BNB \
--commission-rate {10000000 represent 10%} \
--commission-max-rate {20000000 represent 20%} \
--commission-max-change-rate {10000000 represent 1%} \
--moniker {validator name} \
--details {validator detailed description} \
--identity {keybase identity} \
--website {website for validator} \
--from {key name} \
--chain-id Binance-Chain-Ganges \
--node=http://data-seed-pre-1-s3.binance.org:80
```

Especially now that the side-cons-addr is the address you unlock when start the bsc node.

Read the detailed manual [here](../../guides/concepts/bc-staking.md)

Go to [explorer](https://explorer.binance.org/) to verify your transactions.

### 5.Monitor node status

To get started quickly, run GethExporter in a Docker container.

```
docker run -it -d -p 9090:9090 \
  -e "GETH=http://mygethserverhere.com:8545" \
  hunterlong/gethexporter
```

![](https://grafana.com/api/dashboards/6976/images/4471/image)

### 6. Update validator prodile

You can submit a PullRequest to this repository to update your information: <https://github.com/binance-chain/validator-directory>

Reference: <https://grafana.com/grafana/dashboards/6976>


## Publish Validator Information

Please submit a Pull Request to this repo <https://github.com/binance-chain/validator-directory>

This repository is a place for validator candidates to give potential delegators a brief introduction about your team and infrastructure, and present your ecosystem contributions.