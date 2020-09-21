# Band Standard Dataset (BSC)

## Introduction

We have implemented a new interface for developers to integrate price data from Band’s oracle into their application. Now, instead of making the requests to BandChain themselves, dApps and the developers can more easily access price data through our new

These price rate values was calculated using the latest result values from BandChain’s [price](https://guanyu-poa.cosmoscan.io/oracle-script/8) and [ForEx](https://guanyu-poa.cosmoscan.io/oracle-script/9) oracle scripts on our proof-of-authority mainnet, and are currently being updated every 20 minutes.

The data standard currently support the following symbols:

### Cryptocurrencies:

|              Token Name               | Symbol |
| :-----------------------------------: | :----: |
|             Binance Coin              |  BNB   |
|              Binance USD              |  BUSD  |
|                Bitcoin                |  BTC   |
|               Ethereum                |  ETH   |
|                Tether                 |  USDT  |
|                  XRP                  |  XRP   |
|               Chainlink               |  LINK  |
|               Polkadot                |  DOT   |
|             Bitcoin Cash              |  BCH   |
|               Litecoin                |  LTC   |
|                Cardano                |  ADA   |
|              Bitcoin SV               |  BSV   |
| [Crypto.com](http://crypto.com/) Coin |  CRO   |
|                  EOS                  |  EOS   |
|                 Tezos                 |  XTZ   |
|                 Tron                  |  TRX   |
|                Stellar                |  XLM   |
|                Cosmos                 |  ATOM  |
|                Monero                 |  XMR   |
|                  OKB                  |  OKB   |

### Foreign Currencies:

*Coming Soon*

### Commodities

*Coming Soon*

# Supported Price Pairs

Band Standard Dataset supports price query with any denomination as long as the base and quote symbols are supported in the list above.

For example, you can use the APIs in Javascripts and Solidity to query the following price pairs:

- `BTC/USD`
- `BNB/ETH`

# Using the Reference Prices in Smart Contracts

For EVM-compatible chains, we’ve deployed a new `StdReference` contract. This contract exposes `getReferenceData` and `getRefenceDataBulk` functions.

`getReferenceData` takes two strings as the inputs, the base and quote symbol, respectively. It then queries the `StdReference` contract for the latest rates for those two tokens, and returns a `ReferenceData` struct, shown below.

```
struct ReferenceData {
    uint256 rate; // base/quote exchange rate, multiplied by 1e18.
    uint256 lastUpdatedBase; // UNIX epoch of the last time when base price gets updated.
    uint256 lastUpdatedQuote; // UNIX epoch of the last time when quote price gets updated.
}
```

`getReferenceDataBulk` instead takes two lists, one of the `base` tokens, and one of the `quotes`. It then proceeds to similarly queries the price for each base/quote pair at each index, and returns an array of `ReferenceData` structs.

For example, if we call `getReferenceDataBulk` with `['BTC','BTC','ETH']` and `['USD','ETH','BNB']`, the returned `ReferenceData` array will contain information regarding the pairs:

- `BTC/USD`
- `BTC/ETH`
- `ETH/BNB`

### Example Usage

The contract code below demonstrates a simple usage of the new `StdReference` contract and the `getReferenceData` function.

```
pragma solidity 0.6.11;
pragma experimental ABIEncoderV2;

interface IStdReference {
    /// A structure returned whenever someone requests for standard reference data.
    struct ReferenceData {
        uint256 rate; // base/quote exchange rate, multiplied by 1e18.
        uint256 lastUpdatedBase; // UNIX epoch of the last time when base price gets updated.
        uint256 lastUpdatedQuote; // UNIX epoch of the last time when quote price gets updated.
    }

    /// Returns the price data for the given base/quote pair. Revert if not available.
    function getReferenceData(string memory _base, string memory _quote)
        external
        view
        returns (ReferenceData memory);

    /// Similar to getReferenceData, but with multiple base/quote pairs at once.
    function getRefenceDataBulk(string[] memory _bases, string[] memory _quotes)
        external
        view
        returns (ReferenceData[] memory);
}

contract DemoOracle {
    IStdReference ref;

    uint256 public price;

    constructor(IStdReference _ref) public {
        ref = _ref;
    }

    function getPrice() external view returns (uint256){
        IStdReference.ReferenceData memory data = ref.getReferenceData("BTC","USD");
        return data.rate;
    }

    function getMultiPrices() external view returns (uint256[] memory){
        string[] memory baseSymbols = new string[](2);
        baseSymbols[0] = "BTC";
        baseSymbols[1] = "ETH";

        string[] memory quoteSymbols = new string[](2);
        quoteSymbols[0] = "USD";
        quoteSymbols[1] = "USD";
        IStdReference.ReferenceData[] memory data = ref.getRefenceDataBulk(baseSymbols,quoteSymbols);

        uint256[] memory prices = new uint256[](2);
        prices[0] = data[0].rate;
        prices[1] = data[1].rate;

        return prices;
    }

    function savePrice(string memory base, string memory quote) external {
        IStdReference.ReferenceData memory data = ref.getReferenceData(base,quote);
        price = data.rate;
    }
}
```

## Contract Addresses

Due to the high transaction fees & potential network congestions, the price feeds on the blockchains are updated at different frequencies depending on the network.

### Supported Networks

| Blockchain    |         Aggregator Contract Address          | Update Every |                           Explorer                           |
| :------------ | :------------------------------------------: | :----------: | :----------------------------------------------------------: |
| BSC (Testnet) | `0x2d12c12d17fbc9185d75baf216164130fc269ff1` |   20 mins    | [link](https://testnet.bscscan.com/address/0x2d12c12d17fbc9185d75baf216164130fc269ff1) |
| BSC (Mainnet) | `0x2d12c12d17fbc9185d75baf216164130fc269ff1` |   20 mins    | [link](https://bscscan.com/address/0x2d12c12d17fbc9185d75baf216164130fc269ff1) |

# Using the Reference Prices in JavaScript

Our node helper library [`bandchain.js`](https://www.npmjs.com/package/@bandprotocol/bandchain.js) also now supports a new function, `getReferenceData`. This function takes one argument, a list of token pairs to query the result of. It then returns a list of corresponding rate values.

### Example Usage

The code below shows an example usage of the function

```
const BandChain = require('@bandprotocol/bandchain.js');

(async () => {
  const endpoint = 'https://poa-api.bandchain.org';

  const bandchain = new BandChain(endpoint);
  const rates = await bandchain.getReferenceData(['BTC/USD', 'BTC/ETH', 'EUR/USD', 'EUR/BTC']);
  console.log(rates);
})();
```

The corresponding result will then be similar to

```
$ node index.js
[
  {
    pair: 'BTC/USD',
    rate: 11886.605,
    rawRate: { value: 11886605000000n, decimals: 9 }
  },
  {
    pair: 'BTC/ETH',
    rate: 25.848312529900404,
    rawRate: { value: 25848312529n, decimals: 9 }
  },
  {
    pair: 'EUR/USD',
    rate: 1.197215344,
    rawRate: { value: 1197215344n, decimals: 9 }
  },
  {
    pair: 'EUR/BTC',
    rate: 0.00010071970457502374,
    rawRate: { value: 100719n, decimals: 9 }
  }
]
```

For each pair, the following information will be returned:

- `pair`: The base/quote symbol pair string

- `rate`: The resulting rate of the given pair

- `rawRate` This object consists of two parts.

  - `value` is the `BigInt` value of the actual rate, multiplied by `10^decimals`
  - `decimals` is then the exponent by which `rate` was multiplied by to get `rawRate`

### Original Link: <https://hackmd.io/@tansawit/aggregator-ecosystem-guide-bsc>