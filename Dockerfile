FROM node:16 as builder
WORKDIR /app
COPY package.json .
COPY . .
RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn install
RUN yarn build

FROM nginx:1.21-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf

