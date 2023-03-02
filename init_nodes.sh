#!/bin/bash
chainid=102152

mkdir -p logs
mkdir -p accounts
mkdir -p configs


account0=$(geth account new --datadir node0 --password passwd.txt| grep "Public address of the key:   " |awk -F: '{print $2}')
account1=$(geth account new --datadir node1 --password passwd.txt| grep "Public address of the key:   " |awk -F: '{print $2}')
account2=$(geth account new --datadir node2 --password passwd.txt| grep "Public address of the key:   " |awk -F: '{print $2}')
account3=$(geth account new --datadir node3 --password passwd.txt| grep "Public address of the key:   " |awk -F: '{print $2}')
account4=$(geth account new --datadir node4 --password passwd.txt| grep "Public address of the key:   " |awk -F: '{print $2}')

echo $account0 > accounts/account0.txt
echo $account1 > accounts/account1.txt
echo $account2 > accounts/account2.txt
echo $account3 > accounts/account3.txt
echo $account4 > accounts/account4.txt


bash -x init_genesis.sh


geth --datadir node0 init genesis.json
geth --datadir node1 init genesis.json
geth --datadir node2 init genesis.json
geth --datadir node3 init genesis.json
geth --datadir node4 init genesis.json


# geth --datadir node0 dumpconfig --networkid $chainid --http --http.addr 0.0.0.0 --http.port 8545 --ws.port 8546 --authrpc.port 8551 --port 30303 > configs/config0.toml
# geth --datadir node1 dumpconfig --networkid $chainid --http --http.addr 0.0.0.0 --http.port 9545 --ws.port 9546 --authrpc.port 8552 --port 30304 > configs/config1.toml
# geth --datadir node2 dumpconfig --networkid $chainid --http --http.addr 0.0.0.0 --http.port 10545 --ws.port 10546 --authrpc.port 8553 --port 30305  > configs/config2.toml
# geth --datadir node3 dumpconfig --networkid $chainid --http --http.addr 0.0.0.0 --http.port 11545 --ws.port 12546 --authrpc.port 8554 --port 30306  > configs/config3.toml
# geth --datadir node4 dumpconfig --networkid $chainid --http --http.addr 0.0.0.0 --http.port 12545 --ws.port 12546 --authrpc.port 8555 --port 30307  > configs/config4.toml


nohup geth --datadir node0 --networkid $chainid --http --http.addr 0.0.0.0 --http.port 8545 --ws.port 8546 --authrpc.port 8551 --port 30303  > logs/node0.log 2>&1 &
nohup geth --datadir node1 --networkid $chainid --http --http.addr 0.0.0.0 --http.port 9545 --ws.port 9546 --authrpc.port 8552 --port 30304  > logs/node1.log 2>&1 &
nohup geth --datadir node2 --networkid $chainid --http --http.addr 0.0.0.0 --http.port 10545 --ws.port 10546 --authrpc.port 8553 --port 30305  > logs/node2.log 2>&1 &
nohup geth --datadir node3 --networkid $chainid --http --http.addr 0.0.0.0 --http.port 11545 --ws.port 12546 --authrpc.port 8554 --port 30306  > logs/node3.log 2>&1 &
nohup geth --datadir node4 --networkid $chainid --http --http.addr 0.0.0.0 --http.port 12545 --ws.port 12546 --authrpc.port 8555 --port 30307  > logs/node4.log 2>&1 &
sleep 5


node0=$(cat logs/node0.log|grep "Started P2P networking " | awk -F "=" '{print $2}')
node1=$(cat logs/node1.log|grep "Started P2P networking " | awk -F "=" '{print $2}')
node2=$(cat logs/node2.log|grep "Started P2P networking " | awk -F "=" '{print $2}')
node3=$(cat logs/node3.log|grep "Started P2P networking " | awk -F "=" '{print $2}')
node4=$(cat logs/node4.log|grep "Started P2P networking " | awk -F "=" '{print $2}')


# node 0
echo "[Node.P2P]" > configs/config0.toml
echo "StaticNodes = ["  >> configs/config0.toml
echo \"$node1\", >> configs/config0.toml
echo \"$node2\", >> configs/config0.toml
echo \"$node3\", >> configs/config0.toml
echo \"$node4\"  >> configs/config0.toml
echo "]"  >> configs/config0.toml
# node 1
echo "[Node.P2P]" > configs/config1.toml
echo "StaticNodes = ["  >> configs/config1.toml
echo \"$node0\", >> configs/config1.toml
echo \"$node2\", >> configs/config1.toml
echo \"$node3\", >> configs/config1.toml
echo \"$node4\"  >> configs/config1.toml
echo "]"  >> configs/config1.toml
# node 2
echo "[Node.P2P]" > configs/config2.toml
echo "StaticNodes = ["  >> configs/config2.toml
echo \"$node0\", >> configs/config2.toml
echo \"$node1\", >> configs/config2.toml
echo \"$node3\", >> configs/config2.toml
echo \"$node4\"  >> configs/config2.toml
echo "]"  >> configs/config2.toml
# node 3
echo "[Node.P2P]" > configs/config3.toml
echo "StaticNodes = ["  >> configs/config3.toml
echo \"$node0\", >> configs/config3.toml
echo \"$node1\", >> configs/config3.toml
echo \"$node2\", >> configs/config3.toml
echo \"$node4\"  >> configs/config3.toml
echo "]"  >> configs/config3.toml
# node 4
echo "[Node.P2P]" > configs/config4.toml
echo "StaticNodes = ["  >> configs/config4.toml
echo \"$node0\", >> configs/config4.toml
echo \"$node1\", >> configs/config4.toml
echo \"$node2\", >> configs/config4.toml
echo \"$node3\" >> configs/config4.toml
echo "]"  >> configs/config4.toml


pkill -SIGINT geth
# mv static-nodes-node0.json node0/static-nodes.json
# mv static-nodes-node1.json node1/static-nodes.json
# mv static-nodes-node2.json node2/static-nodes.json
# mv static-nodes-node3.json node3/static-nodes.json
# mv static-nodes-node4.json node4/static-nodes.json
sleep 5