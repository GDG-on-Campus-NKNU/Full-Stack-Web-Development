// poster.js
const axios = require('axios');

// API 的基本 URL
const apiUrl = 'http://localhost:3000/api/users';

// 定義一個函數，使用 POST 新增使用者
async function addUser(name) {
  try {
    const response = await axios.post(apiUrl, { name });
    console.log('使用者新增成功：', response.data);
  } catch (error) {
    console.error('新增使用者失敗：', error.response ? error.response.data : error.message);
  }
}

// 執行函數，示範新增使用者
addUser("Dave");
