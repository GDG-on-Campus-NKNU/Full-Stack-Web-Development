import { Navigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import api from '../utils/axios.js';

function ProtectedRoute({ children }) {
  const [authorized, setAuthorized] = useState(null);

  useEffect(() => {
    api.get('/auth/me')
      .then(() => { setAuthorized(true); })
      .catch(() => { setAuthorized(false);  });
  }, []);

  if (authorized === null) return <div>驗證中...</div>; // 驗證尚未完成
  return authorized ? children : <Navigate to="/login" />;
}

export default ProtectedRoute;
