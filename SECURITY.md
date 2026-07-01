# Security Policy

This repository contains example code and documentation. Do not share real API keys, panel URLs, access codes, usernames, passwords, or customer data.

## Supported versions

| Version | Status |
|---|---|
| 1.x | Supported |

## Reporting a vulnerability

If you find a security issue in this repository, please report it privately to the repository owner before opening a public issue.

## Recommendations

- Do not commit your `.env` file.
- Do not hard-code API keys in source files.
- Restrict Admin API access codes by IP address whenever possible.
- Use HTTPS in production.
- If you use `verify_ssl=false` or `curl -k` for testing, disable that behavior before production use.
- Keep Admin API permissions as narrow as possible.
- Rotate API keys after testing, demos, or accidental exposure.
