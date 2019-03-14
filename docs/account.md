# Account and Balance

Each account contains cryptographic authentication info. It is created by a user of blockchain. It also  includes public key, address, and account number/sequence number for replay protection. Whenever a new address receives an asset, the corresponding transaction would create an `Account`for that address, which contains balances across all assets that are owned on this address.

The balance (the amount of token) of each asset is composed of 3 different parts:

- Available: the amount of token can be transferred, and spent to swap (buy) other assets
- Locked: the amount of token has been used in any outstanding orders. Once the order terminates (either filled, canceled or expired), the locked amount would decrease.
- Frozen: the amount of token has been frozen via `Freeze` transactions.

You could query the account info with the following command:

```shell
./bnbcli account <your-account-address> --chain-id=Binance-Chain-Nile --node=data-seed-pre-2-s1.binance.org:80
```

Example output:

```json
{"type":"bnbchain/Account","value":{"base":{"address":"tbnb1sylyjw032eajr9cyllp26n04300qzzre38qyv5","coins":[{"denom":"000-0E1","amount":"10530"},{"denom":"BNB","amount":"247349863800"},{"denom":"BTC.B-918","amount":"113218800"},{"denom":"COSMOS-587","amount":"50000101983748977"},{"denom":"EDU-DD0","amount":"139885964"},{"denom":"MFH-9B5","amount":"1258976083286"},{"denom":"NASC-137","amount":"0"},{"denom":"PPC-00A","amount":"205150260"},{"denom":"TGT-9FC","amount":"33251102828"},{"denom":"UCX-CC8","amount":"1398859649"},{"denom":"USDT.B-B7C","amount":"140456966268"},{"denom":"YLC-D8B","amount":"210572645"},{"denom":"ZZZ-21E","amount":"13988596"}],"public_key":{"type":"tendermint/PubKeySecp256k1","value":"AhOb3ZXecsIqwqKw+HhTscyi6K35xYpKaJx10yYwE0Qa"},"account_number":"406226","sequence":"29"},"name":"","frozen":null,"locked":[{"denom":"KOGE48-35D","amount":"10000000000"}]}}
```

As you can see from the ouput, this account's `account_number` is 406226 and its `sequence` is 29. These are important information about this account. 

