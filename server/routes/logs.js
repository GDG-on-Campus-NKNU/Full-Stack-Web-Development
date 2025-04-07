const express = require('express');
const router = express.Router();
const db = require('../configs/db');

// GET and DELETE ONLY

// GET /logs - 取得所有日誌
router.get('/', async (req, res) => {
    try {
        const [logs] = await db.query('SELECT * FROM logs ORDER BY created_at DESC');

        // log beautification
        const formattedLogs = logs.map(log => {
            const date = new Date(log.created_at).toLocaleString();
            return { ...log, created_at: date };
        });

        res.json(formattedLogs);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// GET /logs/:id - 取得特定日誌
router.get('/:id', async (req, res) => {
    const id = Number(req.params.id);
    if (isNaN(id)) {
        return res.status(400).json({ error: 'Invalid ID' });
    }
    try {
        const [logs] = await db.query('SELECT * FROM logs WHERE id = ?', [id]);
        if (logs.length === 0) {
            return res.status(404).json({ error: 'Log not found' });
        }

        // log beautification
        const formattedLog = { ...logs[0], created_at: new Date(logs[0].created_at).toLocaleString() };

        res.json(formattedLog);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// DELETE /logs/all - 刪除全部日誌
router.delete('/all', async (req, res) => {
    try {
        await db.query('DELETE FROM logs');
        res.json({ message: 'All logs deleted' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// DELETE /logs/:id - 刪除特定日誌
router.delete('/:id', async (req, res) => {
    const id = Number(req.params.id);
    if (isNaN(id)) {
        return res.status(400).json({ error: 'Invalid ID' });
    }
    try {
        const [result] = await db.query('DELETE FROM logs WHERE id = ?', [id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Log not found' });
        }
        res.json({ message: 'Log deleted' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
