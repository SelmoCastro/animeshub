# Estágio 1: Build da aplicação Flutter
FROM debian:latest AS build-env

# Instalar dependências necessárias para o Flutter (focado em Web)
RUN apt-get update && \
    apt-get install -y curl git wget unzip ca-certificates && \
    apt-get clean

# Clonar o Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Adicionar flutter ao path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Habilitar suporte web (opcional, já vem habilitado nas versões recentes, mas garante)
RUN flutter config --enable-web

# Copiar arquivos do projeto
WORKDIR /app
COPY . .

# Obter dependências
RUN flutter pub get

# Gerar arquivos de código (Freezed/JSON Serializable)
RUN dart run build_runner build --delete-conflicting-outputs

# Buildar para web
RUN flutter build web --release

# Estágio 2: Servir com Nginx
FROM nginx:1.25.3-alpine

# Copiar os arquivos buildados do estágio anterior para a pasta do Nginx
COPY --from=build-env /app/build/web /usr/share/nginx/html

# Copiar configuração customizada do Nginx (se houver)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expor a porta 80
EXPOSE 80

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
