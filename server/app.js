// server.js
require('dotenv').config(); // 載入 .env 設定
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json()); // 解析 JSON 請求內容

// 基本測試路由
app.get('/', (req, res) => {
  res.send('伺服器運行中 🚀');
});

app.get('/easter_egg', (req, res) => {
    res.send('🥚🐇');
});

// 掛載路由
const usersRouter = require('./routes/users');
const servicesRouter = require('./routes/services');
const ordersRouter = require('./routes/orders');

app.use('/api/users', usersRouter);
app.use('/api/services', servicesRouter);
app.use('/api/orders', ordersRouter);

app.listen(port, () => {
  console.log(`伺服器啟動：http://localhost:${port}`);
});
