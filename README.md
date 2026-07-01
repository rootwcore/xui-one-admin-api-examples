# 🚀 XUI.ONE Admin API Examples

![GitHub repo size](https://img.shields.io/github/repo-size/yourname/xui-one-admin-api-examples?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)
![PHP](https://img.shields.io/badge/PHP-7.4%2B-777BB4?style=for-the-badge&logo=php&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.8%2B-3776AB?style=for-the-badge&logo=python&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-Examples-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

> A clean, community-friendly reference repository for developers looking for **XUI.ONE Admin API actions, examples, and starter clients**.

This repository includes a categorized **XUI.ONE Admin API action reference**, ready-to-use **cURL examples**, minimal **PHP**, **Python**, and **JavaScript** clients, a **Postman collection**, setup notes, troubleshooting help, and security guidance.

> ⚠️ This is **not official XUI.ONE documentation**. Action names and request parameters may vary between XUI.ONE versions. Use this repository only on panels you own or are explicitly authorized to manage.

---

## ✨ What is included?

- 📚 Categorized Admin API action reference
- 🧪 Ready-to-run cURL commands
- 🐘 PHP API client and examples
- 🐍 Python API client and examples
- 🟨 JavaScript / Node.js examples
- 📮 Postman collection
- 🔐 Security checklist
- 🧯 Troubleshooting guide
- 🧰 GitHub-ready community files: `LICENSE`, `SECURITY.md`, `CONTRIBUTING.md`, issue templates, and PR template
- 🪟 Windows helper scripts for installing Git and uploading the repo

---

## 🧭 Repository structure

```text
xui-one-admin-api-examples/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── SECURITY.md
├── CONTRIBUTING.md
├── .gitignore
├── .env.example
├── INSTALL_GIT_WINDOWS.bat
├── CHECK_GIT_WINDOWS.bat
├── UPLOAD_TO_GITHUB_WINDOWS.bat
├── docs/
│   ├── API_ACTIONS.md
│   ├── SETUP_ACCESS_CODE.md
│   ├── USAGE_EXAMPLES.md
│   ├── TROUBLESHOOTING.md
│   ├── SECURITY_CHECKLIST.md
│   └── GITHUB_UPLOAD.md
├── src/
│   ├── php/XuiOneClient.php
│   ├── python/xui_one_client.py
│   └── js/xui-one-client.js
├── examples/
│   ├── curl/
│   ├── php/
│   ├── python/
│   └── javascript/
├── postman/
│   └── xui-one-admin-api.postman_collection.json
├── assets/
│   └── social-preview.svg
└── .github/
    ├── pull_request_template.md
    └── ISSUE_TEMPLATE/
        ├── bug_report.md
        └── feature_request.md
```

---

## ⚡ Quick start

### 1) Create your `.env` file

```bash
cp .env.example .env
```

Edit `.env` for your own panel:

```env
XUI_BASE_URL=https://PANEL-DOMAIN:9000/ACCESSCODE/
XUI_API_KEY=YOUR_ADMIN_API_KEY
XUI_VERIFY_SSL=true
XUI_SERVER_ID=1
```

> For local testing with a self-signed certificate, you may temporarily set `XUI_VERIFY_SSL=false`. Do not disable SSL verification in production.

### 2) Test the API with cURL

```bash
export XUI_BASE_URL="https://PANEL-DOMAIN:9000/ACCESSCODE/"
export XUI_API_KEY="YOUR_ADMIN_API_KEY"

curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_users"
```

### 3) Run examples

```bash
bash examples/curl/get-users.sh
php examples/php/list-lines.php
python examples/python/list_lines.py
node examples/javascript/list-lines.mjs
```

---

## 🔑 Admin API URL format

General request format:

```text
https://PANEL-DOMAIN:9000/ACCESSCODE/?api_key=YOUR_ADMIN_API_KEY&action=ACTION_NAME
```

Example:

```text
https://PANEL-DOMAIN:9000/ACCESSCODE/?api_key=YOUR_ADMIN_API_KEY&action=get_lines
```

| Field | Description |
|---|---|
| `PANEL-DOMAIN` | Your XUI.ONE panel domain or IP address |
| `9000` | HTTPS panel port. It may be different on your installation |
| `ACCESSCODE` | The access code created for Admin API access |
| `api_key` | API key generated from the admin profile |
| `action` | The Admin API action to execute |

---

## 🧩 Featured action groups

| Group | Example actions |
|---|---|
| 👤 Users | `get_users`, `get_user`, `create_user`, `edit_user`, `delete_user` |
| 📺 Lines | `get_lines`, `get_line`, `create_line`, `edit_line`, `disable_line`, `enable_line` |
| 📡 Streams | `get_streams`, `get_stream`, `create_stream`, `start_stream`, `stop_stream` |
| 🎬 Movies | `get_movies`, `get_movie`, `create_movie`, `start_movie`, `stop_movie` |
| 📚 Series | `get_series_list`, `get_series`, `create_series`, `edit_series` |
| 🧱 Bouquets | `get_bouquets`, `get_bouquet`, `create_bouquet`, `edit_bouquet` |
| 🖥️ Servers | `get_servers`, `get_server`, `get_server_stats`, `reload_nginx` |
| 🧾 Logs | `activity_logs`, `live_connections`, `client_logs`, `stream_errors` |
| 🛡️ Blocks | `get_blocked_ips`, `add_blocked_ip`, `flush_blocked_ips` |

Full reference:

👉 [`docs/API_ACTIONS.md`](docs/API_ACTIONS.md)

---

## 🐘 PHP example

```php
<?php

require __DIR__ . '/../../src/php/XuiOneClient.php';

$client = new XuiOneClient(
    getenv('XUI_BASE_URL'),
    getenv('XUI_API_KEY'),
    getenv('XUI_VERIFY_SSL') !== 'false'
);

$response = $client->get('get_lines');

print_r($response);
```

More PHP examples:

👉 [`examples/php`](examples/php)

---

## 🐍 Python example

```python
import os
from src.python.xui_one_client import XuiOneClient

client = XuiOneClient(
    base_url=os.environ["XUI_BASE_URL"],
    api_key=os.environ["XUI_API_KEY"],
    verify_ssl=os.getenv("XUI_VERIFY_SSL", "true").lower() == "true",
)

print(client.get("get_lines"))
```

More Python examples:

👉 [`examples/python`](examples/python)

---

## 🟨 JavaScript example

```js
import { XuiOneClient } from '../../src/js/xui-one-client.js';

const client = new XuiOneClient({
  baseUrl: process.env.XUI_BASE_URL,
  apiKey: process.env.XUI_API_KEY
});

console.log(await client.get('get_lines'));
```

More JavaScript examples:

👉 [`examples/javascript`](examples/javascript)

---

## 📮 Test with Postman

Postman collection:

```text
postman/xui-one-admin-api.postman_collection.json
```

Suggested Postman environment variables:

| Variable | Example |
|---|---|
| `base_url` | `https://PANEL-DOMAIN:9000/ACCESSCODE/` |
| `api_key` | `YOUR_ADMIN_API_KEY` |
| `server_id` | `1` |

---

## 🪟 Uploading to GitHub from Windows

If GitHub web upload skips hidden files such as `.github`, `.gitignore`, or `.env.example`, use the included Windows helpers:

```text
INSTALL_GIT_WINDOWS.bat
CHECK_GIT_WINDOWS.bat
UPLOAD_TO_GITHUB_WINDOWS.bat
```

Step-by-step guide:

👉 [`docs/GITHUB_UPLOAD.md`](docs/GITHUB_UPLOAD.md)

---

## 🔐 Security notes

- Do not upload your real API key to GitHub.
- Do not commit your `.env` file.
- Restrict the Admin API access code to trusted IP addresses whenever possible.
- Use a dedicated access code for Admin API calls.
- Use HTTPS in production.
- Use `curl -k` only for testing self-signed certificates.
- Treat powerful actions such as `mysql_query`, `delete_*`, `kill_pid`, and `edit_settings` with extreme caution.

Detailed checklist:

👉 [`docs/SECURITY_CHECKLIST.md`](docs/SECURITY_CHECKLIST.md)

---

## 🧯 Troubleshooting

| Problem | Likely cause | Suggested fix |
|---|---|---|
| `Access Denied` | Wrong access code or missing Admin API permission | Check the access code type and group permissions |
| Empty response | Wrong port/domain or SSL issue | Verify HTTP/HTTPS, port, and access code path |
| `Invalid API Key` | Wrong or expired API key | Generate a new API key from the admin profile |
| `action not found` | Action name differs in your version | Inspect the panel network request and compare parameters |
| SSL error | Self-signed certificate | Use `curl -k` for testing only; use a valid certificate in production |

Detailed guide:

👉 [`docs/TROUBLESHOOTING.md`](docs/TROUBLESHOOTING.md)

---

## 🧪 cURL snippets

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_users"
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_lines"
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_streams"
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_server_stats&server_id=1"
```

All cURL examples:

👉 [`examples/curl`](examples/curl)

---

## 🤝 Contributing

Pull requests are welcome. You can add missing actions, version-specific notes, new examples, or documentation fixes.

Contribution guide:

👉 [`CONTRIBUTING.md`](CONTRIBUTING.md)

---

## 📌 Legal and ethical use

This repository is intended for education, documentation, and authorized administration of your own systems. Do not use these examples against systems you do not own or manage with explicit permission.

---

## ⭐ Support this repository

If this helped you, consider starring the repository so more developers can find the XUI.ONE Admin API reference. 🌟

---

## 📄 License

MIT License. See [`LICENSE`](LICENSE) for details.
