FROM node:14

COPY . /app

WORKDIR /usr/src/app/backend

RUN npm install

EXPOSE 8080

#CMD ["npm", "start"]
#####################################################################
WORKDIR /usrsrc/app/frontend
RUN npm install
RUN npm run build
EXPOSE 3000
#CMD ["npm", "build"]
#CMD ["npm", "start"]

WORKDIR /usr/src/app/backend

CMD ["sh", "-c", "npm run start & cd /app/frontend && npm run start"]
