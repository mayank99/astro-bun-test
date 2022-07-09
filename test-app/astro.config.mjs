import { defineConfig } from 'astro/config'
import bunAdapter from 'astro-bun-adapter'

export default defineConfig({
  adapter: bunAdapter()
})