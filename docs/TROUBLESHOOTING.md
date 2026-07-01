# 🧯 Troubleshooting

## `Access Denied`

Likely causes:

- The access code is wrong.
- The access code was not created with the Admin API type.
- The API key is wrong.
- Your IP address is blocked by an IP restriction.

Suggested fixes:

- Check the access code type.
- Make sure the access code is assigned to an authorized admin group.
- If IP whitelisting is enabled, add your server or office IP address.

---

## `Invalid API Key`

Likely causes:

- The API key is missing or incorrect.
- The API key belongs to another admin account.
- Extra spaces were copied with the key.

Suggested fixes:

- Generate a new API key from the admin profile.
- Check URL encoding if the key contains special characters.
- Remove leading or trailing spaces.

---

## Empty or HTML response

Likely causes:

- Wrong port.
- HTTP and HTTPS are mixed up.
- Missing trailing slash after the access code.
- The login page is being returned instead of the API response.

Debug command:

```bash
curl -i -k "https://PANEL-DOMAIN:9000/ACCESSCODE/?api_key=YOUR_ADMIN_API_KEY&action=get_users"
```

Check the HTTP status code and returned body.

---

## SSL error

For quick testing:

```bash
curl -k "https://PANEL-DOMAIN:9000/ACCESSCODE/?api_key=YOUR_ADMIN_API_KEY&action=get_users"
```

Recommended production fix:

- Use a valid SSL certificate.
- Keep SSL verification enabled in clients.

---

## `action not found` or unexpected response

Likely causes:

- The action name is different in your panel version.
- The action is not supported by your license or version.
- Required parameters are missing.

Suggested fixes:

- Try alternative action names listed in `docs/API_ACTIONS.md`.
- Perform the same operation in the panel and inspect the Network request.
- Compare the payload with your API request.

---

## Create or edit action fails

Likely causes:

- Required fields are missing.
- Field names differ by version.
- The panel expects form-encoded data.

Suggested fixes:

- Use `POST` with `application/x-www-form-urlencoded`.
- Inspect the panel request in Developer Tools > Network.
- Start with a minimal payload and add fields one by one.
