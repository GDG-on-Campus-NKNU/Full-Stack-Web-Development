import { useNavigate } from "react-router-dom";

function Dashboard() {
  const user = JSON.parse(localStorage.getItem("user"));
  const navigate = useNavigate();

  const handleLogout = () => {
    localStorage.removeItem("user");
    navigate("/login");
  };

  return (
    <div className="max-w-md mx-auto p-6 bg-gray-50 rounded shadow">
      <h1 className="text-2xl font-bold mb-4">Dashboard</h1>
      <p className="mb-6">歡迎使用者：{user?.email}</p>
      <button onClick={handleLogout} className="bg-red-500 text-white px-4 py-2 rounded">
        登出
      </button>
    </div>
  );
}
export default Dashboard;
