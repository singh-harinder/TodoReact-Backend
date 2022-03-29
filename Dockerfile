FROM node:16
WORKDIR /app
COPY package.json .
# RUN npm install -f
RUN npm ci --production
COPY . ./
EXPOSE 3000
# CMD [ "npm", "run", "dev" ]
CMD ["./node_modules/.bin/keystone-next", "start"]
