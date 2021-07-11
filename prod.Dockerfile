# dockerfile
FROM nginx:stable-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx-prod.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
