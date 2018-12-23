# Asset Transfer

`Transfer` is the most basic transaction Binance Chain supports, it moves assets among different addresses.

Please note the fees must be paid first in BNB before the transaction can be executioned.

## Account and Balance

Whenever a new address receives any asset, the corresponding transaction would create an `Account` for that address, which contains balances across all assets that are owned on this address.

The balance (the amount of token) of each asset is composed of 3 different parts:

- Available: the amount of token can be transferred, and spent to swap (buy) other assets
- Locked: the amount of token has been used in any outstanding orders. Once the order terminates (either filled, canceled or expired), the locked amount would decrease.
- Frozen: the amount of token has been fronze via `Freeze` transactions.

## Simple Transfer and Memo



## Multi-Send