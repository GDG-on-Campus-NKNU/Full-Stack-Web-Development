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
    <div className="max-w-sm mx-auto p-4">
      <h1 className="text-xl font-bold mb-4">登入</h1>
      <form onSubmit={handleLogin} className="space-y-3">
        <input type="email" placeholder="Email" value={form.email}
          onChange={(e) => setForm({ ...form, email: e.target.value })}
          className="border p-2 w-full" />
        <input type="password" placeholder="密碼" value={form.password}
          onChange={(e) => setForm({ ...form, password: e.target.value })}
          className="border p-2 w-full" />
        <button type="submit" className="bg-blue-600 text-white w-full py-2 rounded">
          登入
        </button>
      </form>
    </div>
  );
}
export default Login;
