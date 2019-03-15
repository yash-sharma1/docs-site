HTTP API
========
The Binance Chain HTTP API provides access to a Binance Chain node deployment and market data services.

**Version:** 1.0.0

**License:** [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

### /api/v1/time
---
##### ***GET***
**Summary:** Get the block time.

**Description:** Gets the latest block time and the current time according to the HTTP service.

**Destination:** Validator node.

**Rate Limit:** 1 request per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/time](https://testnet-dex.binance.org/api/v1/time)


**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [Times](#times) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/node-info
---
##### ***GET***
**Summary:** Get node information.

**Description:** Gets runtime information about the node.

**Destination:** Validator node.

**Rate Limit:** 1 request per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/node-info](https://testnet-dex.binance.org/api/v1/node-info)


**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | object |

### /api/v1/validators
---
##### ***GET***
**Summary:** Get validators.

**Description:** Gets the list of validators used in consensus.

**Destination:** Witness node.

**Rate Limit:** 10 requests per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/validators](https://testnet-dex.binance.org/api/v1/validators)


**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [ [Validator](#validator) ] |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/peers
---
##### ***GET***
**Summary:** Get network peers.

**Description:** Gets the list of network peers.

**Destination:** Witness node.

**Rate Limit:** 1 request per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/peers](https://testnet-dex.binance.org/api/v1/peers)


**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [ [Peer](#peer) ] |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/account/{address}
---
##### ***GET***
**Summary:** Get an account.

**Description:** Gets account metadata for an address.

**Destination:** Witness node.

**Rate Limit:** 5 requests per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/account/tbnb185tqzq3j6y7yep85lncaz9qeectjxqe5054cgn](https://testnet-dex.binance.org/api/v1/account/tbnb185tqzq3j6y7yep85lncaz9qeectjxqe5054cgn)


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | The account address to query | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [Account](#account) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/account/{address}/sequence
---
##### ***GET***
**Summary:** Get an account sequence.

**Description:** Gets an account sequence for an address.

**Destination:** Validator node.

**Rate Limit:** 5 requests per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/account/tbnb13g2le062t340klgm2l2khzr57y3qxlekuhfuch/sequence](https://testnet-dex.binance.org/api/v1/account/tbnb13g2le062t340klgm2l2khzr57y3qxlekuhfuch/sequence)


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | The account address to query | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [AccountSequence](#accountsequence) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/tx/{hash}
---
##### ***GET***
**Summary:** Get a transaction.

**Description:** Gets transaction metadata by transaction ID. By default, transactions are returned in a raw format. You may add `?format=json` to the end of the path to obtain a more readable response.

**Destination:** Seed node.

**Rate Limit:** 10 requests per IP per second.

**Example:**

Below is an example response of a send transaction when `?format=json` is used.
```
{
    "hash": "E81BAB8E555819E4211D62E2E536B6D5812D3D91C105F998F5C6EB3AB8136482",
    "height": "754",
    "tx": {
        "type": "auth/StdTx", // fixed, type of transaction
        "value": {            // fixed, detail of the transaction
            "data": null,     // fixed, data of the transaction
            "memo": "",       // fixed, memo
            "msg": [          // fixed, msgs of the transaction
                {
                    "type": "cosmos-sdk/Send",  // vary with msg type
                    "value": {                  // value content vary with mst type
                        "inputs": [
                            {
                                "address": "bnb1vt4zwu5hy7tyryktud6mpcu8h2ehh6xw66gzwp",
                                "coins": [
                                    {
                                        "amount": "100000000000000",
                                        "denom": "BNB"
                                    }
                                ]
                            }
                        ],
                        "outputs": [
                            {
                                "address": "bnb1kg8mh20tndur9d9rry4wjunhpfzcud30qzf0qv",
                                "coins": [
                                    {
                                        "amount": "100000000000000",
                                        "denom": "BNB"
                                    }
                                ]
                            }
                        ]
                    }
                }
            ],
            "signatures": [ // fixed, signatures of the transaction
                {
                    "account_number": "0",
                    "pub_key": {
                        "type": "tendermint/PubKeySecp256k1",
                        "value": "AoWY3eWBOnnvLPTz4RsUlX1pWCkLLPewu1vAAoTEzxzR"
                    },
                    "sequence": "1",
                    "signature": "6O2TQAgleFNPw4zIWBLaNvOf5dR7DHNSr2DwAPeFK6lokRqZd2KR2BD+WlmaWj4LdLo5N+utN1JtY41E91N0uw=="
                }
            ],
            "source": "0"  // fixed, source of the transaction
        }
    }
}
```


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| hash | path | The transaction hash to query | Yes | string |
| format | query | Response format (`json` or omit) | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [Transaction](#transaction) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/tokens
---
##### ***GET***
**Summary:** Get tokens list.

**Description:** Gets a list of tokens that have been issued.

**Destination:** Witness node.

**Rate Limit:** 1 request per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/tokens](https://testnet-dex.binance.org/api/v1/tokens)

**Example:**

Below is an example response of  token query:
```json
[{"name":"100K TOKEN Not Mintable","symbol":"100K-9BC","original_symbol":"100K","total_supply":"100000.00000000","owner":"tbnb1228u39qa7gv5373dg00d2m4y7aypupx2cp66mc","mintable":false},{"name":"Only 10000 Tokens NOT MINTABLE","symbol":"10KONLY-2C1","original_symbol":"10KONLY","total_supply":"10000.00000000","owner":"tbnb19m70v0u2ppdnklpv607l3cgm5fqn2j9n3r4j09","mintable":false},{"name":"Only 10000 Tokens NOT MINTABLE","symbol":"10KONLY-351","original_symbol":"10KONLY","total_supply":"1000.00000000","owner":"tbnb19m70v0u2ppdnklpv607l3cgm5fqn2j9n3r4j09","mintable":false},{"name":"xuNsh1ne","symbol":"1337-1A9","original_symbol":"1337","total_supply":"1000000000.00000000","owner":"tbnb1vdvrpze3rt6r0fhchwnzpsnpjqnmh4nw09m94a","mintable":true},{"name":"Elite Will Moon Last","symbol":"1337MOON-B51","original_symbol":"1337MOON","total_supply":"90000000000.00000000","owner":"tbnb17ynkkkxh92fqn9p9upd4nd5d0u9yal8lpxqa0d","mintable":false},{"name":"1k Supply Experiment Volume Coin","symbol":"1KVOLUME-736","original_symbol":"1KVOLUME","total_supply":"1000.00000000","owner":"tbnb18t67xvg9jwjl4v02akpusak05fhq2qf4qc2w5t","mintable":false},{"name":"1k Supply Experiment Volume Coin","symbol":"1KVOLUME-D65","original_symbol":"1KVOLUME","total_supply":"80000001000.00000000","owner":"tbnb18t67xvg9jwjl4v02akpusak05fhq2qf4qc2w5t","mintable":true},{"name":"80DASHOU","symbol":"80DASHOU-729","original_symbol":"80DASHOU","total_supply":"10000.00000000","owner":"tbnb1hjvyltdgc5kks6a9fatd89au2j6hhtev3c225a","mintable":true},{"name":"81JIANJUN","symbol":"81JIAN-3E8","original_symbol":"81JIAN","total_supply":"10000.00000000","owner":"tbnb1wcs3tcn3hh4q9mvjhq5e5x7glrqsw9cxedjgh7","mintable":true},{"name":"82XIYOU","symbol":"82XIYOU-34D","original_symbol":"82XIYOU","total_supply":"10000.00000000","owner":"tbnb1qzpyce084aj9eguqyqwdmz7kvs8fqz90lu0d56","mintable":true},{"name":"83SHUIHU","symbol":"83SHUIHU-AC4","original_symbol":"83SHUIHU","total_supply":"10000.00000000","owner":"tbnb1lguzx55tkn94kyjkcpvkav78zj50cv7qdzm9al","mintable":true},{"name":"83SHEDIAO","symbol":"84SHEDAO-F6F","original_symbol":"84SHEDAO","total_supply":"10000.00000000","owner":"tbnb10crx0zx58atrz8gu9qf5dtt08hp0r4cx2qj7fy","mintable":true},{"name":"85SHEDIAO","symbol":"85DUC-800","original_symbol":"85DUC","total_supply":"10000.00000000","owner":"tbnb1gwv738uvydscqffqgqw4rsfn50sm8ypsu2k6yq","mintable":true},{"name":"MEIWENTI","symbol":"86OK-B90","original_symbol":"86OK","total_supply":"10000.00000000","owner":"tbnb1ahkt4q2wfrquyfpjju6uc2t0hkak72wp9qhktq","mintable":true},{"name":"MEIWENTI","symbol":"87KEYI-248","original_symbol":"87KEYI","total_supply":"10000.00000000","owner":"tbnb15ekcrp2cs54sce7re8jhrmzhfu42nh5rnn32hu","mintable":true},{"name":"MEIWENTI","symbol":"8888-E6D","original_symbol":"8888","total_supply":"10000.00000000","owner":"tbnb17zvfykec227d8rxteymxqmnff3rahdmtlrsf2f","mintable":true},{"name":"8989","symbol":"8989-4DC","original_symbol":"8989","total_supply":"10000.00000000","owner":"tbnb1wu2a2yg6d3fd9h7reetel07eg5xgcs5k42nz4f","mintable":true},{"name":"AAA","symbol":"AAA-25F","original_symbol":"AAA","total_supply":"1000000000.00000000","owner":"tbnb1jyyl59pnduzadyx28fv9ed3jqeczzeskqrchkg","mintable":true},{"name":"“BATTERY”","symbol":"AAA-B50","original_symbol":"AAA","total_supply":"1000000000.00000000","owner":"tbnb1ejfew3fqula4cj9tux7kzm9mc7we8qfu94ess5","mintable":true},{"name":"AAA insurance coin","symbol":"AAA-EB8","original_symbol":"AAA","total_supply":"200000000.00000000","owner":"tbnb1zkpj55vl8ntc849wgr2x6cw8rw5jq52e582fry","mintable":false}]
```
**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| limit | query | default 500; max 1000. | No | integer |
| offset | query | start with 0; default 0. | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [ [Token](#token) ] |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/markets
---
##### ***GET***
**Summary:** Get market pairs.

**Description:** Gets the list of market pairs that have been listed.

**Destination:** Witness node.

**Rate Limit:** 1 request per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/markets](https://testnet-dex.binance.org/api/v1/markets)
**Example:**

Below is an example response of market query:

```json
[{"base_asset_symbol":"1KVOLUME-D65","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00010000","lot_size":"0.00010000"},{"base_asset_symbol":"80DASHOU-729","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"81JIAN-3E8","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"82XIYOU-34D","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"83SHUIHU-AC4","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"84SHEDAO-F6F","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"85DUC-800","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"86OK-B90","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"87KEYI-248","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"},{"base_asset_symbol":"8888-E6D","quote_asset_symbol":"BNB","price":"1.00000000","tick_size":"0.00001000","lot_size":"0.00100000"}]
```



**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| limit | query | default 500; max 1000. | No | integer |
| offset | query | start with 0; default 0. | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [ [Market](#market) ] |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/fees
---
##### ***GET***
**Summary:** Obtain trading fees information.

**Description:** Gets the current trading fees settings.

**Destination:** Witness node.

**Rate Limit:** 1 request per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/fees](https://testnet-dex.binance.org/api/v1/fees)


**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [ [Fee](#fee) ] |
| default | Generic error response | [Error](#error) |

### /api/v1/depth
---
##### ***GET***
**Summary:** Get the order book.

**Description:** Gets the order book depth data for a given pair symbol.

The given _limit_ must be one of the allowed limits below.

**Destination:** Validator node.

**Rate Limit:** 10 requests per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/depth?symbol=xxx-000_BNB](https://testnet-dex.binance.org/api/v1/depth?symbol=xxx-000_BNB)


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| symbol | query | Market pair symbol, e.g. NNB-0AD_BNB | Yes | string |
| limit | query | The limit of results. Allowed limits: [5, 10, 20, 50, 100, 500, 1000] | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [MarketDepth](#marketdepth) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/broadcast
---
##### ***POST***
**Summary:** Broadcast a transaction.

**Description:** Broadcasts a signed transaction. A single transaction must be sent hex-encoded with a `content-type` of `text/plain`.

**Destination:** Witness node.

**Rate Limit:** 5 requests per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/broadcast](https://testnet-dex.binance.org/api/v1/broadcast)


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| sync | query | Synchronous broadcast (wait for [DeliverTx](https://github.com/tendermint/tendermint/wiki/Application-Developers#delivertx))?  | No | boolean |
| body | body |  | Yes | binary |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success | [ [Transaction](#transaction) ] |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/klines
---
##### ***GET***
**Summary:** Get candlestick bars.

**Description:** Gets candlestick/kline bars for a symbol. Bars are uniquely identified by their open time.

If the time window is larger than limits, only the first n klines will return. In this case, please either shrink the window or increase the limit to get proper amount of klines.

**Rate Limit:** 10 requests per IP per second.

**Test URL:** [https://testnet-dex.binance.org/api/v1/klines?symbol=NNB-338_BNB&interval=5m](https://testnet-dex.binance.org/api/v1/klines?symbol=NNB-338_BNB&interval=5m)

**Example**

```
[
  1499040000000,      // Open time
  "0.01634790",       // Open
  "0.80000000",       // High
  "0.01575800",       // Low
  "0.01577100",       // Close
  "148976.11427815",  // Volume
  1499644799999,      // Close time
  "2434.19055334",    // Quote asset volume
  308                // Number of trades
]
```


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| symbol | query | symbol | Yes | string |
| interval | query | interval. Allowed value: [1m, 3m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 8h, 12h, 1d, 3d, 1w, 1M] | Yes | string |
| limit | query | default 300; max 1000. | No | integer |
| startTime | query | start time | No | long |
| endTime | query | end time | No | long |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Candlestick](#candlestick) ] |

### /api/v1/orders/closed
---
##### ***GET***
**Summary:** Get closed orders.

**Description:** Gets closed (filled and cancelled) orders for a given address.

**Query Window:** Default query window is latest 7 days; The maximum start - end query window is 3 months.

**Rate Limit:** 5 requests per IP per second.


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | query | the owner address | Yes | string |
| end | query | end time | No | long |
| limit | query | default 500; max 1000. | No | integer |
| offset | query | start with 0; default 0. | No | integer |
| side | query | order side. 1 for buy and 2 for sell. | No | integer |
| start | query | start time; | No | long |
| status | query | order status list. Allowed value: [Ack, PartialFill, IocNoFill, FullyFill, Canceled, Expired, FailedBlocking, FailedMatching] | No | [ string ] |
| symbol | query | symbol | No | string |
| total | query | total number required, 0 for not required and 1 for required; default not required, return total=-1 in response | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [OrderList](#orderlist) |

### /api/v1/orders/open
---
##### ***GET***
**Summary:** Get open orders.

**Description:** Gets open orders for a given address.

**Rate Limit:** 5 requests per IP per second.


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | query | the owner address | Yes | string |
| limit | query | default 500; max 1000. | No | integer |
| offset | query | start with 0; default 0. | No | integer |
| symbol | query | symbol | No | string |
| total | query | total number required, 0 for not required and 1 for required; default not required, return total=-1 in response | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [OrderList](#orderlist) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/orders/{id}
---
##### ***GET***
**Summary:** Get an order.

**Description:** Gets metadata for an individual order by its ID.

**Rate Limit:** 5 requests per IP per second.


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| id | path | order id | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Order](#order) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/ticker/24hr
---
##### ***GET***
**Summary:** Get a market ticker.

**Description:** Gets 24 hour price change statistics for a market pair symbol.

**Rate Limit:** 5 requests per IP per second.


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| symbol | query | symbol | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [TickerStatistics](#tickerstatistics) ] |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/trades
---
##### ***GET***
**Summary:** Get market trades.

**Description:** Gets a list of historical trades.

**Query Window:** Default query window is latest 7 days; The maximum start - end query window is 3 months.

**Rate Limit:** 5 requests per IP per second.


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | query | the buyer/seller address | No | string |
| buyerOrderId | query | buyer order id | No | string |
| end | query | end time | No | long |
| height | query | block height | No | long |
| limit | query | default 500; max 1000. | No | integer |
| offset | query | start with 0; default 0. | No | integer |
| quoteAsset | query | quote asset | No | string |
| sellerOrderId | query | seller order id | No | string |
| side | query | order side. 1 for buy and 2 for sell. | No | integer |
| start | query | start time; | No | long |
| symbol | query | symbol | No | string |
| total | query | total number required, 0 for not required and 1 for required; default not required, return total=-1 in response | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TradePage](#tradepage) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### /api/v1/transactions
---
##### ***GET***
**Summary:** Get transactions.

**Description:** Gets a list of transactions. Multisend transaction is not available in this API.

**Query Window:** Default query window is latest 24 hours; The maximum start - end query window is 3 months.

**Rate Limit:** 60 requests per IP per minute.


**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | query | address | Yes | string |
| blockHeight | query | blockHeight | No | long |
| endTime | query | endTime | No | long |
| limit | query | limit | No | integer |
| offset | query | offset | No | integer |
| side | query | transaction side. Allowed value: [ RECEIVE, SEND] | No | string |
| startTime | query | start time; | No | long |
| txAsset | query | txAsset | No | string |
| txType | query | transaction type. Allowed value: [ NEW_ORDER,ISSUE_TOKEN,BURN_TOKEN,LIST_TOKEN,CANCEL_ORDER,FREEZE_TOKEN,UN_FREEZE_TOKEN,TRANSFER,PROPOSAL,VOTE,MINT,DEPOSIT] | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TxPage](#txpage) |
| 400 | Bad Request | [Error](#error) |
| 404 | Not Found |  |
| default | Generic error response | [Error](#error) |

### Models
---

### Error  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | long |  |  |
| message | string |  |  |

### Times  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| ap_time | string | e.g. 2019-01-21T10:30:00Z |  |
| block_time | string | format as above |  |

### Validator  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| block_height | long | Current block height |  |
| validators | [  ] |  |  |

### Peer  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| id | string | Authenticated identifier |  |
| original_listen_addr | string (RemoteAddr) | Original listen address before PeersService changed it |  |
| listen_addr | string (RemoteAddr) | Listen address |  |
| access_addr | string (RemoteAddr) | Access address (HTTP) |  |
| stream_addr | string (RemoteAddr) | Stream address (WS) |  |
| network | string | Chain ID |  |
| version | string | Version |  |
| moniker | string | Moniker (Name) |  |
| capabilities | [ string ] | Array of capability tags: node, qs, ap, ws | node,ap |
| accelerated | boolean | Is an accelerated path to a validator node |  |

### Transaction  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| hash | string | Hash of transaction |  |
| log | string | Log of transaction |  |
| data | string | Data of transaction |  |
| tx | object | Detail of transaction, like transaction type, messages and signature

For example, below is the detail of a send transaction. Most of the fields are fixed, but the detail of msg
varies with msg type.

```
{
    "type": "auth/StdTx", // fixed, type of transaction
    "value": {            // fixed, detail of the transaction
        "data": null,     // fixed, data of the transaction
        "memo": "",       // fixed, memo
        "msg": [          // fixed, msgs of the transaction
            {
                "type": "cosmos-sdk/Send",  // vary with msg type
                "value": {                  // value content vary with mst type
                    "inputs": [
                        {
                            "address": "bnb1vt4zwu5hy7tyryktud6mpcu8h2ehh6xw66gzwp",
                            "coins": [
                                {
                                    "amount": "100000000000000",
                                    "denom": "BNB"
                                }
                            ]
                        }
                    ],
                    "outputs": [
                        {
                            "address": "bnb1kg8mh20tndur9d9rry4wjunhpfzcud30qzf0qv",
                            "coins": [
                                {
                                    "amount": "100000000000000",
                                    "denom": "BNB"
                                }
                            ]
                        }
                    ]
                }
            }
        ],
        "signatures": [ // fixed, signatures of the transaction
            {
                "account_number": "0",
                "pub_key": {
                    "type": "tendermint/PubKeySecp256k1",
                    "value": "AoWY3eWBOnnvLPTz4RsUlX1pWCkLLPewu1vAAoTEzxzR"
                },
                "sequence": "1",
                "signature": "6O2TQAgleFNPw4zIWBLaNvOf5dR7DHNSr2DwAPeFK6lokRqZd2KR2BD+WlmaWj4LdLo5N+utN1JtY41E91N0uw=="
            }
        ],
        "source": "0"  // fixed, source of the transaction
    }
}
```
 |  |
| height | string | Height of transaction |  |
| code | integer | Result code of transaction |  |
| ok | boolean |  |  |

### Account  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| account_number | integer |  |  |
| address | string (address) |  |  |
| balances | [ [Balance](#balance) ] |  |  |
| public_key | [ integer ] | Public key bytes |  |
| sequence | long |  |  |

### AccountSequence  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| sequence | long |  |  |

### Balance  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| symbol | string (currency) |  | BNB |
| free | string (fixed8) | In decimal form, e.g. 0.00000000 | 0.00000000 |
| locked | string (fixed8) | In decimal form, e.g. 0.00000000 | 0.00000000 |
| frozen | string (fixed8) | In decimal form, e.g. 0.00000000 | 0.00000000 |

### Token  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| name | string |  | Binance Chain Native Token |
| symbol | string |  | BTC-000 |
| original_symbol | string |  | BTC |
| total_supply | string (fixed8) | In decimal form, e.g. 1.00000000 | 0.00000000 |
| owner | string (address) | Address |  |

### Market  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| base_asset_symbol | string (currency) |  | BNB |
| quote_asset_symbol | string (currency) |  | BNB |
| price | string (fixed8) | In decimal form, e.g. 1.00000000 | 0.00000000 |
| tick_size | string (fixed8) | In decimal form, e.g. 1.00000000 | 0.00000000 |
| lot_size | string (fixed8) | In decimal form, e.g. 1.00000000 | 0.00000000 |

### Fee  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| msg_type | string | Transaction msg type that this fee applies to | submit_proposal |
| fee | number | The fee amount | 1000000000 |
| fee_for | integer | 1 = proposer, 2 = all, 3 = free | 1 |
| multi_transfer_fee | string | Fee for multi-transfer | 200000 |
| lower_limit_as_multi | string | e.g. 2 | 2 |
| fixed_fee_params | [FixedFeeParams](#fixedfeeparams) | Set if the fee is fixed |  |

### FixedFeeParams  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| msg_type | string | Transaction msg type that this fee applies to | submit_proposal |
| fee | number | The fixed fee amount | 1000000000 |
| fee_for | integer | 1 = proposer, 2 = all, 3 = free | 1 |

### MarketDepth  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| asks | [ string (fixed8) ] | Price and qty in decimal form, e.g. 1.00000000 | ["1.00000000","800.00000000"] |
| bids | [ string (fixed8) ] | Price and qty in decimal form, e.g. 1.00000000 | ["1.00000000","800.00000000"] |

### BlockTradePage  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| blockTrade | [ [BlockTrade](#blocktrade) ] |  |  |
| total | long |  |  |

### BlockTrade  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| blockTime | long |  |  |
| fee | string |  |  |
| height | long |  |  |
| trade | [ [Trade](#trade) ] |  |  |

### Candlestick  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| close | number |  |  |
| closeTime | long |  |  |
| high | number |  |  |
| low | number |  |  |
| numberOfTrades | integer |  |  |
| open | number |  |  |
| openTime | long |  |  |
| quoteAssetVolume | number |  |  |
| volume | number |  |  |

### OrderList  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| order | [ [Order](#order) ] |  |  |
| total | long |  |  |

### Order  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| cumulateQuantity | string |  |  |
| fee | string |  |  |
| lastExecutedPrice | string |  |  |
| lastExecutedQuantity | string |  |  |
| orderCreateTime | dateTime |  |  |
| orderId | string |  |  |
| owner | string |  |  |
| price | string |  |  |
| quantity | string |  |  |
| side | integer | 1 for buy and 2 for sell |  |
| status | string | enum [Ack, PartialFill, IocNoFill, FullyFill, Canceled, Expired, FailedBlocking, FailedMatching] |  |
| symbol | string |  |  |
| timeInForce | integer | 1 for Good Till Expire(GTE) order and 3 for Immediate Or Cancel (IOC) |  |
| tradeId | string |  |  |
| transactionHash | string |  |  |
| transactionTime | dateTime |  |  |
| type | integer | only 2 is available for now, meaning limit order |  |

### TickerStatistics  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| askPrice | string |  |  |
| askQuantity | string |  |  |
| bidPrice | string |  |  |
| bidQuantity | string |  |  |
| closeTime | long |  |  |
| count | long |  |  |
| firstId | string |  |  |
| highPrice | string |  |  |
| lastId | string |  |  |
| lastPrice | string |  |  |
| lastQuantity | string |  |  |
| lowPrice | string |  |  |
| openPrice | string |  |  |
| openTime | long |  |  |
| prevClosePrice | string |  |  |
| priceChange | string |  |  |
| priceChangePercent | string |  |  |
| quoteVolume | string |  |  |
| symbol | string |  |  |
| volume | string |  |  |
| weightedAvgPrice | string |  |  |

### TradePage  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| total | long |  |  |
| trade | [ [Trade](#trade) ] |  |  |

### Trade  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| baseAsset | string |  |  |
| blockHeight | long |  |  |
| buyFee | string |  |  |
| buyerId | string |  |  |
| buyerOrderId | string |  |  |
| price | string |  |  |
| quantity | string |  |  |
| quoteAsset | string |  |  |
| sellFee | string |  |  |
| sellerId | string |  |  |
| sellerOrderId | string |  |  |
| symbol | string |  |  |
| time | long |  |  |
| tradeId | string |  |  |

### TxPage  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| total | long |  |  |
| tx | [ [Tx](#tx) ] |  |  |

### Tx  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| blockHeight | long |  |  |
| code | integer |  | 0 |
| confirmBlocks | long |  |  |
| data | string |  |  |
| fromAddr | string |  |  |
| orderId | string |  |  |
| timeStamp | dateTime |  |  |
| toAddr | string |  |  |
| txAge | long |  |  |
| txAsset | string |  |  |
| txFee | string |  |  |
| txHash | string |  |  |
| txType | string |  |  |
| value | string |  |  |

### ExchangeRate  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| ExchangeRate | object |  |  |