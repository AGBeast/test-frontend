FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build
#this is a note
FROM nginx:latest
EXPOSE 80
COPY  --from=builder /app/build /usr/share/nginx/html
