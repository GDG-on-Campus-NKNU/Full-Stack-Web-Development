// server.js
require('dotenv').config(); // 載入 .env 設定
const express = require('express');
const { addLog } = require('./utils/logger');
const cookieParser = require('cookie-parser');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json()); // 解析 JSON 請求內容
app.use(express.urlencoded({ extended: true })); // 解析 URL 編碼的請求內容
app.use(cookieParser()); // 解析 Cookie
app.use(cors({
  origin: process.env.CLIENT_URL || 'http://localhost:5173', // 允許的來源
  credentials: true, // 允許攜帶 Cookie
}));
app.use(express.static('public'));

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
const logsRouter = require('./routes/logs');
const authRouter = require('./routes/auth');

app.use('/api/users', usersRouter);
app.use('/api/services', servicesRouter);
app.use('/api/orders', ordersRouter);
app.use('/logs', logsRouter);
app.use('/auth', authRouter);

app.get('*', (req, res) => res.sendFile(__dirname + '/public/index.html'));

app.listen(port, async () => {
  console.log(`伺服器啟動：http://localhost:${port}`);
  await addLog('INFO', 'server', `Server started at http://localhost:${port}`);
});
