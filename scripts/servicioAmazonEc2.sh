#!/bin/bash
#Parte de automatización "todo en 1".
#Este script es utilizado para instarlar en la máquina que voy a utilizar en amazon todo lo necesario para ejecutar la 
#aplicación de Transparente ugr.

#para ello lo primero que tenemos que haces es conectarme a la máquina mediante ssh.

ssh -i transparente.pem ubuntu@54.201.57.104

#Una vez conectados instalamos todas las herramientas necesaria para la ejecución de la aplicación.

sudo apt-get update
sudo apt-get install -y g++
sudo apt-get install -y curl
sudo apt-get install -y python
sudo apt-get install -y git
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
#Habilitamos Server-Side y Client-Side
sudo apt-get install -y python-psycopg2
sudo apt-get install -y libpq-dev
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

sudo apt-get update
sudo apt-get install -y mongodb-org

git clone https://github.com/TransparenciaUGR/Proyecto-IV.git
cd Proyecto-IV && npm install
cd Proyecto-IV && npm install -g grunt-cli
cd Proyecto-IV && npm install -g grunt-contrib-clean --save-dec
cd Proyecto-IV && npm install -g grunt-contrib-copy --save-dec
cd Proyecto-IV && npm install -g grunt-blanket --save-dec
cd Proyecto-IV && npm install -g grunt-coveralls --save-dec
cd Proyecto-IV && npm install -g mocha
cd Proyecto-IV && npm install mocha chai supertest

cd Proyecto-IV && start mongod
