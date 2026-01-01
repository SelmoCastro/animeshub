# Guia: Limpeza da VPS e Deploy do AnimesHUB

Este guia ajuda a remover projetos Docker antigos da sua VPS e instalar o AnimesHUB limpo.

> [!WARNING]
> **ATENÇÃO:** A "Opção 2 (Limpeza Total)" irá apagar **TODOS** os containers e imagens do Docker na sua VPS. Use apenas se você tiver certeza que não há nada importante rodando ou parado que precise ser salvo.

## Passo 1: Limpeza do Ambiente Antigo

Acesse sua VPS via SSH e escolha uma das opções abaixo:

### Opção 1: Desligar projeto específico (Recomendado se tiver o docker-compose antigo)
Se você sabe onde está a pasta do projeto antigo:
```bash
cd /caminho/do/projeto/antigo
docker compose down
```

### Opção 2: Limpeza Total (Remove TUDO do Docker)
Se você quer deixar a VPS **exclusiva** para o AnimesHUB e apagar qualquer resquício anterior:

1. **Parar todos os containers rodando:**
   ```bash
   docker stop $(docker ps -aq)
   ```

2. **Remover todos os containers:**
   ```bash
   docker rm $(docker ps -aq)
   ```

3. **Faxina completa (Remove imagens, redes e cache não utilizados):**
   ```bash
   docker system prune -a -f
   ```
   *Isso libera espaço em disco removendo tudo que não está sendo usado.*

---

## Passo 2: Instalar o AnimesHUB

Agora que a área está limpa:

1. **Volte para a pasta raiz (ou onde deseja instalar):**
   ```bash
   cd ~
   ```

2. **Clone o repositório:**
   ```bash
   git clone https://github.com/SelmoCastro/animeshub.git
   cd animeshub
   ```

3. **Subir o projeto:**
   ```bash
   docker compose up -d --build
   ```

4. **Verificar se está rodando:**
   ```bash
   docker ps
   ```
   Você deve ver o container `animes_hub_web` rodando na porta `8080` (ou `80` se tiver alterado).

---

## Dicas Adicionais

- **Visualizar Logs:** Se algo der errado, veja o que está acontecendo:
  ```bash
  docker logs -f animes_hub_web
  ```

- **Atualizar no Futuro:**
  Para baixar novas versões do GitHub e atualizar:
  ```bash
  git pull
  docker compose up -d --build
  ```
