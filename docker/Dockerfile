FROM node:16-slim AS builder
WORKDIR /app

COPY app/package*.json ./
RUN npm install

COPY app/ .
RUN npm run build

FROM node:16-slim
WORKDIR /app

COPY --from=builder /app/build ./build
COPY app/package*.json ./
RUN npm install --production

EXPOSE 3000
CMD ["npm", "start"]
