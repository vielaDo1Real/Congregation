# Bitcoin Core

### Atualize o sistema:
```
sudo apt update
sudo apt upgrade -y
```

### Baixe o Bitcoin Core:
```
wget https://bitcoincore.org/bin/bitcoin-core-28.1/bitcoin-28.1-x86_64-linux-gnu.tar.gz
```

### Verifique a integridade do arquivo:
```
wget https://bitcoincore.org/bin/bitcoin-core-28.1/SHA256SUMS
wget https://bitcoincore.org/bin/bitcoin-core-28.1/SHA256SUMS.asc
```

### Verifique a assinatura PGP:
Importe a chave PGP do desenvolvedor:
```
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 01EA5486DE18A882D4C2684590C8019E36C2E964
```
Verifique a assinatura:
```
gpg --verify SHA256SUMS.asc SHA256SUMS
```
Checksum do arquivo baixado:
```
sha256sum --check SHA256SUMS
```

### Extraia o arquivo baixado:
```
tar -xzf bitcoin-28.1-x86_64-linux-gnu.tar.gz
```

### Configurações:
```
mkdir -p ~/.bitcoin
nano ~/.bitcoin/bitcoin.conf
```
Configuração inicial ~/.bitcoin/bitcoin.conf:
```
# Permite que o Bitcoin Core atue como um servidor (prune = quantidade máxima disponível para alocação dos blocos em MB)
server=1
prune=61440

# Configuração RPC para comunicação via API
rpcbind=0.0.0.0
rpcallowip=0.0.0.0/0
rpcauth=seu_usuário:sua_senha_hash
rpcport=8332
rpcthreads=4
rpcworkqueue=64

# Ativa o índice completo de transações para consultas rápidas (não funciona em modo prune)
txindex=0

# Força a reindexação da blockchain
reindex=1

# Otimizações de rede (peers, transações e custo min cobrado para retransmissão)
maxconnections=1000
mempoolexpiry=72    
minrelaytxfee=0.00001

# Ajustes de desempenho (disco e threads)
dbcache=300
par=10

# Configuração ZeroMQ para melhor streaming de eventos
zmqpubrawtx=tcp://0.0.0.0:2833
zmqpubrawblock=tcp://0.0.0.0:2833
zmqpubhashtx=tcp://0.0.0.0:2833
zmqpubhashblock=tcp://0.0.0.0:2833
```
Configuração inicial do arquivo /etc/systemd/system/bitcoind.service:
```
[Unit]
Description=Bitcoin daemon
After=network.target

[Service]
ExecStart=/usr/local/bin/bitcoind -conf=/home/<USER>/.bitcoin/bitcoin.conf -pid=/home/<USER>/.bitcoin/bitcoind.pid
User=seu_user_linux
Group=seu_grupo_linux
Type=simple
WorkingDirectory=/home/nofx/.bitcoin
PIDFile=/home/nofx/.bitcoin/bitcoind.pid
Restart=on-failure
RestartSec=10s
LimitNOFILE=50000

[Install]
WantedBy=multi-user.target
```

### Restar Bitcoin Core:
```
bitcoind -daemon
```

### Configurar o port forwarding no Windows
Encaminhar a porta 8332 do WSL2 para a rede externa
```
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8332 connectaddress=172.22.224.1 connectport=8332
```
Verifique o IP do WSL2 com:
```
ip -4 addr show eth0 | grep inet
```
Abrir a porta no firewall do Windows
Execute no PowerShell (Admin):
```
New-NetFirewallRule -DisplayName "Bitcoin RPC" -Direction Inbound -Protocol TCP -LocalPort 8332 -Action Allow
```

### Comandos relacionados ao gerenciameno de sincronização:
```
# Reiniciar o Bitcoin Core
sudo systemctl restart bitcoind

# Monitorar a taxa de download
sudo iftop -i eth0

# Inicia reindexação forçada
bitcoind -reindex

# Informações gerais (mais dinâmica)
bitcoin-cli -getinfo

# Informações gerais
bitcoin-cli getblockchaininfo (mais detalhada)

# Acompanhar log em tempo real
tail -f ~/.bitcoin/debbug.log

# innformações simplificadas do progresso de sincronização (atualizada a cada 10 segundos)
while true; do
    clear
    echo "Monitorando Blockchain Info..."
    bitcoin-cli getblockchaininfo | grep -E 'blocks|verificationprogress' | awk '{print $1, $2}'
    sleep 10
done 

# Verificar a integridade da blockchain local
bitcoin-cli verifychain

# Você pode especificar dois parâmetros opcionais:

# checklevel: Define o nível de verificação (padrão: 3).
# nblocks: Número de blocos a verificar a partir do topo da cadeia (padrão: 6).

# Verifica os últimos 100 blocos
bitcoin-cli verifychain 4 100
```