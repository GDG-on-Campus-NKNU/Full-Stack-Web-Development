import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import EntityCard from "../../components/EntityCard";
import api from '../../utils/axios.js';

const API_MAP = {
  users: "/api/users",
  services: "/api/services",
  orders: "/api/orders"
};

function Browse() {
  const { type } = useParams(); // type = 'users' | 'services' | 'orders'
  const [data, setData] = useState([]);
  const [form, setForm] = useState({}); // form state for Create
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, [type]);

  const fetchData = () => {
    setLoading(true);
    api.get(API_MAP[type])
      .then(res => setData(res.data))
      .catch(err => alert("資料載入失敗：" + err.message))
      .finally(() => setLoading(false));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await api.post(API_MAP[type], form);
      setForm({});
      fetchData();
    } catch (err) {
      alert("新增失敗：可能是因為沒有對應的權限! \n完整錯誤訊息：" + err.message);
    }
  };

  const renderForm = () => {
    switch (type) {
      case "users":
        return (
          <>
            <input placeholder="名稱" value={form.name || ""} 
            onChange={e => setForm({ ...form, name: e.target.value })} className="input" />
            <input placeholder="電子郵件" value={form.email || ""} 
            onChange={e => setForm({ ...form, email: e.target.value })} className="input" />
          </>
        );
      case "services":
        return (
          <>
            <input placeholder="名稱" value={form.name || ""} 
            onChange={e => setForm({ ...form, name: e.target.value })} className="input" />
            <input placeholder="說明" value={form.description || ""} 
            onChange={e => setForm({ ...form, description: e.target.value })} className="input" />
            <input placeholder="價格" type="number" value={form.price || ""} 
            onChange={e => setForm({ ...form, price: e.target.value })} className="input" />
          </>
        );
      case "orders":
        return (
          <>
            <input placeholder="客戶 ID" type="number" value={form.user_id || ""} 
            onChange={e => setForm({ ...form, user_id: e.target.value })} className="input" />
            <input placeholder="服務 ID" type="number" value={form.service_id || ""} 
            onChange={e => setForm({ ...form, service_id: e.target.value })} className="input" />
          </>
        );
      default:
        return <p>無可新增的欄位</p>;
    }
  };

  return (
    <div className="p-6 max-w-2xl mx-auto">
      <h1 className="text-xl font-bold mb-4">資料瀏覽：{type}</h1>

      <form onSubmit={handleSubmit} className="space-y-2 mb-6">
        {renderForm()}
        <button type="submit" className="bg-blue-600 text-white px-4 py-2 rounded">新增</button>
      </form>

      {loading ? (
        <p>載入中...</p>
      ) : (
        <div className="space-y-3">
          {data.map((item, i) => <EntityCard key={i} type={type} data={item} />)}
        </div>
      )}
    </div>
  );
}

export default Browse;
