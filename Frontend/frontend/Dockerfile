FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE ${NG_PORT}
CMD ["npm", "start"]
