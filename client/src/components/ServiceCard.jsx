function ServiceCard({ service }) {
    return (
      <li className="border rounded p-4 shadow hover:bg-gray-50">
        <h2 className="text-lg font-semibold">{service.name}</h2>
        <p className="text-sm text-gray-600">{service.description}</p>
        <p className="text-right font-bold text-blue-600">${service.price}</p>
      </li>
    );
  }
  export default ServiceCard;
  