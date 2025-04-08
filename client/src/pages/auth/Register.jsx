import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

function Register() {
  const [form, setForm] = useState({ name: "", email: "", password: "", confirmPassword: "" });
  const [captcha, setCaptcha] = useState({ question: "", answer: "", userAnswer: "" });
  const navigate = useNavigate();

  const generateCaptcha = () => {
    const num1 = Math.floor(Math.random() * 10) + 1;
    const num2 = Math.floor(Math.random() * 10) + 1;
    const answer = num1 + num2;
    setCaptcha({
      question: `${num1} + ${num2} = ?`,
      answer: answer.toString(),
      userAnswer: ""
    });
  };

  useEffect(() => {
    generateCaptcha();
  }, []);

  const handleRegister = async (e) => {
    e.preventDefault();
    
    if (!form.name || !form.email || !form.password || !form.confirmPassword) {
      alert("⚠️ 請填寫所有欄位！");
      return;
    }

    if (!/\S+@\S+\.\S+/.test(form.email)) {
      alert("⚠️ 請輸入有效的電子郵件地址！");
      return;
    }

    if (form.password.length < 8) {
      alert("⚠️ 密碼長度至少需要8個字符！");
      return;
    }

    if (form.password !== form.confirmPassword) {
      alert("⚠️ 兩次輸入的密碼不一致！");
      return;
    }

    if (captcha.userAnswer !== captcha.answer) {
      alert("⚠️ 驗證碼不正確，請重新嘗試！");
      generateCaptcha();
      setCaptcha(prev => ({ ...prev, userAnswer: "" }));
      return;
    }

    const res = await axios.post('/auth/register', {
      name: form.name,
      email: form.email,
      password: form.password
    }).then(res => res).catch(err => {
      alert("⚠️ 註冊失敗：" + (err.response?.data?.error || "未知錯誤"));
      return null;
    });

    if (!res) return;

    alert("✅ 註冊成功！請登入您的帳號。");
    navigate('/login');
  };

  const refreshCaptcha = () => {
    generateCaptcha();
  };

  return (
    <div className="max-w-sm mx-auto p-8 bg-white rounded-lg shadow-md">
      <h1 className="text-2xl font-bold mb-6 text-center text-gray-800">註冊</h1>
      
      <form onSubmit={handleRegister} className="space-y-4">
        <div className="space-y-2">
          <label htmlFor="name" className="block text-sm font-medium text-gray-700">姓名:</label>
          <input
            id="name"
            type="text"
            placeholder="請輸入您的姓名"
            value={form.name}
            onChange={(e) => setForm({ ...form, name: e.target.value })}
            className="border border-gray-300 p-3 w-full rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition"
          />
        </div>

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
        
        <div className="space-y-2">
          <label htmlFor="password" className="block text-sm font-medium text-gray-700">密碼:</label>
          <input
            id="password"
            type="password"
            placeholder="請輸入至少8位字符的密碼"
            value={form.password}
            onChange={(e) => setForm({ ...form, password: e.target.value })}
            className="border border-gray-300 p-3 w-full rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition"
          />
        </div>

        <div className="space-y-2">
          <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700">確認密碼:</label>
          <input
            id="confirmPassword"
            type="password"
            placeholder="請再次輸入密碼"
            value={form.confirmPassword}
            onChange={(e) => setForm({ ...form, confirmPassword: e.target.value })}
            className="border border-gray-300 p-3 w-full rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition"
          />
        </div>

        <div className="space-y-2">
          <label className="block text-sm font-medium text-gray-700">驗證問題:</label>
          <div className="flex items-center space-x-2">
            <div className="border border-gray-300 px-4 py-2 rounded-md bg-gray-50 flex-grow">
              {captcha.question}
            </div>
            <button 
              type="button" 
              onClick={refreshCaptcha}
              className="bg-gray-200 p-2 rounded-md hover:bg-gray-300 transition"
              title="刷新驗證碼"
            >
              ↻
            </button>
          </div>
          <input
            type="text"
            placeholder="請輸入答案"
            value={captcha.userAnswer}
            onChange={(e) => setCaptcha({ ...captcha, userAnswer: e.target.value })}
            className="border border-gray-300 p-3 w-full rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition mt-2"
          />
        </div>
        
        <div className="pt-2">
          <button 
            type="submit" 
            className="bg-blue-600 hover:bg-blue-700 text-white w-full py-3 rounded-md font-medium transition duration-200 shadow-sm">
            註冊
          </button>
        </div>

        <div className="text-center pt-2">
          <p className="text-sm text-gray-600">
            已有帳號？ 
            <a href="/login" className="text-blue-500 hover:text-blue-700 font-medium">
              立即登入
            </a>
          </p>
        </div>
      </form>
    </div>
  );
}

export default Register;