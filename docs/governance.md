# Governance

### Primer on Governance

Binance Chain has its own built-in governance module that lets BNB holders submit proposals for adding trade pairs.  In order for the proposal to be open for voting, it needs to come with a `deposit` that is greater than a parameter called `Deposit`. The `deposit` need not be provided in its entirety by the submitter. If the initial proposer's `deposit` is not sufficient, the proposal enters the `deposit_period` status. Then, any BNB holder can increase the deposit by sending a `depositTx`. 

### Query Parameters
* `Deposit` is updated in real time and you could view the latest data [here](https://testnet-dex.binance.org/api/v1/fees).
* `deposit_period`

### Participate in Governance

####  Submit a Proposal
To add a new trading pairs, you could run the following command:
```
./bnbcli gov submit-list-proposal --from test --deposit 10000000000:BNB 
--base-asset-symbol AAA-254 --quote-asset-symbol BNB --init-price 100000000 --title "list AAA-254/BNB" 
--description "list AAA-254/BNB" --expire-time 1570665600 --chain-id=Binance-Chain-Nile --node=data-seed-pre-2-s1.binance.org:80 --json
```
#### Add deposit for a Proposal
In current Binance Chain Testnet, the max deposit period is two weeks.  
```
bnbcli gov deposit
```
#### Query votes of a Proposal
 