# Validator Guide

## What is Binance Smart Chain?

Binance Smart Chain is an innovative solution to bring programmability and interoperability to Binance Chain. Binance Smart Chain relies on a system of 21 validators with [Proof of Staked Authority (PoSA) consensus](https://github.com/binance-chain/whitepaper/blob/master/WHITEPAPER.md#consensus-and-validator-quorum) that can support short block time and lower fees. The most bonded validator candidates of staking will become validators and produce blocks. The double-sign detection and other slashing logic guarantee security, stability, and chain finality.

## What is Validator?

Binance Smart Chain relies on a set of validators who are responsible for committing new blocks in the blockchain. These validators participate in the consensus protocol by signing blocks which contain cryptographic signatures signed by each validator's private key.  The validator set is determined by a staking module built on Binance Chain for Binance Smart Chain, and propagated every day UTC 00:00 from BC to BSC via Cross-Chain communication.


## Ecomonics

Validators rewards come from transaction fees and commission fees from delegators.

Let us also assume that the reward for a block is 100 BNB and that a certaiin validator has 20% of self-bonded BNB. These tokens do not go directly to the proposer. Instead, they are shared  among validator and delegators.  These 100 BNB will be distributed according to each participant's stake:

Commission: 80*20%= 16 BNB
Validator gets: 100\*20% + Commission = 36 BNB
All delegators get: 100\*80% - Commission = 64 BNB

If validators double sign, are frequently offline, their staked BNB ( not including BNB of users that delegated to them) can be slashed. The penalty depends on the severity of the violation.

Read the details about slashing conditions in this [doc]()


You can learn see the revenue hiiistory from BitQuery's [chart](https://explorer.bitquery.io/bsc/miners) or a table of [BscScan](https://bscscan.com/validatorset)

## Hardware

It's recommended to run BSC software in VPS Servers (both with firewall):

	* **DigitalOcean**: [CPU optimized droplet](https://www.digitalocean.com/docs/droplets/resources/choose-plan/)

	* **Amazon EC2**: [C5 instance](https://aws.amazon.com/ec2/instance-types/c5/)

	* **Google Cloud Engine**: [General-purpose (N1)](https://cloud.google.com/compute/docs/machine-types)

*  Memory: 16 GB of RAM

*  Disk space: 2 TB of SSD storage (no normal hard disk or network hard disk)

*  CPU: 64-bit

*  Network: 1GB fiber


*If you are running a node in Testnet, 4CPU/8GB of RAM is sufficient*

