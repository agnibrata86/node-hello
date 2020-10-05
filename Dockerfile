# use a node base image
FROM node:12-alpine

# set maintainer
LABEL maintainer "agnibrata"

ENV MESSAGES

WORKDIR /app
COPY index.js package.json /app/

RUN apk --update add curl
RUN chown -R node:node /app
USER node

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
CMD ["npm", "start"]