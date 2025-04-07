const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../configs/db');

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

  res.json({ token });
});

router.post('/register', async (req, res) => {
  const { email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  try {
    await db.query('INSERT INTO accounts (email, password) VALUES (?, ?)', [email, hashedPassword]);
    res.status(201).json({ message: '註冊成功' });
  } catch (error) {
    res.status(500).json({ error: '註冊失敗' });
  }
});
 
module.exports = router;
