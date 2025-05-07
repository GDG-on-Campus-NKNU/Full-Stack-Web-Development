require('dotenv').config();

const mysql = require('mysql2');

const pool = mysql.createPool({
    host: process.env.DB_HOST, // ⚠️ ✅ ← ← ← 這裡改成 docker-compose 裡 db 的 service 名稱
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10
});

module.exports = pool.promise(); // 使用 promise 版本的 pool
