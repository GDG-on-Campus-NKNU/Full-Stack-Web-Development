const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../configs/db');
const { verifyToken } = require('../middlewares/auth');

require('dotenv').config();

router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const [rows] = await db.query('SELECT * FROM accounts WHERE email = ?', [email]);
  const user = rows[0];
  if (!user) return res.status(400).json({ error: '帳號不存在' });

  const match = await bcrypt.compare(password, user.password);
  if (!match) return res.status(400).json({ error: '密碼錯誤' });

  const token = jwt.sign(
    { id: user.id, email: user.email, name: user.name, role: user.role },
   process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRATION } 
  );

  // res.json({ token }); 

  res.cookie('token', token, {
    httpOnly: true,
    secure: process.env.NODE_ENV==='production',
    sameSite: 'lax'
  }).json({ message: '登入成功' });
  
});

router.post('/register', async (req, res) => {
  const { name, email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  try {
    await db.query('INSERT INTO accounts (email, name, password) VALUES (?, ?, ?)', 
      [email, name, hashedPassword]);
    res.status(201).json({ message: '註冊成功' });
    const token = jwt.sign({ id: user.id, email: user.email, name: user.name, role: user.role }, process.env.JWT_SECRET, { expiresIn: process.env.JWT_EXPIRATION });
    res.cookie('token', token, {httpOnly: true, secure: false, sameSite: 'lax'}).status(201).json({ message: '註冊成功，自動登入！' });  
  } catch (error) {
    res.status(500).json({ error: '註冊失敗' });
  }
});

router.post('/logout', (req, res) => {
  res.clearCookie('token');
  res.json({ message: '已成功登出' });
});

router.get('/me', verifyToken, async (req, res) => {
  try {
    const [rows] = await db.query('SELECT id, name, email, role FROM accounts WHERE id = ?', 
      [req.user.id]);
    const user = rows[0];
    if (!user) return res.status(404).json({ error: '找不到使用者' });

    res.json(user);
  } catch (err) {
    res.status(500).json({ error: '伺服器錯誤' });
  }
});
 
module.exports = router;
