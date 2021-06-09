Swagger API reference for swap service
======================================
API description for swap service

**Version:** V1.0

**Contact information:**
Binance Chain

Base URL: api.binance.org/bridge

Rate Limit: 2000 request per IP per 5 mins.

## API V2

### /api/v2/swaps
---
##### ***GET***
**Summary:** findV2

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| endTime | query | endTime | No | long |
| limit | query | limit | No | long |
| offset | query | offset | No | long |
| startTime | query | startTime | No | long |
| status | query | status | No | [ string ] |
| symbol | query | symbol | No | string |
| walletAddress | query | walletAddress | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodySwapList](#responsestatusbodyswaplist) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

##### ***POST***
**Summary:** createV2

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| payload | body | payload | Yes | [SwapCreationRequestV2](#swapcreationrequestv2) |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodySwapCreation](#responsestatusbodyswapcreation) |
| 201 | Created |  |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v2/swaps/validation/ip
---
##### ***GET***
**Summary:** validateIP

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodyboolean](#responsestatusbodyboolean) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v2/swaps/{swapId}
---
##### ***GET***
**Summary:** getV2

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| swapId | path | swapId | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodySwapDetail](#responsestatusbodyswapdetail) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

## API V1

### /api/v1/tokens
---
##### ***GET***
**Summary:** get

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| direction | query | In or OUT | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TokenList](#tokenlist) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/swaps
---
##### ***GET***
**Summary:** find

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| direction | query | direction | No | string |
| endTime | query | endTime | No | long |
| limit | query | limit | No | long |
| offset | query | offset | No | long |
| startTime | query | startTime | No | long |
| status | query | status | No | [ string ] |
| symbol | query | symbol | No | string |
| walletAddress | query | walletAddress | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodySwapList](#responsestatusbodyswaplist) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

##### ***POST***
**Summary:** create

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| payload | body | payload | Yes | [SwapCreationRequest](#swapcreationrequest) |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodySwapCreation](#responsestatusbodyswapcreation) |
| 201 | Created |  |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/swaps/quota/24hour
---
##### ***GET***
**Summary:** getQuota

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| symbol | query | symbol | Yes | string |
| walletAddress | query | walletAddress | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodyQuota](#responsestatusbodyquota) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/swaps/{swapId}
---
##### ***GET***
**Summary:** get

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| swapId | path | swapId | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodySwapDetail](#responsestatusbodyswapdetail) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/swaps/{swapId}/email
---
##### ***PUT***
**Summary:** createEmail

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| payload | body | payload | Yes | [EmailUpdateRequest](#emailupdaterequest) |
| swapId | path | swapId | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatus](#responsestatus) |
| 201 | Created |  |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |

### /api/v1/unknown-deposits
---
##### ***GET***
**Summary:** getUnknownDeposits

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| limit | query | limit | No | long |
| offset | query | offset | No | long |
| walletAddress | query | walletAddress | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ResponseStatusBodyDepositList](#responsestatusbodydepositlist) |
| 401 | Unauthorized |  |
| 403 | Forbidden |  |
| 404 | Not Found |  |


### Models
---

### Deposit

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| amount | number |  |  |
| confirmTimes | integer |  |  |
| depositTime | long |  |  |
| depositTxUrl | string |  |  |
| fromAddress | string |  |  |
| label | string |  |  |
| network | string |  |  |
| refundId | string |  |  |
| refundMessage | string |  |  |
| refundStatus | string |  |  |
| refundTx | string |  |  |
| refundTxUrl | string |  |  |
| status | string |  |  |
| swapId | string |  |  |
| toAddress | string |  |  |
| tokenSymbol | string |  |  |
| txId | string |  |  |

### DepositList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| deposits | [ [Deposit](#deposit) ] |  |  |
| total | long |  |  |

### DepositStatusUpdateRequest

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| actualDepositAmount | number |  |  |
| actualSwapFee | number |  |  |
| depositReceivedConfirms | integer |  |  |
| depositTxId | string |  |  |
| errorMessage | string |  |  |
| fromAddress | string |  |  |

### EmailUpdateRequest

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| email | string |  |  |
| walletAddress | string |  |  |

### ExchangeStatusUpdateRequest

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| actualExchangeAmount | number |  |  |
| actualExchangeNetworkFee | number |  |  |
| actualTokenAmount | number |  |  |
| errorMessage | string |  |  |
| withdrawTxId | string |  |  |

### Quota

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| left | number |  |  |
| total | number |  |  |
| used | number |  |  |

### RefundOfflineRequest

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| address | string |  |  |
| amount | number |  |  |
| errorMessage | string |  |  |
| refundCode | integer |  |  |
| refundId | string |  |  |
| refundTime | long |  |  |
| refundTxId | string |  |  |

### RefundStatusUpdateRequest

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| errorMessage | string |  |  |
| refundCode | integer |  |  |
| refundId | string |  |  |
| refundTxId | string |  |  |

### ResponseStatus

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| message | string |  |  |

### ResponseStatusBodyDepositList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [DepositList](#depositlist) |  |  |
| message | string |  |  |

### ResponseStatusBodyQuota

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [Quota](#quota) |  |  |
| message | string |  |  |

### ResponseStatusBodySwapCreation

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [SwapCreation](#swapcreation) |  |  |
| message | string |  |  |

### ResponseStatusBodySwapDetail

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [SwapDetail](#swapdetail) |  |  |
| message | string |  |  |

### ResponseStatusBodySwapEmailDetail

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [SwapEmailDetail](#swapemaildetail) |  |  |
| message | string |  |  |

### ResponseStatusBodySwapList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [SwapList](#swaplist) |  |  |
| message | string |  |  |

### ResponseStatusBodySwapLogList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [SwapLogList](#swaploglist) |  |  |
| message | string |  |  |

### ResponseStatusBodySwapRefundList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [SwapRefundList](#swaprefundlist) |  |  |
| message | string |  |  |

### ResponseStatusBodyboolean

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | boolean |  |  |
| message | string |  |  |

### SwapCreation

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| amount | number |  |  |
| createTime | dateTime |  |  |
| depositAddress | string |  |  |
| depositAddressLabel | string |  |  |
| depositAddressLabelName | string |  |  |
| depositTimeout | dateTime |  |  |
| direction | string |  |  |
| estimatedToAmount | number |  |  |
| exchangeGasAmount | number |  |  |
| fromNetwork | string |  |  |
| id | string |  |  |
| networkFee | number |  |  |
| networkFeePromoted | boolean |  |  |
| status | string |  |  |
| swapFee | number |  |  |
| swapFeeRate | number |  |  |
| symbol | string |  |  |
| toAddress | string |  |  |
| toAddressLabel | string |  |  |
| toAmount | number |  |  |
| toNetwork | string |  |  |
| walletAddress | string |  |  |
| walletNetwork | string |  |  |

### SwapCreationRequest

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| amount | number |  |  |
| direction | string |  |  |
| fromNetwork | string |  |  |
| source | integer |  |  |
| symbol | string |  |  |
| toAddress | string |  |  |
| toAddressLabel | string |  |  |
| toNetwork | string |  |  |
| walletAddress | string |  |  |

### SwapCreationRequestV2

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| amount | number |  |  |
| exchangeGasAmount | number |  |  |
| fromNetwork | string |  |  |
| source | integer |  |  |
| symbol | string |  |  |
| toAddress | string |  |  |
| toAddressLabel | string |  |  |
| toAmount | number |  |  |
| toNetwork | string |  |  |
| walletAddress | string |  |  |
| walletNetwork | string |  |  |

### SwapDetail

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| actualExchangeGasAmount | number |  |  |
| actualExchangeGasNetworkFee | number |  |  |
| actualFromAmount | number |  |  |
| actualNetworkFee | number |  |  |
| actualSwapFee | number |  |  |
| actualToAmount | number |  |  |
| amount | number |  |  |
| createTime | dateTime |  |  |
| depositAddress | string |  |  |
| depositAddressLabel | string |  |  |
| depositAddressLabelName | string |  |  |
| depositReceivedConfirms | integer |  |  |
| depositRequiredConfirms | integer |  |  |
| depositTimeout | dateTime |  |  |
| depositTxId | string |  |  |
| depositTxLink | string |  |  |
| direction | string |  |  |
| errorMessage | string |  |  |
| estimatedToAmount | number |  |  |
| exchangeErrorMessage | string |  |  |
| exchangeGasAmount | number |  |  |
| exchangeGasNetworkFee | number |  |  |
| exchangeGasWithdrawTxId | string |  |  |
| exchangeStatus | string |  |  |
| fromAddress | string |  |  |
| fromNetwork | string |  |  |
| id | string |  |  |
| networkFee | number |  |  |
| networkFeePromoted | boolean |  |  |
| refundCode | integer |  |  |
| refundErrorCode | integer |  |  |
| refundMessage | string |  |  |
| refundStatus | string |  |  |
| refundTxId | string |  |  |
| status | string |  |  |
| swapFee | number |  |  |
| swapFeeRate | number |  |  |
| swapTxId | string |  |  |
| swapTxLink | string |  |  |
| symbol | string |  |  |
| toAddress | string |  |  |
| toAddressLabel | string |  |  |
| toAmount | number |  |  |
| toNetwork | string |  |  |
| updateTime | dateTime |  |  |
| walletAddress | string |  |  |
| walletNetwork | string |  |  |
| withdrawId | string |  |  |
| withdrawResent | boolean |  |  |

### SwapEmailDetail

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| createTime | dateTime |  |  |
| email | string |  |  |
| swapId | string |  |  |

### SwapList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| swaps | [ [SwapDetail](#swapdetail) ] |  |  |
| total | long |  |  |

### SwapLogDetail

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| content | string |  |  |
| status | string |  |  |
| swapId | string |  |  |
| updateTime | dateTime |  |  |

### SwapLogList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| logs | [ [SwapLogDetail](#swaplogdetail) ] |  |  |
| total | long |  |  |

### SwapRefundDetail

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| errorMessage | string |  |  |
| refundTxId | string |  |  |
| swapId | string |  |  |
| updateTime | dateTime |  |  |

### SwapRefundList

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| refunds | [ [SwapRefundDetail](#swaprefunddetail) ] |  |  |
| total | long |  |  |

### WithdrawStatusUpdateRequest

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| actualNetworkFee | number |  |  |
| actualWithdrawAmount | number |  |  |
| errorMessage | string |  |  |
| withdrawTxId | string |  |  |