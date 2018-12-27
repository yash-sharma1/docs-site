
<a name="paths"></a>
## Paths

<a name="gettradestatisticsdtousingget"></a>
### trades statistics by symbol
```
GET /api/query/trades-statistics
```


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Query**|**symbol**  <br>*required*|symbol|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[TradeStatisticsDTO](#tradestatisticsdto)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `\*/*`


#### Tags

* explorer


<a name="getaccount"></a>
### Gets account metadata given an address
```
GET /api/v1/account/{address}
```


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**address**  <br>*required*|The account address to query|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Account](#account)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* account
* node


<a name="getaccountsequence"></a>
### Gets the current sequence for an address
```
GET /api/v1/account/{address}/sequence
```


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**address**  <br>*required*|The account address to query|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[AccountSequence](#accountsequence)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* account
* node


<a name="getblocktradesusingget"></a>
### Trades grouped by block
```
GET /api/v1/block-trades
```


#### Description
Get historical trades per block. Order by block height DESC.


#### Parameters

|Type|Name|Description|Schema|Default|
|---|---|---|---|---|
|**Query**|**address**  <br>*optional*|the sender address|string||
|**Query**|**end**  <br>*optional*|end time|integer (int64)||
|**Query**|**height**  <br>*optional*|block height|integer (int64)||
|**Query**|**limit**  <br>*optional*|default 50; max 100.|integer (int32)|`50`|
|**Query**|**offset**  <br>*optional*|start with 0; default 0.|integer (int32)|`0`|
|**Query**|**start**  <br>*optional*|start time|integer (int64)||


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[BlockTradePageVo](#blocktradepagevo)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* trade


<a name="broadcasttx"></a>
### Broadcasts a transaction, or a batch of up to 5 transactions, given their signed binary forms.
```
POST /api/v1/broadcast
```


#### Description
Use this API to broadcast your own signed transactions. Transactions must be sent in hex format in plain text, separated by commas (,).


#### Parameters

|Type|Name|Description|Schema|Default|
|---|---|---|---|---|
|**Query**|**sync**  <br>*optional*|Synchronous broadcast (wait for DeliverTx)|boolean|`"false"`|
|**Body**|**body**  <br>*required*||string (binary)||


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|< [Response 200](#broadcasttx-response-200) > array|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|

<a name="broadcasttx-response-200"></a>
**Response 200**

|Name|Schema|
|---|---|
|**code**  <br>*optional*|integer (int32)|
|**data**  <br>*optional*|string|
|**hash**  <br>*optional*|string|
|**log**  <br>*optional*|string|
|**ok**  <br>*optional*|boolean|


#### Consumes

* `text/plain`


#### Produces

* `application/json`


#### Tags

* node


<a name="getcryptocurrencyrateusingget"></a>
### CryptoCurrency rate
```
GET /api/v1/crypto-currency
```


#### Description
Get exchange rate of crypto currency off Binance Chain. The rate is updated every 30 seconds.


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|< string, number (double) > map|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* market


<a name="getdepth"></a>
### getDepth
```
GET /api/v1/depth
```


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Query**|**limit**  <br>*optional*|symbol|integer (int32)|
|**Query**|**symbol**  <br>*optional*|symbol|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|No Content|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* market


<a name="getfiatcurrencyrateusingget"></a>
### Fiat currency rate
```
GET /api/v1/fiat-currency
```


#### Description
Get exchange rate of fiat currency. The rate is updated every 5 minutes.


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|< string, number (double) > map|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* market


<a name="getfrontierinfo"></a>
### Obtains frontier runtime data
```
GET /api/v1/frontier-info
```


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Frontier info](#frontier-info)|

<a name="frontier-info"></a>
**Frontier info**

|Name|Description|Schema|
|---|---|---|
|**time**  <br>*optional*|In unix time (the number of seconds since the Unix Epoch)|integer (int64)|


#### Produces

* `application/json`


#### Tags

* frontier
* info


<a name="getcandlestickbarsusingget"></a>
### Kline
```
GET /api/v1/klines
```


#### Description
Kline/candlestick bars for a symbol. Klines are uniquely identified by their open time.


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Query**|**endTime**  <br>*optional*|end time|integer (int64)|
|**Query**|**interval**  <br>*required*|interval|enum (1m, 3m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 8h, 12h, 1d, 3d, 1w, 1M)|
|**Query**|**limit**  <br>*optional*|default 500; max 1000.|integer (int32)|
|**Query**|**startTime**  <br>*optional*|start time|integer (int64)|
|**Query**|**symbol**  <br>*required*|symbol|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|< [CandlestickVo](#candlestickvo) > array|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* market


<a name="getpairs"></a>
### Gets a list of market pairs.
```
GET /api/v1/markets
```


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Markets](#markets)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* market


<a name="getnodeinfo"></a>
### Obtain blockchain node runtime metadata
```
GET /api/v1/node-info
```


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|object|


#### Produces

* `application/json`


#### Tags

* info
* node


<a name="getclosedordersusingget"></a>
### Closed order
```
GET /api/v1/orders/closed
```


#### Description
Get closed (filled and cancelled) openOrders for a given address


#### Parameters

|Type|Name|Description|Schema|Default|
|---|---|---|---|---|
|**Query**|**address**  <br>*required*|the sender address|string||
|**Query**|**end**  <br>*optional*|end time|integer (int64)||
|**Query**|**limit**  <br>*optional*|default 500; max 1000.|integer (int32)|`500`|
|**Query**|**offset**  <br>*optional*|start with 0; default 0.|integer (int32)|`0`|
|**Query**|**side**  <br>*optional*|order side|enum (BUY, SELL)||
|**Query**|**start**  <br>*optional*|start time|integer (int64)||
|**Query**|**status**  <br>*optional*|order status list|< string > array(multi)||
|**Query**|**symbol**  <br>*optional*|symbol|string||


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[OrderPageVo](#orderpagevo)|


#### Produces

* `application/json`


#### Tags

* order


<a name="getopenordersusingget"></a>
### Open order
```
GET /api/v1/orders/open
```


#### Description
Get open openOrders for a given address


#### Parameters

|Type|Name|Description|Schema|Default|
|---|---|---|---|---|
|**Query**|**address**  <br>*required*|the sender address|string||
|**Query**|**limit**  <br>*optional*|default 500; max 1000.|integer (int32)|`500`|
|**Query**|**offset**  <br>*optional*|start with 0; default 0.|integer (int32)|`0`|
|**Query**|**symbol**  <br>*optional*|symbol|string||


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[OrderPageVo](#orderpagevo)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* order


<a name="getorderusingget"></a>
### Order
```
GET /api/v1/orders/{id}
```


#### Description
Get an individual order's status


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**id**  <br>*required*|order id|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[OrderVo](#ordervo)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* order


<a name="getpeers"></a>
### Obtain the peers list
```
GET /api/v1/peers
```


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Peers](#peers)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* info
* node


<a name="get24hrpricestatisticsusingget"></a>
### 24 hour price
```
GET /api/v1/ticker/24hr
```


#### Description
24 hour price change statistics.


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Query**|**symbol**  <br>*optional*|symbol|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|< [TickerStatisticsVo](#tickerstatisticsvo) > array|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* market


<a name="gettime"></a>
### getTime
```
GET /api/v1/time
```


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Times](#times)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|

<a name="times"></a>
**Times**

|Name|Schema|
|---|---|
|**ap_time**  <br>*optional*|string|
|**block_time**  <br>*optional*|string|


#### Produces

* `application/json`


#### Tags

* misc


<a name="gettokens"></a>
### Gets a list of available tokens.
```
GET /api/v1/tokens
```


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Tokens](#tokens)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* tokens


<a name="gettradesusingget"></a>
### Trades
```
GET /api/v1/trades
```


#### Description
Get historical trades.


#### Parameters

|Type|Name|Description|Schema|Default|
|---|---|---|---|---|
|**Query**|**address**  <br>*optional*|the sender address|string||
|**Query**|**baseAsset**  <br>*optional*|base asset|string||
|**Query**|**buyerOrderId**  <br>*optional*|buyer order id|string||
|**Query**|**end**  <br>*optional*|end time|integer (int64)||
|**Query**|**height**  <br>*optional*|block height|integer (int64)||
|**Query**|**limit**  <br>*optional*|default 500; max 1000.|integer (int32)|`500`|
|**Query**|**offset**  <br>*optional*|start with 0; default 0.|integer (int32)|`0`|
|**Query**|**quoteAsset**  <br>*optional*|quote asset|string||
|**Query**|**sellerOrderId**  <br>*optional*|seller order id|string||
|**Query**|**side**  <br>*optional*|order side|enum (BUY, SELL)||
|**Query**|**start**  <br>*optional*|start time|integer (int64)||
|**Query**|**symbol**  <br>*optional*|symbol|string||


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[TradePageVo](#tradepagevo)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* trade


<a name="txnsusingget"></a>
### Transactions
```
GET /api/v1/transactions
```


#### Description
Get transactions.


#### Parameters

|Type|Name|Description|Schema|Default|
|---|---|---|---|---|
|**Query**|**address**  <br>*optional*|address|string||
|**Query**|**blockHeight**  <br>*optional*|blockHeight|integer (int64)||
|**Query**|**endTime**  <br>*optional*|endTime|integer (int64)||
|**Query**|**limit**  <br>*optional*|limit|integer (int32)|`500`|
|**Query**|**offset**  <br>*optional*|offset|integer (int32)|`0`|
|**Query**|**side**  <br>*optional*|transaction side|enum (RECEIVE, SEND)||
|**Query**|**startTime**  <br>*optional*|startTime|integer (int64)||
|**Query**|**txAsset**  <br>*optional*|txAsset|string||
|**Query**|**txType**  <br>*optional*|transaction type|enum (NEW_ORDER, ISSUE_TOKEN, BURN_TOKEN, LIST_TOKEN, CANCEL_ORDER, FREEZE_TOKEN, UN_FREEZE_TOKEN, TRANSFER)||


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[TxPageVo](#txpagevo)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `\*/*`


#### Tags

* transaction


<a name="gettransaction"></a>
### Gets metadata for an individual transaction
```
GET /api/v1/tx/{hash}
```


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**hash**  <br>*required*|The transaction hash to query|string|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Transaction](#transaction)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* node
* tx


<a name="getvalidators"></a>
### Obtain blockchain validators list
```
GET /api/v1/validators
```


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[Validators](#validators)|
|**400**|Bad Request|[Error](#error)|
|**404**|Not Found|No Content|
|**default**|Generic error response|[Error](#error)|


#### Produces

* `application/json`


#### Tags

* info
* node



