# WebSocket Connections

The DEX exposes several data streams over standard WebSocket connections, which can be consumed by modern web browsers and server-side WebSocket libraries.

- The base endpoint is: **wss://testnet-dex.binance.org/api/**.
- Each connection can consume a single stream or multiple streams may be multiplexed through one connection for more complex apps.
- A single connection to **wss://testnet-dex.binance.org/api/** is only valid for 24 hours, so expect to be disconnected at around the 24 hour mark. Your app should handle this with reconnection logic.
- All symbols in stream names are lowercase.

Stream names may be provided in the URL **or** there is a mechanism to `subscribe` to consume streams on demand through one connection.

Note: Once the connection is established, websocket server would send ping frame to client every 30 seconds. Client should response pong frame in time (this has already implemented by most mordern browers, but programmatical users need be aware of whether your websocket library support this), otherwise, the connection might be closed.

Examples for each of these methods are provided below in JavaScript:

### Method 1: Connect with stream names in the URL

Using this method, stream names are specified in the URLs used to connect to the data streams:

- Single streams may be accessed at **/ws/\<streamName\>**
- Combined streams may be accessed at **/stream?streams=\<streamName1\>/\<streamName2\>/\<streamName3\>** (etc.)

**Example:** Various methods of connecting to streams where stream names are provided in URLs:

```javascript
  // for personal streams, ex: Account & Orders & Transfers
  const accountAndOrdersFeeds = new WebSocket("wss://testnet-dex.binance.org/api/ws/<USER_ADDRESS>");

  // for single streams
  const tradesFeeds = new WebSocket("wss://testnet-dex.binance.org/api/ws/<symbol>@trades");
  const marketFeeds = new WebSocket("wss://testnet-dex.binance.org/api/ws/<symbol>@marketDiff");
  const deltaFeeds = new WebSocket("wss://testnet-dex.binance.org/api/ws/<symbol>@marketDepth");
  ... etc

  // for all symbols
  const allTickers = new WebSocket("wss://testnet-dex.binance.org/api/ws/$all@allTickers");
  const allMiniTickers = new WebSocket("wss://testnet-dex.binance.org/api/ws/$all@allMiniTickers");
  const blockHeight = new WebSocket("wss://testnet-dex.binance.org/api/ws/$all@blockheight");

  // for combined streams, can combined a mixed symbols and streams
  const combinedFeeds = new WebSocket("wss://testnet-dex.binance.org/api/stream?streams=<symbol>@trades/<symbol>@marketDepth/<symbol>@marketDiff");
```

### Method 2: Subscribe to streams on demand

Using this method, streams are be consumed via subscribe and unsubscribe commands, sent through a single WebSocket connection.

```javascript
    const conn = new WebSocket("<whatever valid ws url>");
    conn.onopen = function(evt) {
        // send Subscribe/Unsubscribe messages here (see below)
    }
    conn.onmessage = function(evt) {
        console.info('received data', evt.data);
    };
    conn.onerror = function(evt) {
        console.error('an error occurred', evt.data);
    };
```

After connecting successfully you can subscribe/unsubscribe to different topics.

**Example:** To subscribe to orders events and market depth updates, you should send a socket message with the `subscribe` payload as below:

```javascript
    const conn = new WebSocket("wss://testnet-dex.binance.org/api/ws/bnc1hp7cves62dzj8n4z8ckna0d3t6zd7z2zcj6gtq");
    conn.onopen = function(evt) {
        // for personal topics such as accounts & orders & transfers , a `userAddress` is required
        // Note: one connection is only allowed to subscribe one userAddress.
        // If you subscribe new address, (no matter whether the topic is new) previous userAddress subscriptions would be removed
        conn.send(JSON.stringify({ method: "subscribe", topic: "orders", address: "bnc1hp7cves62dzj8n4z8ckna0d3t6zd7z2zcj6gtq" }));

        // for data topics such as marketDepth, marketDelta, trades and ticker;
        // a list of symbols is required. Same message can be used to append new topic and/or symbols
        conn.send(JSON.stringify({ method: "subscribe", topic: "marketDepth", symbols: ["BNB_BTC","BNB_ETH"] }));
    }
```

**Example:** To unsubscribe from orders events, you should send a socket message with payloads as below:

```javascript
    // unsubscribe from topic
    conn.send(JSON.stringify({ method: "unsubscribe", topic: "orders" }));

    // unsubscribe from individual symbols
    conn.send(JSON.stringify({ method: "unsubscribe", topic: "marketDepth", symbols: ["BNB_BTC"] }));
```

**Example:** To extend connection life, you should send a a message with a payload using the `keepAlive` method:

```javascript
    // This will extend the connection time to another 30 minutes
    // It's good to send this message every 30 minutes to maintain the connection life
    conn.send(JSON.stringify({ method: "keepAlive" }));
```

**Example:** To close a connection, you should send a socket message with a payload as below:

```javascript
    // Connections will auto close after 30 - 60 minutes if no "keepAlive" messages received
    // Connections with no subscriptions will be closed, regardless the keepAlive messages.
    conn.send(JSON.stringify({ method: "close" }));
```
