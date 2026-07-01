#!/usr/bin/env bash
set -euo pipefail

: "${XUI_BASE_URL:?XUI_BASE_URL is required}"
: "${XUI_API_KEY:?XUI_API_KEY is required}"
: "${LINE_ID:?LINE_ID is required}"

curl -k "${XUI_BASE_URL}?api_key=${XUI_API_KEY}&action=disable_line&id=${LINE_ID}"
