"""Minimal XUI.ONE Admin API client.

Use only with panels you own or are authorized to manage.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, Optional
from urllib.parse import urlencode
from urllib.request import Request, urlopen
from urllib.error import HTTPError, URLError
import json
import ssl


@dataclass
class XuiOneClient:
    base_url: str
    api_key: str
    verify_ssl: bool = True
    timeout: int = 20

    def __post_init__(self) -> None:
        self.base_url = self.base_url.rstrip("/") + "/"

    def get(self, action: str, params: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
        return self._request("GET", action, params or {})

    def post(self, action: str, params: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
        return self._request("POST", action, params or {})

    def _request(self, method: str, action: str, params: Dict[str, Any]) -> Dict[str, Any]:
        query = {"api_key": self.api_key, "action": action}
        url = self.base_url + "?" + urlencode(query)

        body = None
        headers = {"Accept": "application/json"}

        if method.upper() == "GET" and params:
            url += "&" + urlencode(params, doseq=True)
        elif method.upper() == "POST":
            body = urlencode(params, doseq=True).encode("utf-8")
            headers["Content-Type"] = "application/x-www-form-urlencoded"

        context = None
        if not self.verify_ssl:
            context = ssl._create_unverified_context()  # noqa: SLF001

        request = Request(url, data=body, headers=headers, method=method.upper())

        try:
            with urlopen(request, timeout=self.timeout, context=context) as response:
                raw = response.read().decode("utf-8", errors="replace")
                return self._decode(raw, response.status)
        except HTTPError as exc:
            raw = exc.read().decode("utf-8", errors="replace")
            return self._decode(raw, exc.code)
        except URLError as exc:
            raise RuntimeError(f"Connection error: {exc}") from exc

    @staticmethod
    def _decode(raw: str, status_code: int) -> Dict[str, Any]:
        try:
            data = json.loads(raw)
            return {"ok": 200 <= status_code < 300, "status_code": status_code, "data": data}
        except json.JSONDecodeError:
            return {"ok": 200 <= status_code < 300, "status_code": status_code, "raw": raw}
