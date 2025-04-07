const express = require('express');
const router = express.Router();
const db = require('../configs/db');
const { addLog } = require('../utils/logger');
const { verifyToken, requireAdmin } = require('../middlewares/auth');

// GET /api/orders - 取得所有訂單
router.get('/', verifyToken, async (req, res) => {
    try {
        const [orders] = await db.query(`
            SELECT users.name AS user, services.name AS service, orders.order_date
            FROM orders
            INNER JOIN users ON orders.user_id = users.id
            INNER JOIN services ON orders.service_id = services.id
        `);
        await addLog('INFO', 'orders', 'Fetched all orders');
        res.json(orders);
    } catch (error) {
        await addLog('ERROR', 'orders', `Failed to fetch orders: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

// POST /api/orders - 新增訂單
router.post('/', verifyToken, requireAdmin, async (req, res) => {
    const { user_id, service_id } = req.body;
    if (!user_id || !service_id) {
        await addLog('WARNING', 'orders', 'Attempted to create an order with missing fields');
        return res.status(400).json({ error: 'User ID and service ID are required' });
    }
    try {
        const [result] = await db.query('INSERT INTO orders (user_id, service_id) VALUES (?, ?)', 
            [user_id, service_id]);
        await addLog('INFO', 'orders', `Order created`);
        res.status(201).json({ id: result.insertId, user_id, service_id });
    } catch (error) {
        await addLog('ERROR', 'orders', `Failed to create order: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

// PUT /api/orders/:id - 修改訂單
router.put('/:id', verifyToken, requireAdmin, async (req, res) => {
    const id = Number(req.params.id);
    if (isNaN(id)) {
        await addLog('WARNING', 'orders', 'Attempted to update an order with invalid id');
        return res.status(400).json({ error: 'Invalid ID' });
    }
    const { user_id, service_id } = req.body;
    if (!user_id || !service_id) {
        await addLog('WARNING', 'orders', 'Attempted to update an order with missing fields');
        return res.status(400).json({ error: 'User ID and service ID are required' });
    }
    try {
        const [result] = await db.query('UPDATE orders SET user_id = ?, service_id = ? WHERE id = ?', 
            [user_id, service_id, id]);
        if (result.affectedRows === 0) {
            await addLog('WARNING', 'orders', `Order ${id} not found`);
            return res.status(404).json({ error: 'Order not found' });
        }
        await addLog('INFO', 'orders', `Order ${id} updated`);
        res.json({ id, user_id, service_id });
    } catch (error) {
        await addLog('ERROR', 'orders', `Failed to update order: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

// DELETE /api/orders/:id - 刪除訂單
router.delete('/:id', verifyToken, requireAdmin, async (req, res) => {
    const id = Number(req.params.id);
    if (isNaN(id)) {
        await addLog('WARNING', 'orders', 'Attempted to delete an order with invalid id');
        return res.status(400).json({ error: 'Invalid ID' });
    }
    try {
        const [result] = await db.query('DELETE FROM orders WHERE id = ?', [id]);
        if (result.affectedRows === 0) {
            await addLog('WARNING', 'orders', `Order ${id} not found`);
            return res.status(404).json({ error: 'Order not found' });
        }
        await addLog('INFO', 'orders', `Order ${id} deleted`);
        res.json({ id });
    } catch (error) {
        await addLog('ERROR', 'orders', `Failed to delete order: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
