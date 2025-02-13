#!/bin/bash
set -e  # Interrompe a execução se houver erro

# Atualiza os pacotes do sistema
sudo yum update -y

# Instala dependências do Docker
sudo sudo yum install git -y
sudo yum install -y docker

# Habilita e inicia o Docker
sudo service docker start

# Adiciona o usuário `ec2-user` ao grupo Docker para evitar necessidade de sudo
sudo usermod -aG docker ec2-user

# Instala Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clona o repositório (sem `sudo` para evitar problemas de permissão)
git clone https://github.com/souza-wallace/api-kanyewest.git /home/ec2-user/api-kanyewest
cd /home/ec2-user/api-kanyewest

# Ajusta permissões do diretório para evitar problemas ao rodar os containers
sudo chown -R ec2-user:ec2-user /home/ec2-user/api-kanyewest

# Sobe os containers com Docker Compose
sudo -u ec2-user docker-compose up -d --build

echo "Instalação concluída! A API está rodando."
