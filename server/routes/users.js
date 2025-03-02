// routes/users.js
const express = require('express');
const router = express.Router();
const db = require('../config/db');

// 模擬資料庫中的使用者資料
const users = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' },
  { id: 3, name: 'Cypress'}
];

// GET /api/users - 取得所有使用者
router.get('/', async (req, res) => {
  try {
      const [users] = await db.query('SELECT * FROM users');
      res.json(users);
  } catch (error) {
      res.status(500).json({ error: error.message });
  }
});

// POST /api/users - 新增使用者
router.post('/', async (req, res) => {
  const { name, email } = req.body;
  if (!name || !email) {
    return res.status(400).json({ error: 'Name and email are required' });
  }

  const [result] = await db.query(
    'INSERT INTO users (name, email) VALUES (?, ?)',
    [name, email]
  );

  res.status(201).json({ id: result.insertId, name, email });
});

// // PUT /api/users/:id - 修改使用者
// router.put('/:id', (req, res) => {
//   const id = Number(req.params.id);
//   const { name } = req.body;
//   const user = users.find((user) => user.id === id);
//   if (!user) {
//     return res.status(404).json({ error: 'User not found' });
//   }
//   user.name = name;
//   res.json(user);
// });

// // DELETE /api/users/:id - 刪除使用者
// router.delete('/:id', (req, res) => {
//   const id = Number(req.params.id);
//   const index = users.findIndex((user) => user.id === id);
//   if (index === -1) {
//     return res.status(404).json({ error: 'User not found' });
//   }
//   users.splice(index, 1);
//   res.status(204).json();
// });

module.exports = router;
