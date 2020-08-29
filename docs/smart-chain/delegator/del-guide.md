# How to Delegate

## Create an account

Please refer to this guide on [how to create a wallet](../wallet/metamask.md) with MetaMask

## Choose a validator

You can use `tbnbcli` for querying the [list of current validators](../../guides/concepts/bc-staking.md#query-side-chain-top-validators).

```bash
## mainnet
bnbcli staking side-top-validators --top 10 --side-chain-id=bsc --chain-id=Binance-Chain-Tigris

## testnet
tbnbcli staking side-top-validators --top 10 --side-chain-id=chapel --chain-id=Binance-Chain-Ganges
```

## Delegate BNB

You can use `bnbcli` to [delegate](../../guides/concepts/bc-staking.md#delegate-bnb) some of BNB to a validator

Go to [explorer](https://explorer.binance.org/) to verify your transactions.

## Undelegate BNB

You can use `bnbcli` to [undelegate](../../guides/concepts/bc-staking.md#undelegate-bnb) some bonded BNB from a validator

## For Testnet

### Get some testnet fund from faucet

Go to this faucet page: <https://testnet.binance.org/faucet-smart>

### Transfer BNB from BSC to BC

Please refer to this [guide](../validator/cross-chain-transfer.md)