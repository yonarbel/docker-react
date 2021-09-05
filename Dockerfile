FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# docker run -it -p 3000:3000 -v /app/node_modules -v $(pwd):/app 3bd7a69ca942
# after build --> docker run -p 4001:80 <CREATED_IMG>
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html



