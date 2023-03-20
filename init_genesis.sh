#!/bin/bash
chainid=102152

account0=$(cat accounts/account0.txt | awk -F "0x" '{print $2}')
account1=$(cat accounts/account1.txt | awk -F "0x" '{print $2}')
account2=$(cat accounts/account2.txt | awk -F "0x" '{print $2}')
account3=$(cat accounts/account3.txt | awk -F "0x" '{print $2}')
account4=$(cat accounts/account4.txt | awk -F "0x" '{print $2}')


echo -n '{
  "config": {
    "chainId": ' > genesis.json
echo -n $chainid >> genesis.json
echo -n ',
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "clique": {
      "period": 5,
      "epoch": 30000
    }
  },
  "difficulty": "0x2",
  "gasLimit": "10000000000",
  "extradata": ' >> genesis.json 

echo -n '"0x0000000000000000000000000000000000000000000000000000000000000000' >> genesis.json
echo -n $account0 >> genesis.json
echo -n $account1 >> genesis.json
echo -n $account2 >> genesis.json
echo -n $account3 >> genesis.json
# echo -n $account4 >> genesis.json
echo '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",' >> genesis.json
  
echo '  "alloc": {
    "bD9E1Eb20FF75653eF480179a4D231253BAd9938": { "balance": "100000000000000000000" },
    "b549a50a5Dbf7F8957646B770413F2750790E119": { "balance": "100000000000000000000" },
    "255Af8ac8E9743B85De49604d2dEC4674CD72f93": { "balance": "100000000000000000000" },
    "2f4Cfb3669EB8F13697Bb6Bd4044d7dC2cA3390A": { "balance": "100000000000000000000" },
    "48205115d36c89502D17C9772829053a9C223912": { "balance": "100000000000000000000" },' >> genesis.json
echo -n "    \"$account0" >> genesis.json
echo '": { "balance": "100000000000000000000" },' >> genesis.json
echo -n "    \"$account1" >> genesis.json
echo '": { "balance": "100000000000000000000" },' >> genesis.json
echo -n "    \"$account2" >> genesis.json
echo '": { "balance": "100000000000000000000" },' >> genesis.json
echo -n "    \"$account3" >> genesis.json
echo '": { "balance": "100000000000000000000" },' >> genesis.json
echo -n "    \"$account4" >> genesis.json
echo '": { "balance": "100000000000000000000" }' >> genesis.json


 echo ' }
}' >> genesis.json