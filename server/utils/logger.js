const db = require('../configs/db');

async function addLog(log_type, module, message) {
    try {
        await db.query('INSERT INTO logs (log_type, module, message) VALUES (?, ?, ?)', 
            [log_type, module, message]);
    } catch (error) {
        console.error('Logging Error:', error);
    }
}

module.exports = { addLog };
