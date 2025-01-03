FROM node:14
WORKDIR /opt
ADD . /opt
RUN npm config set cache /tmp/.npm-cache --global
RUN npm install
ENTRYPOINT npm run start
