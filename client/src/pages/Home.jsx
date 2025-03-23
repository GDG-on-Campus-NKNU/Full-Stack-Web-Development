import { Link } from "react-router-dom";

function Home() {
  return (
    <div className="max-w-md mx-auto p-8 bg-white rounded-lg shadow-md text-center">
      <h1 className="text-2xl font-bold mb-6">歡迎來到網頁的前端!</h1>
      
      <Link 
        to="/login" 
        className="inline-block bg-blue-600 hover:bg-blue-700 text-white font-medium px-6 py-3 rounded-md transition duration-200 shadow-sm">
        前往登入
      </Link>
    </div>
  );
}

export default Home;