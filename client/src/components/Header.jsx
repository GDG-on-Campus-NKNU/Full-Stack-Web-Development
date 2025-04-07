import { Link, useNavigate } from "react-router-dom";

function Header() {
    const token = localStorage.getItem('token');
    const user = localStorage.getItem('user');
    const navigate = useNavigate();
  
    return (
      <div className="flex justify-between items-center p-4">
        <Link to="/">🏠 全端式網頁雛型</Link>
        <div>
          {token ? (
            <>
            <span className="mr-4">歡迎使用者：{JSON.parse(user).name}</span>{" "}
            <span className="mr-4">|</span>{" "}
            <Link to="/dashboard">儀表板</Link>{" "}
            <span className="mr-4">|</span>{" "}
            <button onClick={() => {
              localStorage.removeItem('token');
              localStorage.removeItem('user');
              navigate('/');
            }}>登出</button>
            </>
          ) : (
            <Link to="/login">登入</Link>
          )}
        </div>
      </div>
    );
  }
  
export default Header;