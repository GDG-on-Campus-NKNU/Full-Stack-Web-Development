const express = require('express');
const router = express.Router();
const db = require('../config/db');

// 取得所有訂單
router.get('/', async (req, res) => {
    try {
        const [orders] = await db.query(`
            SELECT users.name AS user, services.name AS service, orders.order_date
            FROM orders
            INNER JOIN users ON orders.user_id = users.id
            INNER JOIN services ON orders.service_id = services.id
        `);
        res.json(orders);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// 新增訂單
router.post('/', async (req, res) => {
    const { user_id, service_id } = req.body;
    const [result] = await db.query('INSERT INTO orders (user_id, service_id) VALUES (?, ?)', [user_id, service_id]);
    res.status(201).json({ id: result.insertId, user_id, service_id });
});

module.exports = router;
