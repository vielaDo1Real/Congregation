# WSL2

### Instalação:
```

```

### Configuração personalizada:
Arquivo .wslconfig
```
notepad C:\Users\SeuUsuário\.wslconfig

mkdir C:\WSL

# Define o tamanho da unidade swap
fsutil file createnew C:\WSL\swap.vhdx 8589934592

# Conteúdo do arquivo (configure de acordo com seu hardware):
memory=2GB  # Ajuste conforme necessário
processors=2
swap=2GB
swapFile=C:\\WSL\\swap.vhdx  # Define um local específico para o swap (se desejar)
localhostForwarding=true  # Permite acesso a serviços do WSL via localhost
```
### Executar o WSL
```
# Desliga a instância
wsl --shutdown
wsl
```

### Reiniciar instância localmente (Windows):
```
wsl --shutdown
net stop LxssManager
net start LxssManager
wsl
```

### Redirecionamento de portas (Windows/WSL2):
```
# Rota RPC Bitcoin Core
netsh interface portproxy add v4tov4 listenport=8333 listenaddress=0.0.0.0 connectport=8333 connectaddress=172.24.X.X
```