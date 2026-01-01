# Plano de Implementação: Anime Discovery & Tracker App

## 1. Visão Geral
Desenvolver um aplicativo mobile (Flutter/Dart) que funcione como um agregador de animes, permitindo visualizar lançamentos, gerenciar listas pessoais e redirecionar para serviços de streaming oficiais.

## 2. Requisitos Técnicos
- **Framework:** Flutter (Mobile & Web)
- **Gerenciamento de Estado:** Provider ou Riverpod
- **Fonte de Dados:** Jikan API (REST) - https://api.jikan.moe/v4
- **Persistência Local:** Isar Database ou SQLite (para marcações de progresso)
- **Redirecionamento:** url_launcher (Deep Linking para Netflix, Crunchyroll, etc.)

## 3. Estrutura de Funcionalidades (Sprints)

### Fase 1: Setup e Consumo de API
- [ ] Inicializar projeto Flutter com Clean Architecture (camadas de data, domain e presentation).
- [ ] Implementar cliente HTTP (Dio) com tratamento de erros.
- [ ] Criar modelos (Models) para os dados do Jikan: `Anime`, `Images`, `Trailer`, `StreamingLinks`.
- [ ] Implementar a Home Screen com o endpoint `/seasons/now` para exibir lançamentos.

### Fase 2: Interface e Experiência do Usuário (UI/UX)
- [ ] Design em Dark Mode por padrão.
- [ ] Grid View na home com posters de alta resolução e badges de nota.
- [ ] Tela de Detalhes contendo: Sinopse, Trailer (YouTube), Gêneros e Nota.
- [ ] Barra de busca funcional conectada ao endpoint `/anime?q=`.

### Fase 3: Sistema de Tracking (Persistência)
- [ ] Implementar banco de dados local para salvar o status do usuário.
- [ ] Estados de marcação:
    - `Planejo Assistir`
    - `Assistindo`
    - `Finalizado`
- [ ] Adicionar aba "Minha Lista" para filtrar animes por esses status.

### Fase 4: Integração Externa (Deep Linking)
- [ ] No objeto de detalhes, mapear a lista `external` fornecida pela API.
- [ ] Criar um seletor de "Onde Assistir" que abra o App ou Browser via `url_launcher`.
- [ ] Implementar fallback: Caso não haja link direto, gerar busca automática por "Assistir [Nome do Anime]" no Google.

## 4. Instruções para o Antigravity
1. Analise este arquivo e gere o `pubspec.yaml` com todas as dependências necessárias.
2. Siga o padrão de pastas: `lib/features/`, `lib/core/`.
3. Priorize a performance das imagens usando `cached_network_image`.
4. Após cada fase concluída, gere um log de progresso e aguarde validação.

## 5. Critérios de Aceite
- O app deve carregar a lista inicial em menos de 2 segundos.
- O status de "Já assistido" deve persistir mesmo após fechar o app.
- O clique no link de streaming deve abrir o aplicativo externo se instalado.