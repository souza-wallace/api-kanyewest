FROM node:alpine

USER root

# Instalar Nginx e Supervisord
RUN apk update && apk add --no-cache nginx supervisor

# Criar diretório de trabalho para o Node.js
WORKDIR /usr/src/app

# Copiar os arquivos package.json e package-lock.json
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante dos arquivos da aplicação
COPY . .

# Copiar configuração do Nginx
COPY ./docker/nginx/default.conf /etc/nginx/nginx.conf

# Copiar arquivo de configuração do supervisord
COPY ./docker/supervisord.conf /etc/supervisord.conf

# Expor as portas que o Node.js e o Nginx usarão
EXPOSE 80
EXPOSE 3000

# Comando para iniciar o Node.js em segundo plano e o Nginx
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

