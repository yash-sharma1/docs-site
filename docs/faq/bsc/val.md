# Binance Smart Chain Validator

## How does a validator node work?

It powers the blockchain network by processing transactions and signing blocks.

## What are the incentives to run a validator node?

Validators and delegators will earn rewards from transaction fees: dApp usages

## What's on-chain governance proposal?

The proposal will decide: slash amount, cross-chain transfer fees

## How to join testnet as a validator?

1. Chooe your own server/PC
2. Install software:
3. Create a wallet and get some BNB
4. Run your fullnode and keep it synced
5. Stake your BNB on BC, the top 21 most staked nodes to be the validator set

## How to join mainnet as a validator?

1. Chooe your own server/PC
2. Install software:
3. Create a wallet and get some BNB
4. Run your fullnode and keep it synced
5. Stake your BNB on BC, the top 21 most staked nodes to be the validator set"

## What are hardware requirements of running a validator node?

Processing transactions is mostly CPU bound. Therefore we recommend running CPU optimized servers.
Directly facing internet (public IP, no NAT)
8 cores CPU
16GB of RAM
500 SSD storage"

## How many BNB are required to create a validator?

The [minimum self-delegated amount](../../smart-chain/validator/Parameters.md) is **50000BNB**.

## When are rewards paid out?

The rewards will not be sent to validator right away, instead, they will be distributed and accumulated on a contract. The reward distribution happens on BC around every day UTC 00:00.

## What's the potential loss for validators?

Validators can suffer from “Slashing”, a punishment for their bad behaviors, such as double sign and/or instability. Such loss will be shared by their delegators as well.