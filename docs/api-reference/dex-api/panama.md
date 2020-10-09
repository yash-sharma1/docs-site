Swagger API reference for swap service
======================================
API description for swap service

**Version:** V1.0

**Contact information:**  
Binance Chain  

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

### Models
---

### EmailUpdateRequest  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| email | string |  |  |
| walletAddress | string |  |  |

### ResponseStatus  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
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

### SwapCreation  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| amount | number |  |  |
| createTime | dateTime |  |  |
| depositAddress | string |  |  |
| depositAddressLabel | string |  |  |
| depositTimeout | dateTime |  |  |
| direction | string |  |  |
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
| toNetwork | string |  |  |
| walletAddress | string |  |  |

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

### SwapDetail  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| actualFromAmount | number |  |  |
| actualNetworkFee | number |  |  |
| actualSwapFee | number |  |  |
| actualToAmount | number |  |  |
| amount | number |  |  |
| createTime | dateTime |  |  |
| depositAddress | string |  |  |
| depositAddressLabel | string |  |  |
| depositReceivedConfirms | integer |  |  |
| depositRequiredConfirms | integer |  |  |
| depositTimeout | dateTime |  |  |
| depositTxId | string |  |  |
| depositTxLink | string |  |  |
| direction | string |  |  |
| fromNetwork | string |  |  |
| id | string |  |  |
| networkFee | number |  |  |
| networkFeePromoted | boolean |  |  |
| status | string |  |  |
| swapFee | number |  |  |
| swapFeeRate | number |  |  |
| swapTxId | string |  |  |
| swapTxLink | string |  |  |
| symbol | string |  |  |
| toAddress | string |  |  |
| toAddressLabel | string |  |  |
| toNetwork | string |  |  |
| updateTime | dateTime |  |  |
| walletAddress | string |  |  |

### ResponseStatusBodySwapList  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | [SwapList](#swaplist) |  |  |
| message | string |  |  |

### SwapList  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| swaps | [ [SwapDetail](#swapdetail) ] |  |  |
| total | long |  |  |