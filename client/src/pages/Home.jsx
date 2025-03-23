import { Link } from "react-router-dom";

function Home() {
  return (
    <div className="p-6 text-center">
      <h1 className="text-2xl font-bold mb-4">歡迎來到全端應用示範</h1>
      <Link to="/login" className="bg-blue-600 text-white px-4 py-2 rounded">
        前往登入
      </Link>
    </div>
  );
}
export default Home;
