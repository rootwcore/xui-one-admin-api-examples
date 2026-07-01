# 🔐 Security Checklist

XUI.ONE Admin API access can be highly privileged. Use the following checklist before using it in production.

## API key

- [ ] The real API key was not committed to GitHub.
- [ ] The `.env` file is ignored by Git.
- [ ] API keys are stored only on trusted servers.
- [ ] API keys are rotated regularly.
- [ ] API keys are not printed in logs.

## Access code

- [ ] A dedicated access code was created for Admin API access.
- [ ] The access code is hard to guess.
- [ ] IP restriction is enabled whenever possible.
- [ ] Unused access codes were removed.
- [ ] The access code is not exposed in screenshots or public issues.

## Network

- [ ] HTTPS is enabled.
- [ ] Self-signed SSL is not used in production.
- [ ] Panel ports are not unnecessarily public.
- [ ] Firewall rules were reviewed.
- [ ] Only trusted systems can call the Admin API.

## Application

- [ ] API keys are not embedded in frontend JavaScript.
- [ ] API calls are routed through a backend service.
- [ ] Logs mask secrets.
- [ ] Rate limits or operation limits are applied.
- [ ] Destructive actions require confirmation.
- [ ] Production and test credentials are separated.

## High-risk actions

Use extra caution with these actions:

```text
mysql_query
delete_line
delete_stream
delete_movie
delete_server
kill_pid
kill_connection
clear_streams
clear_temp
edit_settings
```

Test high-risk actions in a non-production environment before automation.
