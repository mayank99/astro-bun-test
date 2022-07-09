export default function bunAdapter() {
  return {
    name: "astro-bun-adapter",
    hooks: {
      "astro:config:done": ({ setAdapter }) => {
        setAdapter({
          name: "astro-bun-adapter",
          serverEntrypoint: "astro-bun-adapter/server.js",
          exports: ['default'],
        });
      },
    },
  };
}
