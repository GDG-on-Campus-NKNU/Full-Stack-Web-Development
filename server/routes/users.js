// routes/users.js
const express = require('express');
const router = express.Router();

// 模擬資料庫中的使用者資料
const users = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' },
  { id: 3, name: 'Cypress'}
];

// GET /api/users - 取得所有使用者
router.get('/', (req, res) => {
  res.json(users);
});

// POST /api/users - 新增使用者
router.post('/', (req, res) => {
  const { name } = req.body;
  if (!name) {
    return res.status(400).json({ error: 'Name is required' });
  }
  const newUser = { id: users.length + 1, name };
  users.push(newUser);
  res.status(201).json(newUser);
});

// PUT /api/users/:id - 修改使用者
router.put('/:id', (req, res) => {
  const id = Number(req.params.id);
  const { name } = req.body;
  const user = users.find((user) => user.id === id);
  if (!user) {
    return res.status(404).json({ error: 'User not found' });
  }
  user.name = name;
  res.json(user);
});

// DELETE /api/users/:id - 刪除使用者
router.delete('/:id', (req, res) => {
  const id = Number(req.params.id);
  const index = users.findIndex((user) => user.id === id);
  if (index === -1) {
    return res.status(404).json({ error: 'User not found' });
  }
  users.splice(index, 1);
  res.status(204).json();
});

module.exports = router;
