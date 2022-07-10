# astro-bun-test

> **Note**: Make sure to install [bun](https://bun.sh/) beforehand.

This is a small test of using Astro SSR with Bun using a custom adapter.

## How to run

Go to `test-app/` and run the following commands:

```
bun install --backend=copyfile
```

```
bun run build --experimental-ssr
```

This will create a server entrypoint which you can then serve with bun.

```
bun run dist/server/entry.mjs
```
