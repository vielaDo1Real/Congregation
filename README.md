# Congregation

## Visão Geral
Congregation é um projeto que consiste em uma API RPC privada, Transaction Boosting e um Nó Lightning. Ele visa oferecer serviços otimizados para interações com a blockchain do Bitcoin, fornecendo um meio eficiente de retransmissão de transações e pagamentos instantâneos.

## Infraestrutura (desenvolvimento)
- **Hardware:** 
    Notebook Sony VAIO FE14 (2021)
    NVMe CL1-8D256  256 GB (256052966400)
    Memória física 8 GB (8589934592)

- **Armazenamento:**
    60 GB livres em NVMe
- **Sistema Operacional:**
    Windows 11 Home + WSL2 (Ubuntu Server)

- **Conectividade:** 
    Internet 15 MB/s

- **Linguagem:**
    Python + bash

- **Framework:** 
    FastAPI + uvicorn

- **Desenvolvimento:**
    WSL2 + Ubuntu Server,
    VS Code + WSL,
    Ambiente Virtual Python,
    MongoDB + PostgreSQL

## Componentes Principais
- **API RPC Privada:** 
    Interface para interações diretas com o Bitcoin Core.
    Será responsável por gerenciar transações e interagir com o Nó Lightning.
    Funcionalidades: Criar transações, consultar saldos, gerar invoices, etc.

- **Transaction Boosting:** 
    Serviço para retransmissão de transações com ajustes de taxa.
    Mecanismo para acelerar transações na Lightning Network.
    Pode incluir técnicas como fee bumping ou multipath payments.

- **Nó Lightning:** 
    Operações de pagamento rápido e roteamento de transações.
    Configuração de um nó Lightning Network para processar transações off-chain.
    Integração com a API RPC para gerenciar pagamentos e invoices.

- **Arquitetura**
    Camada de Aplicação :
        FastAPI : Servidor principal que expõe endpoints RESTful.
    Endpoints :
        /register, /login, /boost-transaction, /lightning.
    Camada de Integração :
        Bitcoin Core RPC : Comunicação com o nó Bitcoin.
        Lightning Network Daemon (LND) : Gerenciamento de canais e pagamentos.
        Scripts de Automação : Scripts Python para tarefas específicas.
    Camada de Dados :
        MongoDB : Transações e configurações.
        PostgreSQL: Armazenamento de informações de usuários.
    Ambiente :
        Docker Compose : Futura configuração para facilitar o deploy.
        Configurações : Arquivos de configuração centralizados.


## Estrutura do Projeto
```
/Congregation/
│── api/                # FastAPI (Endpoints e Serviços)
│── btc_core/           # Conexão com Bitcoin Core RPC
│── lightning/          # Gerenciamento de canais LN
│── transaction_boost/  # Serviço de RBF e CPFP
│── database/           # Integração com MongoDB e PostgreSQL
│── config/             # Configuração do ambiente
│── scripts/            # Scripts de automação
│── tests/              # Testes unitários e de integração
│── main.py             # Ponto de entrada do FastAPI
│── requirements.txt    # Dependências do projeto
│── docker-compose.yml  # (Futuramente, para facilitar deploy)

/docs
    /Install
        - bitcoin-core-setup.md
    /configurations
        - wsl2-setup.md
        - ubuntu-server-setup.md
```

## Planejamento Técnico
O projeto será desenvolvido utilizando Python e FastAPI, garantindo uma API eficiente e escalável. Será integrado ao Bitcoin Core através da interface RPC, permitindo consultas e operações de maneira otimizada. O uso do WSL2 permitirá um ambiente de desenvolvimento flexível, simulando uma infraestrutura de produção.

## Documentação Relacionada
- [Guia de Instalação do Bitcoin Core](/docs/Install/bitcoin-core-setup.md)
- [Configuração do WSL2](/docs/configurations/wsl2-setup.md)
- [Configuração do Ubuntu Server](/docs/configurations/ubuntu-server-setup.md)

## Estratégias de Monetização
- **Exemplo de MVP:**
    API RPC para criar invoices e receber pagamentos na Lightning Network.

1. **Serviços de Transaction Boosting:** Taxas sobre retransmissão de transações otimizadas.
2. **Acesso Privado à API RPC:** Modelo de assinatura para uso da infraestrutura RPC privada.
3. **Nó Lightning:** Tarifas sobre roteamento de pagamentos relâmpago.

## MVP Inicial:
1. **Criar um MVP funcional e testar monetização:**
    1. Rodar API RPC em ambiente fechado e testar viabilidade.
	2. Viabilizar o MVP.
		1. Criar planos pagos de acesso à API RPC para traders e bots.
			1. Configurar pagamento via BTC/LN antes da execução do serviço.
		2. Criar um site simples apresentando o serviço.
			1. Divulgar no Twitter e Reddit (comunidade Bitcoin).

		3. Cobrar $5–$20 por transação acelerada via RBF/CPFP.	
		4. Monetizar taxas de roteamento Lightning.
		5. Criar um bot no Telegram para serviços automatizados.


## Objetivo
Criar um ambiente robusto e rentável, fornecendo soluções eficientes para operações na rede Bitcoin e explorando oportunidades de monetização a curto prazo.