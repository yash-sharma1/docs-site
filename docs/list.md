# List a Trading Pair

## How is a trading pair created on Binance DEX?

The design philosophy of Binance DEX adheres to the idea that the most efficient and low cost way to perform trading and 
price-discovery is still to use single order book. This single order book is managed and replicated across all 
full nodes with the same, deterministic matching logic.

Simply allowing trading between two assets seems easy enough, however it is expensive for not only the network 
but also its users in long term (and liquidity costs can be much larger). In order to efficiently use the 
network, Binance Chain only list assets against BNB and other widely accepted market quote assets. 

After an asset is issued, which costs a small fee,
anyone can "propose" to all validators to list it against particular quote assets. 
Validators then vote to accept the proposal. 
A fee is charged to prevent network abuse and to incentivize voting.
Once the proposal is accepted, the owner of the base asset can list the trading pair.

## The "List" transaction

As mentioned before, if you want to list a trading pair, you need to issue the token you want to list. Then you have to 
create a proposal first and deposit enough BNB, then you should wait for voting result of validators (so far is two weeks).

But to prevent abuse, if your proposal is rejected by validators, all of your deposit will be distributed to 
validators. So please make sure you are creating **reasonable** proposals, and you are encouraged to talk with 
community and validators before you create the actual proposal. If your proposal is passed, you deposit 
will be returned to your account.

Then the owner of the asset to be listed can list the trading pair via command line according to the proposal 
approved before the proposal is expired.

### Issuing the token

First, you need to issue the token. You have to make sure that there is enough BNB remaining in your account.

You can refer to [issue doc](tokens.md) in case you do not know how to do it.

### Creating a listing proposal (to list a trading pair)

After issuing the token, you need to create a proposal to list this token against a quote asset.

```bash
$  ./bnbcli gov submit-list-proposal --from test --deposit 10000000000:BNB \
--base-asset-symbol AAA-254 --quote-asset-symbol BNB --init-price 100000000 --title "list AAA-254/BNB" \
--description "list AAA-254/BNB" --expire-time 1570665600 --chain-id=chain-bnb --node=172.22.41.165:26657 --json
Password to sign with 'test':
{  
   "Height":"281822",
   "TxHash":"55966E369E567DF55B061E129EAA40EA09B5AA2F",
   "Response":{  
      "data":"Hg==",
      "log":"Msg 0: ",
      "tags":[  
         {  
            "key":"YWN0aW9u",
            "value":"c3VibWl0LXByb3Bvc2Fs"
         },
         {  
            "key":"cHJvcG9zZXI=",
            "value":"Ym5jMTdrd3pudWxqc3k0bjg5d2NqZDZlc3gyajV0MHczMjZjMDN4aHly"
         },
         {  
            "key":"cHJvcG9zYWwtaWQ=",
            "value":"Hg=="
         },
         {  
            "key":"YWN0aW9u",
            "value":"c3VibWl0X3Byb3Bvc2Fs"
         }
      ]
   }
}
```

You need to specify the base asset you want to list, quote asset and init price. And when the proposal is 
passed, you should use the identical params to list.

And you also have to set expire time after which you will not be able to list even though proposal is passed.

Of course, the coins you deposit will be returned to your account once the proposal is passed. But if the proposal 
is rejected by the community, the coins will be distributed to validators. So please talk about the proposal in the 
online forum community before creating it and make sure there is an agreement on your listing proposal, because any 
new list would affect the whole network efficiency. 

You may notice that the numbers like deposit number and price are very large. The numbers are presented as integers in the chain data structure and codebase. The last 8 digits of the integer represent the fractional-part 
(digits after the decimal point) by default if the number is presented in a human readable format. For example, 
10000000000 means 100.00000000 if represented as a human readable number.

### The deposit

Before validators can vote on the proposal you created, you need to deposit enough BNB (like 2000 BNB). You 
may have already deposit a number of BNB when you propose, in the upper case, it is 100 BNB. So now you still 
need to deposit another 1900 BNB. Check the [fees table](trading-spec.md) for the current deposit requirements.

