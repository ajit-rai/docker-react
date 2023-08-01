# Build Phase: Tag it as Builder
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# --from means from a different phase. The folder we want to copy and where we want to. 