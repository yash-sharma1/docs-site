


# Binance DEX Trading Specification

## Orders

Orders are the requests for client to buy or sell tokens into other tokens on Binance DEX. 
It is a standard type of Binance Chain transaction. Orders are composed of the below parameters.

0. Symbol Pairs: the list pair the order wants to trade. 
1. Order Type: Binance DEX only accept LIMIT orders, which is adhering to SEC definitions of LIMIT orders
2. Price: price users would like to pay for the specified token quantity, presented as a float 
number of quote currency. This must be rounded by tick size. Internally it can be multiplied by 1e8(10^8) in order to store as an integer 
in the range of int64.
3. Quantity: number of tokens users want to buy or sell. That must be rounded by lot size. Internally it can be multiplied by 
1e8(10^8) in order to store as an integer in the range of int64.
4. Side: buy or sell
5. Time: entry time of the order, which is the block number(height) the order gets booked in.
6. TimeInForce:
    
    1. GTE: Good Till Expire. Order would stay effective until expire time. Order may expire in the UTC midnight after more than 259, 200 blocks, which is 72 hours in term of blocking time. 
    1. IOC: Immediate or Cancel. Orders would be executed as much as it can in the booking block 
    round and then got canceled back if there is still quantity left.
   
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

After orders are received by any blockchain node, the node would try to submit the order transaction 
onto a block with consensus. After the order is accepted in an block, 2 things would happen,

1. the assets that may transfer with the order would be locked and cannot be transferred;
2. the Binance DEX would try to match the order against any existing orders or new orders from the same block. 

If the order can match with any opposite side, the trade would be generated and the assets would be 
transferred. The fully filled orders would be removed from the order book, while the unfilled or 
partially filled GTE would stay on the order book until it is filled by others; unfilled or 
partially filled IOC order would be canceled.

### Order Expire

Order would expire after 72 hours once it is booked on a block. A whole order book scan would happen 
every UTC mid-night to filter out all the expired orders. After the scan, all the expired orders 
would be removed from the order book, the locked quantity in the account would be unlocked. 
Before this action all the existing orders in the order book is subject to matching. 


## Precision

All the numbers are limited to 8-digit decimals.

## Tick Size and Lot Size

Tick size stands for the smallest unit on price change, while lot size stands for the smallest 
quantity change. Order price must be larger than and rounded to 1 tick size and order quantity 
must be larger than and rounded to 1 lot size, otherwise orders would be rejected.

Tick size and lot size can be queried from DEX API, and they would be reviewed and changed 
by DEX match engine automatically according to the trading price every UTC mid-night. Once 
the tick size or/and lot size is changed, new orders must stick to the new vaules while the 
existing orders on the order book can still be traded.

## Fees

We have five kinds of order operations, each kind has its specific fee calculation logic and collection timing as the table described below.

| Operation    |  Calculation  |  Collection Timing |
|:------------- |:------- |:------- |
| Place order | free | - |
| Cancel order| fixed fees | when the `Cancel` transaction executes |
| Order expire| fixed fees if fully expired, otherwise free| when the scheduled order expiration happenes |
| IOC order cancel| fixed fees if fully canceled, otherwise free| when the IOC order is not fully filled |
| Order execution | rate based fees | when the order matched |

BNB is the priority in the fee collection and has some discounts. 

DEX would always calculate and collect the fees based on the latest balance and in the best interest of users.

### Current Fees Table

Fees are variable and may change over time as governance proposals are proposed and voted on. The current fees table as of **2019-01-24** is as follows:

Transaction Type | Pay in Non-BNB Asset | Pay in BNB | Exchange (DEX) Related
-- | -- | -- | --
New Order | 0 | 0 | Y
Cancel (No Fill) | Equivalent 0.001 BNB | 0.0002 BNB | Y
Order Expire (No Fill) | Equivalent 0.001 BNB | 0.0002 BNB | Y
IOC (No Fill) | Equivalent 0.0005 BNB | 0.0001 BNB | Y
Transfer | N/A | 0.01 BNB | N
Issue Asset | N/A | 2000 BNB | N
Burn Asset | N/A | 0.01 BNB | N
Freeze/Unfreeze Asset | N/A | 0.01 BNB | N
List Asset | N/A | 10000 BNB | N

### Trading Fees

Trading fees are subject to complex logic that may mean that individual trades are charged slightly above or below the exact percentage below; this is due to the block-based matching engine in use on the DEX.

The current fee for trades, applied on the settled amounts, is as follows:

Transaction Type | Pay in non-BNB Asset | Pay in BNB
-- | -- | --
Trade | 0.05% | 0.025%

**Note:** There will be an API link to view the current trading fee in real-time provided here shortly.

### Notes

- Trade fee is calculated based on trade notional value, while fees for other transactions are fixed. 
It is free to send new GTE order, cancel a partially filled order, and you will not be charged a fee when the system expires a partially filled order.

- Non-Trade related transactions will be charged a fee when the transactions happen, and can only be paid in BNB. The transaction will be rejected if the address does not have enough BNB.

- Trade related transaction would be charged with fee when an order is filled, or canceled/expired/IOC-expired with no fills. If there is enough BNB to pay, BNB fee structure would be used, otherwise, non-BNB fee structure would be used to charged. 
- If the whole order value and free balance for the receiving asset are not enough to pay the fee, all the receiving asset and its residual balance would be charged.
