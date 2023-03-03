FROM node:18-alpine3.16

EXPOSE 8008

RUN corepack enable && \
    corepack prepare pnpm@7.28.0 --activate

COPY pnpm-lock.yaml ./

RUN pnpm fetch

ADD . ./
RUN pnpm install --offline

RUN pnpm build

ENTRYPOINT ["pnpm", "start", "--port", "8008"]