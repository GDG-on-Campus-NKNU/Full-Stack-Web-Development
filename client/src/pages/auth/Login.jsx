import { useState } from "react";
import { useNavigate } from "react-router-dom";

function Login() {
  const [form, setForm] = useState({ email: "", password: "" });
  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault();
    if (form.email === "test@example.com" && form.password === "123456") {
      localStorage.setItem("user", JSON.stringify(form));
      navigate("/dashboard");
    } else {
      alert("登入失敗：請輸入 test@example.com / 123456");
    }
  };

  return (
    <div className="max-w-sm mx-auto p-8 bg-white rounded-lg shadow-md">
    <h1 className="text-2xl font-bold mb-6 text-center text-gray-800">登入</h1>
    
    <form onSubmit={handleLogin} className="space-y-4">
        <div className="space-y-2">
        <label htmlFor="email" className="block text-sm font-medium text-gray-700">電子郵件:</label>
        <input
            id="email"
            type="email"
            placeholder="請輸入您的Email"
            value={form.email}
            onChange={(e) => setForm({ ...form, email: e.target.value })}
            className="border border-gray-300 p-3 w-full rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition"
        />
        </div>

        <div><br></br></div>
        
        <div className="space-y-2">
        <label htmlFor="password" className="block text-sm font-medium text-gray-700">密碼:</label>
        <input
            id="password"
            type="password"
            placeholder="請輸入您的密碼"
            value={form.password}
            onChange={(e) => setForm({ ...form, password: e.target.value })}
            className="border border-gray-300 p-3 w-full rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition"
        />
        </div>

        <div><br></br></div>
        
        <div className="pt-2">
        <button 
            type="submit" 
            className="bg-blue-600 hover:bg-blue-700 text-white w-full py-3 rounded-md font-medium transition duration-200 shadow-sm">
            登入
        </button>
        </div>
    </form>
    </div>
  );
}
export default Login;
