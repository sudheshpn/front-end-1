FROM node:7-alpine
RUN mkdir /opt/frontend
WORKDIR /opt/frontend
COPY . /opt/frontend
EXPOSE 8079
CMD npm install
ENTRYPOINT ["node", "server.js"]

 
