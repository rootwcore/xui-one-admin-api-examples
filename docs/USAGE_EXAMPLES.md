# 🧪 Usage Examples

This file contains common XUI.ONE Admin API calls.

---

## Environment variables for cURL

```bash
export XUI_BASE_URL="https://PANEL-DOMAIN:9000/ACCESSCODE/"
export XUI_API_KEY="YOUR_ADMIN_API_KEY"
```

---

## Users

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_users"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_user&id=1"
```

---

## Lines

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_lines"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_line&id=123"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=disable_line&id=123"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=enable_line&id=123"
```

---

## Streams

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_streams"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_stream&id=10"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=start_stream&id=10"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=stop_stream&id=10"
```

---

## Server statistics

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_server_stats&server_id=1"
```

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_free_space&server_id=1"
```

---

## PHP client

```php
<?php

require __DIR__ . '/../src/php/XuiOneClient.php';

$client = new XuiOneClient(
    getenv('XUI_BASE_URL'),
    getenv('XUI_API_KEY'),
    getenv('XUI_VERIFY_SSL') !== 'false'
);

print_r($client->get('get_users'));
```

---

## Python client

```python
import os
from src.python.xui_one_client import XuiOneClient

client = XuiOneClient(
    base_url=os.environ["XUI_BASE_URL"],
    api_key=os.environ["XUI_API_KEY"],
    verify_ssl=os.getenv("XUI_VERIFY_SSL", "true").lower() == "true",
)

print(client.get("get_users"))
```

---

## JavaScript client

```js
import { XuiOneClient } from '../src/js/xui-one-client.js';

const client = new XuiOneClient({
  baseUrl: process.env.XUI_BASE_URL,
  apiKey: process.env.XUI_API_KEY
});

console.log(await client.get('get_users'));
```
