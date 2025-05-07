import { useNavigate } from "react-router-dom";
import { useEffect, useState } from 'react';
import api from '../../utils/axios.js';

function Dashboard() {
  const [user, setUser] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    api.get('/auth/me', {})
      .then(res => setUser(res.data))
      .catch(() => navigate('/login'));
  }, []);

  const handleLogout = async () => {
    await api.post('/auth/logout');
    navigate('/login');
  };

  if (!user) {
    return <div className="text-center">載入中...</div>;
  }

  return (
    <div className="max-w-md mx-auto p-6 bg-gray-50 rounded shadow">
      <h1 className="text-2xl font-bold mb-4">Dashboard</h1>
      <p className="mb-6">歡迎使用者：{user?.name}</p>
      <button onClick={handleLogout} className="bg-red-500 text-white px-4 py-2 rounded">
        登出
      </button>
    </div>
  );
}
export default Dashboard;
