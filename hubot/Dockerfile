FROM node


RUN useradd -c 'hubot' -m -d /home/hubot -s /bin/bash hubot
USER hubot
ENV HOME /home/hubot
# WORKDIR /home/hubot
# RUN mkdir /home/hubot/hubots
#RUN npm install coffee-script yo generator-hubot hubot
#RUN yo hubot --defaults
#RUN npm install hubot-slack --save
#ADD ./hubot-credentials.txt .
RUN eval $(cat ./hubot-credentials.txt)

ENV PATH $PATH:/usr/local/hubot-utils
