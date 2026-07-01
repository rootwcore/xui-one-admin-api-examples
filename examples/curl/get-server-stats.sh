#!/usr/bin/env bash
set -euo pipefail

: "${XUI_BASE_URL:?XUI_BASE_URL is required}"
: "${XUI_API_KEY:?XUI_API_KEY is required}"
: "${XUI_SERVER_ID:=1}"

curl -k "${XUI_BASE_URL}?api_key=${XUI_API_KEY}&action=get_server_stats&server_id=${XUI_SERVER_ID}"
