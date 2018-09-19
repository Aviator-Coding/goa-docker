# Goacoin - Wallet
## Dockercontainer for Goacoin Wallet

Run Container:
>```docker run --name goacoin-masternode-01 --restart=always -d --net mn_net -p xxx.xxx.xxx.xxx:1947:1947 -p xxx.xxx.xxx.xx:1948:1948  -v /masternode/goacoin_01/.goacoin:/root/.goacoin aviator86/goa-docker```

> /masternode/goacoin_01/.goacoin - is the location where you store your config on the host  
--name  goacoin-masternode-01 - is the tag which will show up in the Container list name it whatever you want

Stoping Container:
>```docker stop goacoin-masternode-01```

Restart Container:
>```docker restart goacoin-masternode-01```

Start Container:
>```docker start goacoin-masternode-01```

Delete Container: Need to stop Container First
>```docker rm goacoin-masternode-01```

See Container Logs:
>```docker logs goacoin-masternode-01```

## Wallet Status inside Container
See goacoin Chain Status:
>```docker exec -it goacoin-masternode-01 goacoin-cli getinfo```

See goacoin Chain Masternode Status:
>```docker exec -it goacoin-masternode-01 goacoin-cli masternode status```