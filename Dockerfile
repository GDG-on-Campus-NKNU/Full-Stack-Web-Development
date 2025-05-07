FROM node:22
WORKDIR /app

# root install
COPY package*.json ./
RUN npm install --legacy-peer-deps

# frontend
WORKDIR /app/client
COPY client/ ./
RUN npm install
RUN npm run build

# backend
WORKDIR /app/server
COPY server/ ./
RUN npm install

# copy build to server
RUN cp -r /app/client/dist /app/server/public

EXPOSE 4000
CMD ["node", "index.js"]
