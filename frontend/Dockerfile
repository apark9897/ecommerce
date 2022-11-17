FROM node:19-alpine3.15
WORKDIR /app/
COPY . .
RUN npm install
EXPOSE 8080

ENTRYPOINT npm run serve
