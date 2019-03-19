# Governance

### Primer on Governance

Binance Chain has its own built-in governance module that lets BNB holders submit proposals for adding trade pairs.  In order for the proposal to be open for voting, it needs to come with a `deposit` that is greater than a parameter called `Deposit`. The `deposit` need not be provided in its entirety by the submitter. If the initial proposer's `deposit` is not sufficient, the proposal enters the `deposit_period` status. Then, any BNB holder can increase the deposit by sending a `depositTx`. 

### Query Parameters
* `Deposit` is updated in real time and you could view the latest data [here](https://testnet-dex.binance.org/api/v1/fees).
* `deposit_period`

### Participate in Governance

####  Submit a Proposal
To add a new trading pairs, you could run the following command:
```shell
./bnbcli gov submit-list-proposal --from test --deposit 10000000000:BNB 
--base-asset-symbol AAA-254 --quote-asset-symbol BNB --init-price 100000000 --title "list AAA-254/BNB" 
--description "list AAA-254/BNB" --expire-time 1570665600 --chain-id=Binance-Chain-Nile --node=data-seed-pre-2-s1.binance.org:80 --json
```
#### Add deposit for a Proposal
In current Binance Chain Testnet, the max deposit period is **two weeks**. After submitting a proposal, you have two weeks to increase your deposit, otherwise your proposal will not go tp voting period and get rejected directly.  
```shell
./bnbcli gov deposit --from name --proposal-id <proposl-ID> --deposit <amount>：BNB --chain-id=Binance-Chain-Nile --node=data-seed-pre-2-s1.binance.org:80 
```
#### Query Information of a Proposal
To see detailed information of some proposla, you could run the following command:
```shell
./bnbcli gov query-proposal --proposal-id <proposal-ID> --chain-id=Binance-Chain-Nile --node=data-seed-pre-2-s1.binance.org:80
```
Example output；
```json
{
  "type": "gov/TextProposal",
  "value": {
    "proposal_id": "100",
    "title": "list CZZ-696/BNB",
    "description": "{\"base_asset_symbol\":\"CZZ-696\",\"quote_asset_symbol\":\"BNB\",\"init_price\":100000000,\"description\":\"list CZZ-696/BNB\",\"expire_time\":\"2019-03-21T09:00:00+09:00\"}",
    "proposal_type": "ListTradingPair",
    "proposal_status": "Passed",
    "tally_result": {
      "yes": "1100000000000",
      "abstain": "0",
      "no": "0",
      "no_with_veto": "0"
    },
    "submit_time": "2019-03-07T20:49:03.504103408Z",
    "total_deposit": [
      {
        "denom": "BNB",
        "amount": "200000000000"
      }
    ],
    "voting_start_time": "2019-03-07T21:01:36.159585594Z"
  }
}
```
You could get the information about the proposal's status and its tally result clearly. 
#### Query votes of a Proposal
You could track the votes for your proposal with the following command；
```shell
./bnbcli gov query-votes --proposal-id 272 --chain-id=Binance-Chain-Nile --node=data-seed-pre-2-s1.binance.org:80
```
Example output:
```
[
  {
    "voter": "tbnb1q82g2h9q0kfe7sysnj5w7nlak92csfjztymp39",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb1r6l0c0fxu458hlq6m7amkcltj8nufyl9mr2wm5",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb193t8pkhm2sxw5uy5ypesygda8rzsk25ge3e9y7",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb183nch8pn3f698vurrqypq3s254slcane2t66aj",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb12hlquylu78cjylk5zshxpdj6hf3t0tahwjt3ex",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb1vehecekrsks5sshcwvxyeyrd469j9wvcqm37yu",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb108drn8exhv72tp40e6lq9z949nnjj54yzqrr2f",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb135mqtf9gef879nmjlpwz6u2fzqcw4qlzrqwgvw",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb1hexqyu3m8uuudqdnnpnsnlwe6xg0n3078lx68l",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb1earfwcjre04hp7phqnkw8ts04tkumdn0cyzun0",
    "proposal_id": "272",
    "option": "Yes"
  },
  {
    "voter": "tbnb167yp9jkv6uaqnyq62gfkx82xmfny0cl9xe04zj",
    "proposal_id": "272",
    "option": "Yes"
  }
]
```