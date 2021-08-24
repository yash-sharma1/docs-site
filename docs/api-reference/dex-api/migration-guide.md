# Migration Guide

## Target Audience
This guide will help users migrate their existing calls of [/api/v1/transactions-in-block](https://docs.binance.org/api-reference/dex-api/paths.html#apiv1transactions-in-blockblockheight), [/api/v2/transactions-in-block](https://docs.binance.org/api-reference/dex-api/paths.html#apiv2transactions-in-blockblockheight), [/api/v1/transactions](https://docs.binance.org/api-reference/dex-api/paths.html#apiv1transactions) to the new bock and transaction apis.

If you are also using undisclosed apis from [Explorer](https://explorer.binance.org), you can also refer to this document for migration.

If you are using java-sdk to query transactions (i.e., using REST getTransactions methods), please upgrade [SDK version](https://github.com/binance-chain/java-sdk/pull/120) for migration, this document is also useful for understanding the details.


## Migration of /api/v1/transactions-in-block, /api/v2/transactions-in-block
### New API

Please call [/api/v1/blocks/{blockHeight}/txs](http://api.binance.org/bc/api/v1/blocks/{height}/txs) instead.

#### Base Url
Mainnet base path: [https://api.binance.org/bc/](https://api.binance.org/bc/)

Testnet base path: [https://testnet-api.binance.org/bc/](https://testnet-api.binance.org/bc/)



### Main Strengthens
* The new api can query all historical blocks' transactions, not only blocks in the past 24 hours.
* The rate limit is 1000 requests per ip in 5 minutes, which is much bigger comparing to the rate limits of /api/v1/transactions-in-block, /api/v2/transactions-in-block.

### Migration Cautions
* All the amount/quantity/price/fee will be returned as Long. For converting them to floats (as old response in /api/v1/transactions-in-block, /api/v2/transactions-in-block), you need to divide them by 10e8.
* For the *data* field, the response in new api could be different, please refer to the [tx examples](block-service-example.md) for more details.


## Migration of /api/v1/transactions
### New API

Please call [/api/v1/txs](http://api.binance.org/bc/api/v1/txs?address={address}&startTime={startTime}&endTime={endTime}) instead.


#### Base Url
Mainnet base path: [https://api.binance.org/bc/](https://api.binance.org/bc/)

Testnet base path: [https://testnet-api.binance.org/bc/](https://testnet-api.binance.org/bc/)


### Main Strengthens
* Cross chain support
    * You can search CROSS_TRANSFER_OUT transactions by using BC or BSC addresses.
    * You can search CREATE_SIDECHAIN_VALIDATOR, SIDECHAIN_DELEGATE, SIDECHAIN_REDELEGATE, SIDECHAIN_UNBOND transactions by using validator address.
* Optimization of *address* parameter
    * You can search multi send transfers by any address involved in the transaction.
    * You can search HTL_TRANSFER transactions by any address involved in the transaction.
* Optimization of *asset* parameter
    * You can search NEW_ORDER, CANCEL_ORDER, MINI_TOKEN_LIST, LISTING transactions using base or quote asset.
    * You can search SUBMIT_PROPOSAL, SIDE_SUBMIT_PROPOSAL transaction if the related proposal is Listing.
    * You can search DEPOSIT_HTL HTL_TRANSFER, SIDE_DEPOSIT, TIME_LOCK, TIME_RELOCK, TRANSFER transactions by any kind of asset involved in the transactions.
* The rate limit is 500 requests per ip in 5 minutes, which is much bigger comparing to the rate limit of /api/v1/transactions.

### Migration Cautions

* Some query parameter names changed (e.g., txAsset->asset, txType->type), and some parameters are removed (e.g., blockHeight), please do read the new api docs.
* All the amount/quantity/price/fee will be returned as Long. For converting them to floats (as old response in /api/v1/transactions), you need to divide them by 10e8.
* For the *data* field, the response in new api could be different, please refer to the [tx examples](block-service-example.md) for more details.
* For query parameters *address* and *asset*, if the address/asset does not exist on chain, the new api will return 404 http status code.


## Migration of Java SDK

Please upgrade Java SDK to the [latest version](https://github.com/binance-chain/java-sdk/releases/tag/v1.1.2). 

### Related Methods
* getTransactions(TransactionsRequest request) will return transactions with new data model TransactionPageV2
* getTransactions(String address) will return transactions for an address in last 24 hours with new data model TransactionPageV2

You can refer to TransactionExample.java to see how to use these methods.