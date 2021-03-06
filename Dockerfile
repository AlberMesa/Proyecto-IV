FROM ubuntu

RUN sudo apt-get update
RUN sudo apt-get install -y g++
RUN sudo apt-get install -y curl
RUN sudo apt-get install -y python
RUN sudo apt-get install -y git
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN sudo apt-get install -y nodejs
# postgresql-server-dev-X.Y para extensión server-side y libpq-dev para aplicación client-side.
RUN sudo apt-get install -y python-psycopg2
RUN sudo apt-get install -y libpq-dev
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN sudo apt-get update
RUN sudo apt-get install -y mongodb-org
RUN sudo apt-get install -y firefox
#A elección del usuario usar entorno gráfico: gnome, kubuntu, vnc, xvfb (falso display) y firefox
#RUN     apt-get install -y x11vnc xvfb firefox
#RUN sudo apt-get install -y xorg gnome-core gnome-system-tools gnome-app-install
#RUN sudo apt-get install -y gnome-shell
#RUN sudo apt-get install -y kubuntu-desktop
#RUN     mkdir /.vnc
# Password:
#RUN     x11vnc -storepasswd 1234 ~/.vnc/passwd
# A elección del usuario ejecución automática Autostart firefox
#RUN     bash -c 'echo "firefox" >> /.bashrc'
RUN git clone https://github.com/TransparenciaUGR/Proyecto-IV.git
RUN cd Proyecto-IV && npm install -g
RUN cd Proyecto-IV && npm install -g grunt --save-dev
RUN cd Proyecto-IV && npm install -g grunt-cli --save-dev
RUN cd Proyecto-IV && npm install -g grunt-contrib-clean --save-dev
RUN cd Proyecto-IV && npm install -g grunt-contrib-copy --save-dev
RUN cd Proyecto-IV && npm install -g grunt-blanket --save-dev
RUN cd Proyecto-IV && npm install -g grunt-coveralls --save-dev
RUN cd Proyecto-IV && npm install -g mocha --save-dev
RUN cd Proyecto-IV && npm install -g mocha chai supertest
#Solucionando erro en Shippable al intentar conectat con base de datos
RUN cd Proyecto-IV && start mongod

#COPY package.json /home/
#EXPOSE 3000
#RUN cd /home; npm install; npm install -g mocha;npm install mocha chai supertest
#CMD ["nohup","/usr/bin/nodejs", "ugr-transparente-servidor/lanzarTransparente.sh"]
