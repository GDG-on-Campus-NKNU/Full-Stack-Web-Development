import axios from 'axios';
import { toast } from 'react-hot-toast';

const api = axios.create({
  baseURL: '/',
  withCredentials: true
});

let isRedirecting = false; // 防止多次重定向]
const allowPaths = ['/login', '/register', '/'];

api.interceptors.response.use(
  res => res,
  err => {
    if (err.response?.status === 401) {
      if (!isRedirecting && !allowPaths.includes(window.location.pathname)) {
        isRedirecting = true;
        toast.error("未登入或登入已過期");
        window.location.href = "/login";
      }
    }
    return Promise.reject(err);
  }
);

export default api;