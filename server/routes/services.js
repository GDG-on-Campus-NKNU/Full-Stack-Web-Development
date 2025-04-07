const express = require('express');
const router = express.Router();
const db = require('../configs/db');
const { addLog } = require('../utils/logger');
const { verifyToken, requireAdmin } = require('../middlewares/auth');

// GET /api/services - 取得所有服務
router.get('/', verifyToken, async (req, res) => {
    try {
        const [services] = await db.query('SELECT * FROM services');
        await addLog('INFO', 'services', 'Fetched all services');
        res.json(services);
    } catch (error) {
        await addLog('ERROR', 'services', `Failed to fetch services: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

// POST /api/services - 新增服務
router.post('/', verifyToken, requireAdmin, async (req, res) => {
    const { name, description, price } = req.body;
    if (!name || !price) {
        await addLog('WARNING', 'services', 'Attempted to create a service with missing fields');
        return res.status(400).json({ error: '名稱和價格為必填' });
    }
    try {
        const [result] = await db.query('INSERT INTO services (name, description, price) VALUES (?, ?, ?)', 
            [name, description, price]);
        await addLog('INFO', 'services', `Service ${name} created`);
        res.status(201).json({ id: result.insertId, name, description, price });
    } catch (error) {
        await addLog('ERROR', 'services', `Failed to create service: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

// PUT /api/services/:id - 修改服務
router.put('/:id', verifyToken, requireAdmin, async (req, res) => {
    const id = Number(req.params.id);
    if (isNaN(id)) {
        await addLog('WARNING', 'services', 'Attempted to update a service with invalid id');
        return res.status(400).json({ error: '無效的 ID' });
    }
    const { name, description, price } = req.body;
    if (!name || !price) {
        await addLog('WARNING', 'services', 'Attempted to update a service with missing fields');
        return res.status(400).json({ error: '名稱和價格為必填' });
    }
    try {
        const [result] = await db.query('UPDATE services SET name = ?, description = ?, price = ? WHERE id = ?', 
            [name, description, price, id]);
        if (result.affectedRows === 0) {
            await addLog('WARNING', 'services', `Service ${id} not found`);
            return res.status(404).json({ error: '找不到服務' });
        }
        await addLog('INFO', 'services', `Service ${id} updated`);
        res.json({ id, name, description, price });
    } catch (error) {
        await addLog('ERROR', 'services', `Failed to update service: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

// DELETE /api/services/:id - 刪除服務
router.delete('/:id', verifyToken, requireAdmin, async (req, res) => {
    const id = Number(req.params.id);
    if (isNaN(id)) {
        await addLog('WARNING', 'services', 'Attempted to delete a service with invalid id');
        return res.status(400).json({ error: '無效的 ID' });
    }
    try {
        const [result] = await db.query('DELETE FROM services WHERE id = ?', [id]);
        if (result.affectedRows === 0) {
            await addLog('WARNING', 'services', `Service ${id} not found`);
            return res.status(404).json({ error: '找不到服務' });
        }
        await addLog('INFO', 'services', `Service ${id} deleted`);
        res.json({ id });
    } catch (error) {
        await addLog('ERROR', 'services', `Failed to delete service: ${error.message}`);
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
