# Ubuntu Server (WSL2)

### WSL:
```
wsl --install
wsl --list --verbose
wsl --set-default-version 2
```

### Acessar instância:
```
wsl -d Ubuntu
```

### Update/Upgrade
```
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
```

### Removendo pacotes:
```
sudo apt remove --purge ubuntu-desktop -y
sudo apt autoremove -y
sudo apt autoclean
```

### Mantendo pacotes essenciais:
```
sudo apt install --no-install-recommends ubuntu-minimal -y
```

### Pacotes recomendados:
```
sudo apt install -y net-tools openssh-server tmux htop curl wget ufw iftop jq pandoc
```

### OpenSSH
```
sudo systemctl enable ssh
sudo systemctl start ssh
```

### Ajustes/configuração de rede:

Testar conectividade:
```
curl -I http://google.com
sudo ufw status
```
Caso o WSL Pro esteja ativo:
```
sudo systemctl disable wsl-pro.service --now
```
Ativação do firewall:
```
do ufw enable
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp  # Caso queira rodar um servidor web futuramente
sudo ufw allow 443/tcp  # Para HTTPS
sudo ufw status verbose
```
