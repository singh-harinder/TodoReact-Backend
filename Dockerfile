FROM node:14-alpine3.14 as build

ARG FRONTEND_URL
ARG COOKIE_SECRET
ARG DATABASE_URL

RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--"]
EXPOSE 4500

RUN mkdir /app && chown -R node:node /app
WORKDIR /app
USER node
COPY --chown=node:node package.json package-lock.json ./
RUN npm ci --production && npm cache clean --force
COPY --chown=node:node . ./
RUN npm run build

FROM node:14-alpine3.14 as prod
WORKDIR /app
COPY --from=build /app ./
USER node
CMD ["./node_modules/.bin/keystone-next", "start"]
