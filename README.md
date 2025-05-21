# 💻 GDSC NKNU | 全端網頁應用實戰系列課程

這是一份記錄 GDSC NKNU 在 2025 春季學期舉辦的 **全端網頁應用實戰課程** 的專案存檔與教學資源整理。整個系列共分為五堂主題課與一場成果展示，目標是讓參與者從零開始，實作並部署一個完整的全端應用程式。

---

## 📚 課程總覽

| 課程編號 | 主題                            | 教學內容概要                                                           |
|----------|---------------------------------|------------------------------------------------------------------------|
| 01       | 伺服器與 API 設計               | 使用 Node.js 與 Express 架設 Web Server，實作基本 RESTful API         |
| 02       | 資料庫設計與整合                | 使用 XAMPP + MySQL 設計資料表，串接 API，並防範 SQL Injection         |
| 03       | 前端整合與資料存取              | 使用 React + Vite + Axios 搭配 TailwindCSS 實作動態網頁介面           |
| 04       | 使用者登入驗證與權限控制        | JWT 認證機制、Cookie 實作、RBAC 權限控制、Protected Route             |
| 05+06       | UI 優化與專案部署               | Tailwind 強化樣式、Docker 化專案、.env 管理、Ngrok 快速開發分享       |

---

## 🚀 學習成果

在本系列結束後，參與者將能：

- 理解前後端如何協作，並能開發基礎 RESTful API
- 建立並操作關聯式資料庫（MySQL）
- 使用 React 建構動態前端介面，與 API 互動
- 實作登入與 Cookie 認證，理解授權機制
- 將專案打包成 Docker 容器，並學會用 Ngrok 對外展示
- 有機會將作品上傳 GitHub、成為個人作品集之一

---

## 🧩 使用技術

- **前端**：React (Vite), TailwindCSS, Axios
- **後端**：Node.js, Express.js
- **資料庫**：MySQL (via XAMPP)
- **部署工具**：Docker, Docker Compose, Ngrok
- **認證機制**：JWT + Cookie Based Auth
- **開發工具**：Postman, VS Code, Git

---

## 🗂️ 專案結構說明

```bash
├── client/                  # 前端專案（Vite + React）
├── server/                  # 後端專案（Node + Express + MySQL）
├── .env                     # 敏感資訊設定（如 JWT_SECRET）
├── Dockerfile               # Docker 打包設定
├── docker-compose.yml       # 多服務協作設定（web + db）
````

---

## 📦 成果展示與拓展建議

* 可延伸本專案進行個人 side project、加上 CI/CD、自動部屬等進階功能
* 建議加上使用者註冊、驗證信機制、管理後台等完整應用元素
* 使用 Cloudflare 或購買網域進行自有主機部署

---

## 🙌 特別感謝

本系列由 GDG on Campus NKNU 技術組規劃執行，感謝所有助教、講師與學員的參與！

---

## 📎 相關資源

* [GDSC 官方網站](https://gdsc.community.dev)
* [Vite 官方文件](https://vitejs.dev/)
* [Docker 教學](https://docs.docker.com/get-started/)
* [Ngrok 文件](https://ngrok.com/docs)
* [JWT 入門](https://jwt.io/introduction)

---