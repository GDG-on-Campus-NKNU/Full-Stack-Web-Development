import { useNavigate } from "react-router-dom";

function Dashboard() {
  const user = JSON.parse(localStorage.getItem("user"));
  const navigate = useNavigate();

  const handleLogout = () => {
    localStorage.removeItem("user");
    navigate("/login");
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-2">Dashboard</h1>
      <p className="mb-4">歡迎使用者：{user?.email}</p>
      <button onClick={handleLogout} className="bg-red-500 text-white px-4 py-2 rounded">
        登出
      </button>
    </div>
  );
}
export default Dashboard;
