FROM node:24-bookworm-slim

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

USER node

EXPOSE 5006

CMD ["npm", "start"]
