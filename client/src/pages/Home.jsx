import { Link } from "react-router-dom";

function Home() {
  return (
    <div className="p-6 space-y-3 text-center">
      <h1 className="text-2xl font-bold mb-4">資料表預覽</h1>
      <Link to="/browse/users" className="block text-blue-600 underline">使用者資料</Link>
      <Link to="/browse/services" className="block text-blue-600 underline">服務資料</Link>
      <Link to="/browse/orders" className="block text-blue-600 underline">訂單資料</Link>
    </div>
  );
}

export default Home;
