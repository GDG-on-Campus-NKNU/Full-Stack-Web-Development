// routes/users.js
const express = require('express');
const router = express.Router();
const db = require('../config/db');
const { addLog } = require('../utils/logger');
const { verifyToken, requireAdmin } = require('../middlewares/auth');

// GET /api/users - 取得所有使用者
router.get('/', verifyToken, async (req, res) => {
  try {
      const [users] = await db.query('SELECT * FROM users');
      await addLog('INFO', 'users', 'Fetched all users');
      res.json(users);
  } catch (error) {
      await addLog('ERROR', 'users', `Failed to fetch users: ${error.message}`);
      res.status(500).json({ error: error.message });
  }
});

// POST /api/users - 新增使用者
router.post('/', verifyToken, requireAdmin, async (req, res) => {
  const { name, email } = req.body;
  if (!name || !email) {
    await addLog('WARNING', 'users', 'Attempted to create a user with missing fields');
    return res.status(400).json({ error: 'Name and email are required' });
  }

  try {
    const [result] = await db.query('INSERT INTO users (name, email) VALUES (?, ?)', [name, email]);
    await addLog('INFO', 'users', `User ${name} created`);
    res.status(201).json({ id: result.insertId, name, email });
  } catch (error) {
      await addLog('ERROR', 'users', `Failed to create user: ${error.message}`);
      res.status(500).json({ error: error.message });
  }
});

// PUT /api/users/:id - 修改使用者
router.put('/:id', verifyToken, requireAdmin, async (req, res) => {
  const id = Number(req.params.id);
  if (isNaN(id)) {
    await addLog('WARNING', 'users', 'Attempted to update a user with invalid id');
    return res.status(400).json({ error: 'Invalid ID' });
  }

  const { name } = req.body;
  if (!name) {
    await addLog('WARNING', 'users', 'Attempted to update a user with missing fields');
    return res.status(400).json({ error: 'Name is required' });
  }

  try {
    const [result] = await db.query('UPDATE users SET name = ? WHERE id = ?', [name, id]);
    if (result.affectedRows === 0) {
      await addLog('WARNING', 'users', `User ${id} not found`);
      return res.status(404).json({ error: 'User not found' });
    }
    await addLog('INFO', 'users', `User ${id} updated`);
    res.json({ id, name });
  } catch (error) {
      await addLog('ERROR', 'users', `Failed to update user: ${error.message}`);
      res.status(500).json({ error: error.message });
  }
});

// DELETE /api/users/:id - 刪除使用者
router.delete('/:id', verifyToken, requireAdmin, async (req, res) => {
  const id = Number(req.params.id);
  if (isNaN(id)) {
    await addLog('WARNING', 'users', 'Attempted to delete a user with invalid id');
    return res.status(400).json({ error: 'Invalid ID' });
  }

  try {
    const [result] = await db.query('DELETE FROM users WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      await addLog('WARNING', 'users', `User ${id} not found`);
      return res.status(404).json({ error: 'User not found' });
    }
    await addLog('INFO', 'users', `User ${id} deleted`);
    res.status(204).json();
  } catch (error) {
      await addLog('ERROR', 'users', `Failed to delete user: ${error.message}`);
      res.status(500).json({ error: error.message });
  }
});

module.exports = router;