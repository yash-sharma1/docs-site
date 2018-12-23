


# Binance DEX Trading Specification

## Orders
Orders are the requests for client to buy or sell tokens into other tokens on Binance DEX. It is a standard type of Binance Chain transaction. Orders are composed of the below parameters.

0. Symbol Pairs: the list pair the order wants to trade. 
1. Order Type: B-DEX only accept LIMIT orders, which is adhering to SEC definitions of LIMIT orders
2. Price: price users would like to pay for the specified token quantity, presented as a float number of base currency. Internally it can be multiplied by Price Factor and store as an intergater in the range of int64.
3. Quantity: number of tokens users want to buy or sell. Internally it can be multiplied by Price Factor and store as an intergater in the range of int64.
4. Side: buy or sell
5. Time: entry time of the order, which is the block number(height) the order gets booked in.
6. TimeInForce:
   1. GTE: Good Till Expire. Order would stay effective until expire time. Order may expire, 259, 200 blocks, which is 72 hours in term of blocking time, 1s. Since the expiry is not checked in every block round, so orders may not expire right after the expiry time, but it would do after 72~96 hours. 
   2. IOC: Immediate or Cancel. Orders would be executed as much as it can in the booking block round and then got canceled back if there is still quantity left.
   
Orders would be rejected when:

0. user address cannot be located with asset
1. Account does not possess enough token to buy or sell
2. Exchange is down or has problem to match it
3. The token is not listed against any base currencies
4. Other order parameters are not valid
5. Duplicated order ID

Orders may be canceled / expired back when: 

1. IOC order not fully filled
2. Order expired
3. Exchange has problem to handle further with the orders

After orders are received by any blockchain node, the node would try to submit the order transaction onto a block with consensus. After the order is accepted in an block, 2 things would happen,
1. the assets that may transfer with the order would be locked and cannot be transferred;
2. the Binance DEX would try to match the order against any existing orders or new orders from the same block. 

If the order can match with any opposite side, the trade would be generated and the assets would be transferred. The fully filled orders would be removed from the order book, while the unfilled or partially filled GTE would stay on the order book until it is filled by others; unfilled or partially filled IOC order would be canceled.

### Order Expire
Order would expire after 72 hours once it is booked on a block. A whole order book scan would happen every UTC mid-night to filter out all the expired orders. After the scan, all the expired orders would be removed from the order book, the locked quantity in the account would be unlocked. Before this action all the existing orders in the order book is subject to matching. 


## Precision
All the numbers are limited to 8-digit decimals.

## Tick Size and Lot Size
Tick size stands for the smallest unit on price change, while lot size stands for the smallest quantity change. Order price must be larger than and rounded to 1 tick size and order quantity must be larger than and rounded to 1 lot size, otherwise orders would be rejected.

Tick size and lot size can be queried from DEX API, and they would be reviewed and changed by DEX match engine automatically according to the trading price every UTC mid-night. Once the tick size or/and lot size is changed, new orders must stick to the new vaules while the existing orders on the order book can still be traded.

## Fees

