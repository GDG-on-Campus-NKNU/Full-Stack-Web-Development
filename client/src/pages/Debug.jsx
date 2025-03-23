import { useEffect, useState } from "react";
import axios from "axios";

function Debug() {
  const [users, setUsers] = useState([]);
  const [services, setServices] = useState([]);
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    axios.get("/api/users").then(res => setUsers(res.data));
    axios.get("/api/services").then(res => setServices(res.data));
    axios.get("/api/orders").then(res => setOrders(res.data));
  }, []);

  return (
    <div className="p-6 space-y-6">
      <section>
        <h2 className="text-xl font-bold">客戶</h2>
        <ul className="list-disc ml-5">
          {users.map(u => <li key={u.id}>{u.name} ({u.email})</li>)}
        </ul>
      </section>
      <section>
        <h2 className="text-xl font-bold">服務</h2>
        <ul className="list-disc ml-5">
          {services.map(s => <li key={s.id}>{s.name} - ${s.price}</li>)}
        </ul>
      </section>
      <section>
        <h2 className="text-xl font-bold">訂單</h2>
        <ul className="list-disc ml-5">
          {orders.map((o, i) => (
            <li key={i}>客戶: {o.user} 購買了 {o.service} 服務 於 {o.order_date}</li>
          ))}
        </ul>
      </section>
    </div>
  );
}
export default Debug;
