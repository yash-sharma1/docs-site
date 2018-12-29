## Connection

The sockets service starts by establishing a TCP server that accepts new end-users' connections. Upon a new connection, the service stores the user connection into the memory with a initital expiry after 60 minutes.

- The base endpoint is: **https://testnet-dex.binance.org/api/**
- Streams can be access either in a single raw stream or a combined stream
- All symbols for streams are lowercase
- A single connection to **https://testnet-dex.binance.org/api/** is only valid for 24 hours; expect to be disconnected at the 24 hour mark

There are 2 ways to connect to the WS, **the first one** is using different connections for custom URL connections. While **the second method** is through a single connection to the root service and use a `Subscribe/Unsubscribe` method to start or stop receiving feeds for different streams.

Examples are written by javascript.

### 1 Connect via URL streams

Can be established through a different URL streams as follows:

- Raw streams are accessed at **/ws/\<streamName\>**
- Combined streams are accessed at **/stream?streams=\<streamName1\>/\<streamName2\>/\<streamName3\>**
- Ex: to establish a connection

> please note all the example code are in Javascript.

```javascript
  // for personal streams, ex: Account & Orders
  const accountAndOrdersFeeds = new WebSocket("ws://testnet-dex.binance.org/api/ws/<USER_ADDRESS>");

  // for single streams
  const tradesFeeds = new WebSocket("ws://testnet-dex.binance.org/api/ws/<symbol>@trades");
  const marketFeeds = new WebSocket("ws://testnet-dex.binance.org/api/ws/<symbol>@marketDiff");
  const deltaFeeds = new WebSocket("ws://testnet-dex.binance.org/api/ws/<symbol>@marketDepth");
  ... etc

  // for all symbols
  const allTickers = new WebSocket("ws://testnet-dex.binance.org/api/ws/$all@ticker");
  const allMiniTickers = new WebSocket("ws://testnet-dex.binance.org/api/ws/$all@miniTicker");
  const blockHeight = new WebSocket("ws://testnet-dex.binance.org/api/ws/$all@blockheight");

  // for combined streams, can combined a mixed symbols and streams
  const combinedFeeds = new WebSocket("ws://testnet-dex.binance.org/api/stream?streams=<symbol>@trades/<symbol>@marketDepth/<symbol>@marketDiff");
```

### 2 Connect via Subscribe method

Connect using subscribe/unsubscribe socket messages through a single connection, Ex: To establish a connection:

```javascript
    const conn = new WebSocket("ws://testnet-dex.binance.org/api");
    conn.onopen = function(evt) {
        // send messages
    }

    conn.onmessage = function(evt) {
        console.log(evt.data);
    };

    conn.onerror = function(evt) {
        console.log(evt.data);
    };
```

After successfuly connection, a user can subscribe/unsubscribe to different topics.

  Ex: To subscribe to orders events; a user needs to send socket message with the payload

```javascript
    const conn = new WebSocket("ws://testnet-dex.binance.org/api");
    conn.onopen = function(evt) {
        // for private topics such as accounts & orders, a `userAddress` is required
        conn.send(JSON.stringify({ method: "subscribe", topic: "orders", userAddress: "bnc1hp7cves62dzj8n4z8ckna0d3t6zd7z2zcj6gtq" }));

        // for data topics such as marketDepth, marketDelta, trades and ticker;
        // a list of symbols is required. Same message can be used to append new topic and/or symbols
        conn.send(JSON.stringify({ method: "subscribe", topic: "marketDepth", symbols: ["BNB_BTC","BNB_ETH"] }));
    }
```

- Ex: To unsubscribe from orders events; a user needs to send socket message with the payload

```javascript
    // unsubscribe from topic
    conn.send(JSON.stringify({ method: "unsubscribe", topic: "orders" }));

    // unsubscribe from individual symbols
    conn.send(JSON.stringify({ method: "unsubscribe", topic: "marketDepth", symbols: ["BNB_BTC"] }));
```

- Ex: To extend connection life; a user needs to send socket message with the payload

```javascript
    // This will extend the connection time to another 60 minutes
    // It's good to send this message every 30 minutes to maintain the connection life
    conn.send(JSON.stringify({ method: "keepAlive" }));
```

- Ex: To close a connection life; a user needs to send socket message with the payload

```javascript
    // Connections will auto close after 60 minutes by default if no "keepAlive" messages received
    // Connections with no subscriptions will be closed, regardless the keepAlive messages.
    conn.send(JSON.stringify({ method: "close" }));
```
