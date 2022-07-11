FROM jarredsumner/bun:edge as deps
RUN mkdir /repo/
WORKDIR /repo/

ADD test-app/package.json test-app/bun.lockb ./
RUN bun install

FROM node:18-bullseye-slim as astro
RUN mkdir /repo/
WORKDIR /repo/

COPY --from=deps /opt/bun/bin/bun /bin/bun
COPY --from=deps /repo/node_modules /repo/node_modules

ADD test-app ./

RUN bun run build


FROM jarredsumner/bun:edge
RUN mkdir /repo/
WORKDIR /repo/

COPY --from=deps /repo/node_modules /repo/node_modules 
COPY --from=deps /repo/package.json /repo/package.json
COPY --from=deps /repo/bun.lockb /repo/bun.lockb
COPY --from=astro /repo/build /repo/build
COPY --from=astro /repo/public /repo/public

ADD test-app/dist/server ./
ADD test-app/dist/client ./

EXPOSE 3000
CMD ["entry.mjs"]