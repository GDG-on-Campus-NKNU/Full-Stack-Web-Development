import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import Debug from "./pages/Debug";

const isLoggedIn = !!localStorage.getItem("user");

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/dashboard" element={isLoggedIn ? <Dashboard /> : <Navigate to="/login" />} />
        <Route path="/debug" element={<Debug />} />
        <Route path="*" element={<p className="text-center mt-20">找不到頁面</p>} />
      </Routes>
    </BrowserRouter>
  );
}
export default App;
