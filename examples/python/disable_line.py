import os
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parents[2]))

from src.python.xui_one_client import XuiOneClient

line_id = os.getenv("LINE_ID")
if not line_id:
    raise SystemExit("LINE_ID environment variable is required")

client = XuiOneClient(
    base_url=os.getenv("XUI_BASE_URL", "https://PANEL-DOMAIN:9000/ACCESSCODE/"),
    api_key=os.getenv("XUI_API_KEY", "YOUR_ADMIN_API_KEY"),
    verify_ssl=os.getenv("XUI_VERIFY_SSL", "true").lower() == "true",
)

print(client.get("disable_line", {"id": line_id}))
