function EntityCard({ type, data }) {
    switch (type) {
      case "users":
        return (
          <div className="border rounded p-4">
            <h2 className="font-bold">{data.name}</h2>
            <p className="text-gray-600">{data.email}</p>
          </div>
        );
      case "services":
        return (
          <div className="border rounded p-4">
            <h2 className="font-bold">{data.name}</h2>
            <p>{data.description}</p>
            <p className="text-sm text-blue-600">${data.price}</p>
          </div>
        );
      case "orders":
        return (
          <div className="border rounded p-4">
            <p>使用者：{data.user}</p>
            <p>服務：{data.service}</p>
            <p className="text-sm text-gray-500">{data.order_date}</p>
          </div>
        );
      default:
        return <div>未知資料類型</div>;
    }
  }
  
  export default EntityCard;
  