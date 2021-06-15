# API reference for block service
API description for block service

## Version: V1.0
Base path: <https://binance.org/bc/>

### /api/v1/blocks

#### GET
##### Summary

getBlocksByHeights

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| endHeight | query | endHeight | Yes | long |
| startHeight | query | startHeight | Yes | long |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BlocksVO](#blocksvo) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/blocks/{blockHeight}

#### GET
##### Summary

getBlockByHeight

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| blockHeight | path | blockHeight | Yes | long |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BlockVO](#blockvo) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/blocks/{blockHeight}/txs

#### GET
##### Summary

getTxsByHeight

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| blockHeight | path | blockHeight | Yes | long |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TxsVO](#txsvo) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/txs

#### GET
##### Summary

getTxsByTimeTypeAssetAddress

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | query | address | Yes | string |
| addressType | query | addressType | No | string |
| asset | query | asset | No | string |
| endTime | query | endTime | Yes | long |
| limit | query | limit | No | integer |
| offset | query | offset | No | integer |
| startTime | query | startTime | Yes | long |
| type | query | type | No | string |

Be Noted:
1. The timeframe between endTime and startTime should be less than 7 days. The shorter timeframe will get faster response, and longer timeframe will trigger more strict rate limiter.
2. type: NEW_ORDER, ISSUE_TOKEN, BURN_TOKEN, LIST_TOKEN, CANCEL_ORDER, FREEZE_TOKEN, UN_FREEZE_TOKEN, TRANSFER, PROPOSAL, SIDE_PROPOSAL, VOTE, SIDE_VOTE, DEPOSIT, SIDE_DEPOSIT, MINT, CREATE_VALIDATOR, REMOVE_VALIDATOR, TIME_LOCK, TIME_UNLOCK, TIME_RELOCK, SET_ACCOUNT_FLAG, HTL_TRANSFER, DEPOSIT_HTL, CLAIM_HTL, REFUND_HTL, CREATE_SIDECHAIN_VALIDATOR, EDIT_SIDECHAIN_VALIDATOR, SIDECHAIN_DELEGATE, SIDECHAIN_REDELEGATE, SIDECHAIN_UNDELEGATE, ORACLE_CLAIM, CROSS_TRANSFER_OUT, CROSS_BIND, CROSS_UNBIND, BSC_SUBMIT_EVIDENCE, SIDECHAIN_UNJAIL, TRANSFER_TOKEN_OWNERSHIP, TINY_TOKEN_ISSUE, MINI_TOKEN_ISSUE, MINI_TOKEN_LIST, MINI_TOKEN_SET_URI
3. addressType: FROM or TO
4. The response is different from the /api/v1/transactions api. Major changes:
a) The amount/quantity/price will be returned as Long, keeping consist with the on chain data.
b) For some tx type, the returned 'data' will be different, please refer to *example* for reference.

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TxsVO](#txsvo) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/txs/{txHash}

#### GET
##### Summary

getTxByHash

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| txHash | path | txHash | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TxVO](#txvo) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### Models

#### BlockVO

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| consumeTime | long |  | No |
| fees | [ [FeeVO](#feevo) ] |  | No |
| hash | string |  | No |
| height | long |  | No |
| parentHash | string |  | No |
| proposerAddr | string |  | No |
| proposerNode | string |  | No |
| size | long |  | No |
| time | long |  | No |
| txCount | integer |  | No |

#### BlocksVO

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| blocks | [ [BlockVO](#blockvo) ] |  | No |

#### FeeVO

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| address | string |  | No |
| asset | string |  | No |
| blockHeight | long |  | No |
| quantity | long |  | No |

#### FeesVO

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| fees | [ [FeeVO](#feevo) ] |  | No |

#### TxPageVo

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| total | long |  | No |
| tx | [ [TxVo](#txvo) ] |  | No |

#### TxVO

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| amount | long |  | No |
| asset | string |  | No |
| blockHeight | long |  | No |
| blockTime | long |  | No |
| code | integer |  | No |
| data | string |  | No |
| fee | long |  | No |
| fromAddr | string |  | No |
| hash | string |  | No |
| log | string |  | No |
| memo | string |  | No |
| sequence | long |  | No |
| source | long |  | No |
| toAddr | string |  | No |
| type | string |  | No |

#### TxVo

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| blockHeight | long |  | No |
| code | integer | _Example:_ `0` | No |
| confirmBlocks | long |  | No |
| data | string |  | No |
| fromAddr | string |  | No |
| memo | string |  | No |
| orderId | string |  | No |
| proposalId | string |  | No |
| sequence | long |  | No |
| source | long |  | No |
| swapId | string |  | No |
| timeStamp | dateTime |  | No |
| toAddr | string |  | No |
| txAge | long |  | No |
| txAsset | string |  | No |
| txFee | string |  | No |
| txHash | string |  | No |
| txType | string |  | No |
| value | string |  | No |

#### TxsVO

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| total | long |  | No |
| txs | [ [TxVO](#txvo) ] |  | No |