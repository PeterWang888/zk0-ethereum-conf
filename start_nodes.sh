#!/bin/bash
chainid=102152

account0=$(cat accounts/account0.txt)
account1=$(cat accounts/account1.txt)
account2=$(cat accounts/account2.txt)
account3=$(cat accounts/account3.txt)
account4=$(cat accounts/account4.txt)

# validator and full node
nohup geth --datadir node0 --networkid $chainid --mine --miner.etherbase $account0 --unlock $account0 --password passwd.txt --allow-insecure-unlock --http --http.api "eth,net,txpool,web3,admin,debug,personal,miner" --http.addr 0.0.0.0 --http.port 8545 -ws --ws.api "eth,net,txpool,web3,admin,debug,personal,miner" --ws.origins "*" --ws.addr 0.0.0.0 --ws.port 8546 --authrpc.port 8551 --port 30303 --http.corsdomain "*" --graphql --syncmode full --config configs/config0.toml > logs/node0.log 2>&1 &

# validator and full node
nohup geth --datadir node1 --networkid $chainid --mine --miner.etherbase $account1 --unlock $account1 --password passwd.txt --allow-insecure-unlock --http --http.api "eth,net,txpool,web3,admin,debug,personal,miner" --http.addr 0.0.0.0 --http.port 9545 -ws --ws.api "eth,net,txpool,web3,admin,debug,personal,miner" --ws.origins "*" --ws.addr 0.0.0.0 --ws.port 9546 --authrpc.port 8552 --port 30304 --http.corsdomain "*" --graphql --syncmode full --config configs/config1.toml > logs/node1.log 2>&1 &

# validator and full node
nohup geth --datadir node2 --networkid $chainid --mine --miner.etherbase $account2 --unlock $account2 --password passwd.txt --allow-insecure-unlock --http --http.api "eth,net,txpool,web3,admin,debug,personal,miner" --http.addr 0.0.0.0 --http.port 10545 -ws --ws.api "eth,net,txpool,web3,admin,debug,personal,miner" --ws.origins "*" --ws.addr 0.0.0.0 --ws.port 10546 --authrpc.port 8553 --port 30305 --http.corsdomain "*" --graphql --syncmode full --config configs/config2.toml > logs/node2.log 2>&1 &

# validator and full node
nohup geth --datadir node3 --networkid $chainid --mine --miner.etherbase $account3 --unlock $account3 --password passwd.txt --allow-insecure-unlock --http --http.api "eth,net,txpool,web3,admin,debug,personal,miner" --http.addr 0.0.0.0 --http.port 11545 -ws --ws.api "eth,net,txpool,web3,admin,debug,personal,miner" --ws.origins "*" --ws.addr 0.0.0.0 --ws.port 11546 --authrpc.port 8554 --port 30306 --http.corsdomain "*" --graphql --syncmode full --config configs/config3.toml > logs/node3.log 2>&1 &

# full node
nohup geth --datadir node4 --networkid $chainid --unlock $account4 --password passwd.txt --allow-insecure-unlock --http --http.api "eth,net,txpool,web3,admin,debug,personal,miner" --http.addr 0.0.0.0 --http.port 12545 -ws --ws.api "eth,net,txpool,web3,admin,debug,personal,miner" --ws.origins "*" --ws.addr 0.0.0.0 --ws.port 12546 --authrpc.port 8555 --port 30307 --http.corsdomain "*" --graphql --syncmode full --config configs/config4.toml > logs/node4.log 2>&1 &



