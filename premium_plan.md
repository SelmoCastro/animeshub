# ⚡ Anime HUB: Ultra High-End Implementation Plan

## 1. Identidade Visual (UI/UX "Fantastic" Mode)
- **Tema:** Ultra Dark (Fundo #080808) com detalhes em Neon Violet (#A020F0).
- **Estilo:** Glassmorphism (efeito de vidro fosco) em todos os cards e modais.
- **Micro-interações:** Animações de entrada "Fade-in" e "Scale" ao rolar a página.
- **Banner de Lançamentos:** Slider tipo "Carousel" com efeito de profundidade (parallax) e gradiente preto na base para legibilidade.

## 2. Sistema de Autenticação (Backend)
- **Provedor:** Firebase Authentication.
- **Fluxo:** - Tela de Splash animada.
    - Login com E-mail/Senha e Social Login (Google).
    - Persistência: Manter o usuário logado via Token.
- **Segurança:** Regras de Firestore para que apenas o dono da conta veja sua lista de "Já Assistidos".

## 3. Navegação por Abas (Tab View Architecture)
O App deve ser estruturado em 4 abas principais no rodapé (Bottom Navigation Bar):

1.  **Home (Página Inicial):**
    - Banner Superior: Animes lançados HOJE (Filtro por dia da semana da Jikan API).
    - Seção: "Em Alta" (Top Ranking).
2.  **Explorar (Lançamentos Futuros):**
    - Aba dedicada a `/seasons/upcoming`.
    - Filtro por gênero e temporada.
3.  **Minha Lista (Tracking):**
    - Abas internas: [Vou Assistir | Assistindo | Finalizados].
    - Sincronização em tempo real com Firebase.
4.  **Perfil:**
    - Configurações, Troca de Senha e estatísticas de "Tempo assistido".

## 4. Integração de Deep Linking (Direcionamento)
- Criar um componente `StreamingButton` que verifica dinamicamente:
    1. Se existe link oficial no campo `external` da Jikan API.
    2. Se não, gerar link de busca profunda: `crunchyroll.com/search?q={nome_anime}`.

## 5. Tarefas para o Antigravity (Execução)
1.  **Setup de UI:** Instale `flutter_blurhash` para placeholders e `google_fonts` (usar fonte 'Orbitron' ou 'Inter').
2.  **Firebase:** Configure o `firebase_core` e `cloud_firestore`.
3.  **State Management:** Use **Riverpod** para gerenciar o estado global de autenticação e a lista de animes.
4.  **Performance:** Implemente `shimmer effect` enquanto os dados da API carregam para não ter tela branca.