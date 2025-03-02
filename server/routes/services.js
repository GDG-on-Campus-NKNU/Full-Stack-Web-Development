const express = require('express');
const router = express.Router();
const db = require('../config/db');

// 取得所有服務
router.get('/', async (req, res) => {
    try {
        const [services] = await db.query('SELECT * FROM services');
        res.json(services);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// 新增服務 (防止 SQL Injection)
router.post('/', async (req, res) => {
    const { name, description, price } = req.body;
    if (!name || !price) {
        return res.status(400).json({ error: '名稱和價格為必填' });
    }
    try {
        const [result] = await db.query(
            'INSERT INTO services (name, description, price) VALUES (?, ?, ?)',
            [name, description, price]
        );
        res.status(201).json({ id: result.insertId, name, description, price });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
