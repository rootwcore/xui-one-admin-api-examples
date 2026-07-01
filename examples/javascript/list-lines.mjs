import { XuiOneClient } from '../../src/js/xui-one-client.js';

const client = new XuiOneClient({
  baseUrl: process.env.XUI_BASE_URL || 'https://PANEL-DOMAIN:9000/ACCESSCODE/',
  apiKey: process.env.XUI_API_KEY || 'YOUR_ADMIN_API_KEY'
});

console.log(await client.get('get_lines'));
