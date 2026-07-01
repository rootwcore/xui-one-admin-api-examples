import os
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parents[2]))

from src.python.xui_one_client import XuiOneClient

client = XuiOneClient(
    base_url=os.getenv("XUI_BASE_URL", "https://PANEL-DOMAIN:9000/ACCESSCODE/"),
    api_key=os.getenv("XUI_API_KEY", "YOUR_ADMIN_API_KEY"),
    verify_ssl=os.getenv("XUI_VERIFY_SSL", "true").lower() == "true",
)

server_id = os.getenv("XUI_SERVER_ID", "1")
print(client.get("get_server_stats", {"server_id": server_id}))
