import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Browse from "./pages/Browse";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/browse/:type" element={<Browse />} />
        <Route path="*" element={<p className="text-center mt-20">找不到頁面 😢</p>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
