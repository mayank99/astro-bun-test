import { App } from 'astro/app';

export function createExports(manifest) {
  const app = new App(manifest);

  const fetch = (request) => {
    return app.render(request);
  }

  return { default: { fetch } };
}