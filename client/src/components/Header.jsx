import { Link, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import api from "../utils/axios.js";

function Header() {
  const [authState, setAuthState] = useState({ loading: true, user: null }); // 合併狀態
  const navigate = useNavigate();

  const handleLogout = async () => {
    await api.post("/auth/logout");
    setAuthState({ loading: false, user: null }); // 更新狀態
  };

  useEffect(() => {
    api.get("/auth/me")
      .then((res) => setAuthState({ loading: false, user: res.data })) // 驗證成功
      .catch(() => setAuthState({ loading: false, user: null })); // 驗證失敗
  }, []);

  if (authState.loading) return <div>載入中...</div>; // 驗證尚未完成

  return (
    <div className="flex justify-between items-center p-4">
      <Link to="/">🏠 全端式網頁雛型</Link>
      <div>
        {authState.user ? (
          <>
            <span className="mr-4">歡迎使用者：{authState.user.name}</span>{" "}
            <span className="mr-4">|</span>{" "}
            <span className="mr-4">
              <Link to="/dashboard">儀表板</Link>
            </span>{" "}
            <span className="mr-4">|</span>{" "}
            <button
              onClick={() => {
                handleLogout();
                navigate("/");
              }}
            >
              登出
            </button>
          </>
        ) : (
          <>
            <span className="mr-4">
              <Link to="/login">登入</Link>
            </span>{" "}
            <span className="mr-4">|</span>{" "}
            <span className="mr-4">
              <Link to="/register">還沒有帳號?</Link>
            </span>{" "}
          </>
        )}
      </div>
    </div>
  );
}

export default Header;