# 🔑 Setting up an XUI.ONE Admin API Access Code

This guide summarizes how to prepare an access code and API key for Admin API usage.

> Panel menu names may differ slightly between XUI.ONE versions.

---

## 1) Create an access code for Admin API

The panel usually exposes this under:

```text
Management > Access Control > Access Codes
```

When creating a new access code:

- Access Type: `Admin API`
- Group: `Administrators` or another authorized group
- IP Restriction: preferably only your trusted server or office IP address

---

## 2) Generate an Admin API key

Generate or copy the API key from your admin profile.

The key is used in requests like this:

```text
?api_key=YOUR_ADMIN_API_KEY
```

---

## 3) Test the connection

```bash
curl -k "https://PANEL-DOMAIN:9000/ACCESSCODE/?api_key=YOUR_ADMIN_API_KEY&action=get_users"
```

If you receive a valid response, Admin API access is working.

---

## 4) Store values as environment variables

```env
XUI_BASE_URL=https://PANEL-DOMAIN:9000/ACCESSCODE/
XUI_API_KEY=YOUR_ADMIN_API_KEY
XUI_VERIFY_SSL=true
```

---

## Recommended security settings

- Create a dedicated access code for API use.
- Restrict the access code by IP address.
- Rotate API keys regularly.
- Never upload `.env` to GitHub.
- Do not call the Admin API directly from public frontend JavaScript.
- Route sensitive API calls through your own backend service.
