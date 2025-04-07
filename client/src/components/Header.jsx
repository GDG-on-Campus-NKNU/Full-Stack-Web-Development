import { Link, useNavigate } from "react-router-dom";

function Header() {
    const token = localStorage.getItem('token');
    const navigate = useNavigate();
  
    return (
      <div className="flex justify-between items-center p-4">
        <Link to="/">🏠 GDSC 雛型</Link>
        <div>
          {token ? (
            <>
              <Link to="/dashboard">Dashboard</Link>
              <button onClick={() => { localStorage.removeItem('token'); navigate('/'); }}>登出</button>
            </>
          ) : (
            <Link to="/login">登入</Link>
          )}
        </div>
      </div>
    );
  }
  
export default Header;