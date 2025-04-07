const jwt = require('jsonwebtoken');
require('dotenv').config();

function verifyToken(req, res, next) {
    const token = req.headers.authorization?.split(" ")[1];
    if (!token) return res.status(401).json({ error: "未授權" });
    try {
      req.user = jwt.verify(token, 'just_a_secret');
      next();
    } catch(err){
      res.status(403).json({ error: "Token 無效" });
    }
}
  
function requireAdmin(req, res, next) {
    if (req.user?.role !== 'admin') {
      return res.status(403).json({ error: '此操作僅限管理員執行' });
    }
    next();
}
  
module.exports = { verifyToken, requireAdmin };
  