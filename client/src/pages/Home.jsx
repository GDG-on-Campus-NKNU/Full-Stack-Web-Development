import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import api from '../utils/axios.js';
import toast from 'react-hot-toast';

function Home() {
  const [isAuth, setIsAuth] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    api.get('/auth/me')
      .then(() => setIsAuth(true))
      .catch(() => setIsAuth(false));
  }, []);

  const handleGo = (path) => {
    if (!isAuth) {
      toast.error("⚠️ 尚未登入，請先登入後才能存取此頁面！");
      return;
    }
    navigate(path);
  };

  return (
    <div className="p-6 space-y-4 text-center">
      <h1 className="text-2xl font-bold">資料表預覽</h1>
      <p className="text-gray-600">請選擇以下資料表來預覽內容（需登入）</p>

      <div className="space-y-2 pt-4">
        <button onClick={() => handleGo('/browse/users')} className="text-blue-600 hover:underline">客戶資料</button><br />
        <button onClick={() => handleGo('/browse/services')} className="text-blue-600 hover:underline">服務資料</button><br />
        <button onClick={() => handleGo('/browse/orders')} className="text-blue-600 hover:underline">訂單資料</button>
      </div>
    </div>
  );
}

export default Home;