```bash
$  ./bnbcli gov deposit --deposit 190000000000:BNB --from test --proposal-id 14 
--chain-id=chain-bnb --node=172.22.41.165:26657 --json
Password to sign with 'test':
{  
   "Height":"282059",
   "TxHash":"78EE857C19E44294387CEE28C9CB71895EB0B670",
   "Response":{  
      "log":"Msg 0: ",
      "tags":[  
         {  
            "key":"YWN0aW9u",
            "value":"ZGVwb3NpdA=="
         },
         {  
            "key":"ZGVwb3NpdGVy",
            "value":"Ym5jMTdrd3pudWxqc3k0bjg5d2NqZDZlc3gyajV0MHczMjZjMDN4aHly"
         },
         {  
            "key":"cHJvcG9zYWwtaWQ=",
            "value":"Hg=="
         },
         {  
            "key":"YWN0aW9u",
            "value":"ZGVwb3NpdA=="
         }
      ]
   }
}
```

### Wait for voting result

When you have deposited enough BNB, the proposal's status will switch to `VotingPeriod`. Then you should wait
for voting result from validators (for now is two weeks).

If proposal is rejected by validator, the money you have deposited will be distribute to validators.

If proposal is passed, BNB you have deposited will be returned.

You can query proposal status via CLI.

```bash
$  ./bnbcli gov proposal --proposal-id 15 --chain-id=chain-bnb --node=172.22.41.165:26657
{
  "type": "gov/TextProposal",
  "value": {
    "proposal_id": "15",
    "title": "list AAA-254/BNB",
    "description": "{\"base_asset_symbol\":\"AAA-254\",\"quote_asset_symbol\":\"BNB\",\"init_price\":100000000,\"description\":\"list AAA-254/BNB\",\"expire_time\":\"2019-10-10T00:00:00Z\"}",
    "proposal_type": "ListTradingPair",
    "proposal_status": "Passed",
    "tally_result": {
      "yes": "100000000000",
      "abstain": "0",
      "no": "0",
      "no_with_veto": "0"
    },
    "submit_time": "2018-12-25T09:17:56.128860238Z",
    "total_deposit": [
      {
        "denom": "BNB",
        "amount": "200000000000"
      }
    ],
    "voting_start_time": "2018-12-25T09:21:14.282127201Z"
  }
}
```

### When the proposal passes

When proposal is passed, the owner of the token to be listed can list the token before `expire_time` specified.

If you forget the symbol name of the token you issued, you can query your account info for detail.
```bash
$  ./bnbcli account bnc1wwgakqy32m7vdnlf00pctf9hnaak37eh7wkmqa --trust-node --node=172.22.41.165:26657
{  
   "type":"bnbchain/Account",
   "value":{  
      "base":{  
         "address":"bnc1wwgakqy32m7vdnlf00pctf9hnaak37eh7wkmqa",
         "coins":[  
            {  
               "denom":"AAA-254",
               "amount":"19500000000000000"
            }
         ],
         "public_key":{  
            "type":"tendermint/PubKeySecp256k1",
            "value":"A1V88I61gCbF2V1RqdCxb0UN/8g95mNUlJGH5htNNC70"
         },
         "account_number":"0",
         "sequence":"337"
      },
      "name":"node0",
      "frozen":null,
      "locked":null
   }
}
```

Then you can list your asset according to the proposal, you need to make sure that arguments are identical to your 
proposal.

```bash
$  ./bnbcli dex list -s AAA-254 --quote-asset-symbol BNB --from test \
--init-price 100000000 --proposal-id 15 --chain-id=chain-bnb --node=172.22.41.165:26657 --json
{  
   "Height":"282409",
   "TxHash":"77AE3D190F430FE6E4B1A9659BEBB3F022CF7631",
   "Response":{  
      "log":"Msg 0: ",
      "tags":[  
         {  
            "key":"YWN0aW9u",
            "value":"ZGV4TGlzdA=="
         }
      ]
   }
}
```

We will consider making this easier by adding a user friendly interface for tracking proposals in the future.
