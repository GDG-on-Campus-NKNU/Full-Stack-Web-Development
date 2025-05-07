import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:4000',
        changeOrigin: true,
        secure: false, // 如果是 HTTPS，設置為 true
        cookieDomainRewrite: 'localhost' // 確保 Cookie 的域名正確
      },
      '/auth':{
        target: 'http://localhost:4000',
        changeOrigin: true,
        secure: false, // 如果是 HTTPS，設置為 true
        cookieDomainRewrite: 'localhost' // 確保 Cookie 的域名正確
      },
      '/logs': {
        target: 'http://localhost:4000',
        changeOrigin: true,
        secure: false, // 如果是 HTTPS，設置為 true
        cookieDomainRewrite: 'localhost' // 確保 Cookie 的域名正確
      }
    }
  }
})
