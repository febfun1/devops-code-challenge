FROM node:14

COPY package*.json ./

WORKDIR /usr/src/app

RUN npm install

EXPOSE 8080

#CMD ["npm", "start"]
#####################################################################
WORKDIR /usr/src/app

RUN npm install
RUN npm run build
EXPOSE 3000
#CMD ["npm", "build"]
#CMD ["npm", "start"]

WORKDIR /usr/src/app

CMD ["sh", "-c", "npm run start & cd /app/frontend && npm run start"]
