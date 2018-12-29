# Asset Management

Assets are stored as `tokens` on Binance Chain, and the below management actions are available.

Please note the fees must be paid first in BNB before the transaction can be executed.

## Issue

`Issue` is a transaction used to create a new asset. Anyone can issue a new token with fee paid. After issuing, the token would appear in the issuer's account as free balance.

An issuance transaction contains:

* Source Address: the sender address of the transaction and it will become the `owner` of the token, all created tokens will be in this account.
* Token Name: it is the long official name, such as "Binance Coin". It is limited to 20 characters.
* Symbol: identifier of the token, limited to 8 alphanumeric characters and is case insensitive, for example, "BNB". ".B" suffixed symbol is also allowed for migrating these tokens already exist on other chains. The symbol do not need to be unique, a random 3 letters would be appended, after a "-", to the provided symbol to avoid uniqueness constraint. for example, "NNB-B90". Only BNB does not have this suffix.
* Total Supply: an int64 boosted by 1e8 for decimal part. The max total supply is 90 billion.
* Mintable: that means whether this token can be minted in the future. Default is false.

```bash
# To issue a NNB token with total-supply 1 billion
> bnbcli token issue --token-name "new bnb" --total-supply 100000000000000000 --symbol NNB --from alice --trust-node

Committed at block 1887 (tx hash: B90A055DDD570AE42A7050182993A0B4DBC81A0D, ... Issued NNB-B90...)
```

## Mint
Tokens that is "mintable"(specified when issue) can use this function. The total supply after mint is still restricted by 90 billion. Note only the `owner` of the token can use this transaction.

```bash
 > bnbcli token mint --amount 100000000000000000 --symbol NNB-B90 --from alice --trust-node
```

## Burn
Burn is to destroy certain amount of token, after which that amount of tokens will be subtracted from the operator's balance. The total supply will be updated at the same time. Notice that only the owner of the token has the permission to burn token.

```bash
 > bnbcli token burn --amount 100000000000000000 --symbol NNB-B90 --from alice --trust-node
```

## Freeze & Unfreeze
Freeze would move the specified amount of token into "frozen" status, so that these tokens can not transferred, spent in orders or any other transaction until they are unfreezed.

Anyone can (only) freeze or unfreeze tokens on their account with status in "free".

```bash
> bnbcli token freeze --amount 20000000000000000 --symbol NNB-B90 --from alice --trust-node
```

```bash
> bnbcli token unfreeze --amount 20000000000000000 --symbol NNB-B90 --from alice --trust-node
```
