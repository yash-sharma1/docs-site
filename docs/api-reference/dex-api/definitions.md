
<a name="definitions"></a>
## Definitions

<a name="account"></a>
### Account

|Name|Description|Schema|
|---|---|---|
|**account_number**  <br>*optional*||integer (int32)|
|**address**  <br>*optional*||string (address)|
|**balances**  <br>*optional*||< [balances](#account-balances) > array|
|**public_key**  <br>*optional*|Public key bytes|< integer > array|
|**sequence**  <br>*optional*||integer (int64)|

<a name="account-balances"></a>
**balances**

|Name|Description|Schema|
|---|---|---|
|**free**  <br>*optional*|In decimal form, e.g. 0.00000000  <br>**Example** : `"0.00000000"`|string (fixed8)|
|**frozen**  <br>*optional*|In decimal form, e.g. 0.00000000  <br>**Example** : `"0.00000000"`|string (fixed8)|
|**locked**  <br>*optional*|In decimal form, e.g. 0.00000000  <br>**Example** : `"0.00000000"`|string (fixed8)|
|**symbol**  <br>*optional*|**Example** : `"BNB"`|string (currency)|


<a name="accountsequence"></a>
### AccountSequence

|Name|Schema|
|---|---|
|**sequence**  <br>*optional*|integer (int64)|


<a name="blocktradepagevo"></a>
### BlockTradePageVo

|Name|Schema|
|---|---|
|**blockTrade**  <br>*optional*|< [BlockTradeVo](#blocktradevo) > array|
|**total**  <br>*optional*|string|


<a name="blocktradevo"></a>
### BlockTradeVo

|Name|Schema|
|---|---|
|**blockTime**  <br>*optional*|integer (int64)|
|**fee**  <br>*optional*|string|
|**height**  <br>*optional*|integer (int64)|
|**trade**  <br>*optional*|< [TradeVo](#tradevo) > array|


<a name="candlestickvo"></a>
### CandlestickVo

|Name|Schema|
|---|---|
|**close**  <br>*optional*|number|
|**closeTime**  <br>*optional*|integer (int64)|
|**high**  <br>*optional*|number|
|**low**  <br>*optional*|number|
|**numberOfTrades**  <br>*optional*|integer (int32)|
|**open**  <br>*optional*|number|
|**openTime**  <br>*optional*|integer (int64)|
|**quoteAssetVolume**  <br>*optional*|number|
|**volume**  <br>*optional*|number|


<a name="error"></a>
### Error

|Name|Schema|
|---|---|
|**code**  <br>*optional*|integer (int64)|
|**message**  <br>*required*|string|


<a name="markets"></a>
### Markets
*Type* : < [Markets](#markets-inline) > array

<a name="markets-inline"></a>
**Markets**

|Name|Description|Schema|
|---|---|---|
|**base_asset_symbol**  <br>*optional*|**Example** : `"BNB"`|string (currency)|
|**lot_size**  <br>*optional*|In decimal form, e.g. 1.00000000  <br>**Example** : `"0.00000000"`|string (fixed8)|
|**price**  <br>*optional*|In decimal form, e.g. 1.00000000  <br>**Example** : `"0.00000000"`|string (fixed8)|
|**quote_asset_symbol**  <br>*optional*|**Example** : `"BNB"`|string (currency)|
|**tick_size**  <br>*optional*|In decimal form, e.g. 1.00000000  <br>**Example** : `"0.00000000"`|string (fixed8)|


<a name="orderhistorydto"></a>
### OrderHistoryDTO

|Name|Schema|
|---|---|
|**blockTime**  <br>*optional*|string (date-time)|
|**cumulateQuantity**  <br>*optional*|number|
|**executionType**  <br>*optional*|enum (NEW)|
|**fee**  <br>*optional*|string|
|**initBlockHeight**  <br>*optional*|integer (int64)|
|**lastExecutedPrice**  <br>*optional*|number|
|**lastExecutedQuantity**  <br>*optional*|number|
|**orderCreateTime**  <br>*optional*|string (date-time)|
|**orderId**  <br>*optional*|string|
|**owner**  <br>*optional*|string|
|**price**  <br>*optional*|number|
|**quantity**  <br>*optional*|number|
|**side**  <br>*optional*|enum (BUY, SELL)|
|**status**  <br>*optional*|enum (ACK, PARTIALLY_FILLED, IOC_NO_FILL, FULLY_FILLED, CANCELED, EXPIRED, FAIL_BLOCKING, FAIL_MATCH, UNKNOWN)|
|**symbol**  <br>*optional*|string|
|**timeInForce**  <br>*optional*|enum (GTC, IOC, UNKNOWN)|
|**tradeId**  <br>*optional*|string|
|**transactionHash**  <br>*optional*|string|
|**transactionTime**  <br>*optional*|string (date-time)|
|**type**  <br>*optional*|enum (LIMIT)|
|**updateBlockHeight**  <br>*optional*|integer (int64)|


<a name="orderpagedto"></a>
### OrderPageDTO

|Name|Schema|
|---|---|
|**order**  <br>*optional*|< [OrderHistoryDTO](#orderhistorydto) > array|
|**total**  <br>*optional*|string|


<a name="orderpagevo"></a>
### OrderPageVo

|Name|Schema|
|---|---|
|**order**  <br>*optional*|< [OrderVo](#ordervo) > array|
|**total**  <br>*optional*|string|


<a name="ordervo"></a>
### OrderVo

|Name|Schema|
|---|---|
|**cumulateQuantity**  <br>*optional*|number|
|**fee**  <br>*optional*|string|
|**lastExecutedPrice**  <br>*optional*|number|
|**lastExecutedQuantity**  <br>*optional*|number|
|**orderCreateTime**  <br>*optional*|string (date-time)|
|**orderId**  <br>*optional*|string|
|**owner**  <br>*optional*|string|
|**price**  <br>*optional*|number|
|**quantity**  <br>*optional*|number|
|**side**  <br>*optional*|enum (BUY, SELL)|
|**status**  <br>*optional*|enum (ACK, PARTIALLY_FILLED, IOC_NO_FILL, FULLY_FILLED, CANCELED, EXPIRED, FAIL_BLOCKING, FAIL_MATCH, UNKNOWN)|
|**symbol**  <br>*optional*|string|
|**timeInForce**  <br>*optional*|enum (GTC, IOC, UNKNOWN)|
|**tradeId**  <br>*optional*|string|
|**transactionHash**  <br>*optional*|string|
|**transactionTime**  <br>*optional*|string (date-time)|
|**type**  <br>*optional*|enum (LIMIT)|


<a name="peers"></a>
### Peers
*Type* : < [Peers](#peers-inline) > array

<a name="peers-inline"></a>
**Peers**

|Name|Description|Schema|
|---|---|---|
|**accelerated**  <br>*optional*|Is an accelerated path to a validator node|boolean|
|**access_addr**  <br>*optional*|Access address (HTTP)|string (RemoteAddr)|
|**capabilities**  <br>*optional*||< enum (node, qs, ap, ws) > array|
|**id**  <br>*optional*|Authenticated identifier|string|
|**listen_addr**  <br>*optional*|Listen address|string (RemoteAddr)|
|**moniker**  <br>*optional*|Moniker (Name)|string|
|**network**  <br>*optional*|Chain ID|string|
|**original_listen_addr**  <br>*optional*|Original listen address before PeersService changed it|string (RemoteAddr)|
|**stream_addr**  <br>*optional*|Stream address (WS)|string (RemoteAddr)|
|**version**  <br>*optional*|Version|string|


<a name="tickerstatisticsvo"></a>
### TickerStatisticsVo

|Name|Schema|
|---|---|
|**askPrice**  <br>*optional*|string|
|**askQuantity**  <br>*optional*|string|
|**bidPrice**  <br>*optional*|string|
|**bidQuantity**  <br>*optional*|string|
|**closeTime**  <br>*optional*|integer (int64)|
|**count**  <br>*optional*|integer (int64)|
|**firstId**  <br>*optional*|string|
|**highPrice**  <br>*optional*|string|
|**lastId**  <br>*optional*|string|
|**lastPrice**  <br>*optional*|string|
|**lastQuantity**  <br>*optional*|string|
|**lowPrice**  <br>*optional*|string|
|**openPrice**  <br>*optional*|string|
|**openTime**  <br>*optional*|integer (int64)|
|**prevClosePrice**  <br>*optional*|string|
|**priceChange**  <br>*optional*|string|
|**priceChangePercent**  <br>*optional*|string|
|**quoteVolume**  <br>*optional*|string|
|**symbol**  <br>*optional*|string|
|**volume**  <br>*optional*|string|
|**weightedAvgPrice**  <br>*optional*|string|


<a name="tokens"></a>
### Tokens
*Type* : < [Tokens](#tokens-inline) > array

<a name="tokens-inline"></a>
**Tokens**

|Name|Description|Schema|
|---|---|---|
|**name**  <br>*optional*|**Example** : `"Binance Chain Native Token"`|string|
|**original_symbol**  <br>*optional*|**Example** : `"BTC"`|string|
|**owner**  <br>*optional*|Address|string (address)|
|**symbol**  <br>*optional*|**Example** : `"BTC-000"`|string|
|**total_supply**  <br>*optional*|In decimal form, e.g. 1.00000000  <br>**Example** : `"0.00000000"`|string (fixed8)|


<a name="tradedto"></a>
### TradeDTO

|Name|Schema|
|---|---|
|**baseAsset**  <br>*optional*|string|
|**blockTime**  <br>*optional*|string (date-time)|
|**buyFee**  <br>*optional*|string|
|**buyerId**  <br>*optional*|string|
|**buyerOrderId**  <br>*optional*|string|
|**initBlockHeight**  <br>*optional*|integer (int64)|
|**price**  <br>*optional*|number|
|**quantity**  <br>*optional*|number|
|**quoteAsset**  <br>*optional*|string|
|**sellFee**  <br>*optional*|string|
|**sellerId**  <br>*optional*|string|
|**sellerOrderId**  <br>*optional*|string|
|**symbol**  <br>*optional*|string|
|**tradeId**  <br>*optional*|string|


<a name="tradepagevo"></a>
### TradePageVo

|Name|Schema|
|---|---|
|**total**  <br>*optional*|string|
|**trade**  <br>*optional*|< [TradeVo](#tradevo) > array|


<a name="tradestatisticsdto"></a>
### TradeStatisticsDTO

|Name|Schema|
|---|---|
|**avgPrice**  <br>*optional*|number|
|**high**  <br>*optional*|number|
|**low**  <br>*optional*|number|
|**symbol**  <br>*optional*|string|
|**totalBaseVolume**  <br>*optional*|number|
|**totalCount**  <br>*optional*|integer (int64)|
|**totalQuotaVolume**  <br>*optional*|number|


<a name="tradevo"></a>
### TradeVo

|Name|Schema|
|---|---|
|**baseAsset**  <br>*optional*|string|
|**blockHeight**  <br>*optional*|integer (int64)|
|**buyFee**  <br>*optional*|string|
|**buyerId**  <br>*optional*|string|
|**buyerOrderId**  <br>*optional*|string|
|**price**  <br>*optional*|number|
|**quantity**  <br>*optional*|number|
|**quoteAsset**  <br>*optional*|string|
|**sellFee**  <br>*optional*|string|
|**sellerId**  <br>*optional*|string|
|**sellerOrderId**  <br>*optional*|string|
|**symbol**  <br>*optional*|string|
|**time**  <br>*optional*|integer (int64)|
|**tradeId**  <br>*optional*|string|


<a name="tradingfeedto"></a>
### TradingFeeDTO

|Name|Schema|
|---|---|
|**address**  <br>*optional*|string|
|**blockHeight**  <br>*optional*|integer (int64)|
|**fee**  <br>*optional*|string|
|**tradingFeeId**  <br>*optional*|string|


<a name="transaction"></a>
### Transaction

|Name|Description|Schema|
|---|---|---|
|**code**  <br>*optional*|**Default** : `0`|integer (int32)|
|**data**  <br>*optional*||string|
|**hash**  <br>*optional*||string|
|**log**  <br>*optional*||string|


<a name="txpagevo"></a>
### TxPageVo

|Name|Schema|
|---|---|
|**total**  <br>*optional*|string|
|**tx**  <br>*optional*|< [TxVo](#txvo) > array|


<a name="txvo"></a>
### TxVo

|Name|Description|Schema|
|---|---|---|
|**blockHeight**  <br>*optional*||integer (int64)|
|**code**  <br>*optional*|**Example** : `0`|integer (int32)|
|**confirmBlocks**  <br>*optional*||integer (int64)|
|**data**  <br>*optional*||string|
|**fromAddr**  <br>*optional*||string|
|**orderId**  <br>*optional*||string|
|**timeStamp**  <br>*optional*||string (date-time)|
|**toAddr**  <br>*optional*||string|
|**txAge**  <br>*optional*||integer (int64)|
|**txAsset**  <br>*optional*||string|
|**txFee**  <br>*optional*||number|
|**txHash**  <br>*optional*||string|
|**txType**  <br>*optional*||string|
|**value**  <br>*optional*||number|


<a name="validators"></a>
### Validators

|Name|Description|Schema|
|---|---|---|
|**block_height**  <br>*optional*|Current block height|integer (int64)|
|**validators**  <br>*optional*||< [validators](#validators-validators) > array|

<a name="validators-validators"></a>
**validators**

|Name|Description|Schema|
|---|---|---|
|**accum**  <br>*optional*||integer|
|**address**  <br>*optional*|Address|string (hexaddress)|
|**pub_key**  <br>*optional*|Public key bytes|< integer (int32) > array|
|**voting_power**  <br>*optional*||integer|



