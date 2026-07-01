/**
 * Minimal XUI.ONE Admin API client.
 * Use only with panels you own or are authorized to manage.
 */
export class XuiOneClient {
  constructor({ baseUrl, apiKey, timeoutMs = 20000 }) {
    if (!baseUrl) throw new Error('baseUrl is required');
    if (!apiKey) throw new Error('apiKey is required');

    this.baseUrl = baseUrl.replace(/\/+$/, '') + '/';
    this.apiKey = apiKey;
    this.timeoutMs = timeoutMs;
  }

  async get(action, params = {}) {
    return this.request('GET', action, params);
  }

  async post(action, params = {}) {
    return this.request('POST', action, params);
  }

  async request(method, action, params = {}) {
    const url = new URL(this.baseUrl);
    url.searchParams.set('api_key', this.apiKey);
    url.searchParams.set('action', action);

    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), this.timeoutMs);

    const options = {
      method,
      headers: { Accept: 'application/json' },
      signal: controller.signal
    };

    if (method === 'GET') {
      for (const [key, value] of Object.entries(params)) {
        url.searchParams.set(key, value);
      }
    } else {
      options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
      options.body = new URLSearchParams(params).toString();
    }

    try {
      const response = await fetch(url, options);
      const text = await response.text();

      try {
        return {
          ok: response.ok,
          statusCode: response.status,
          data: JSON.parse(text)
        };
      } catch {
        return {
          ok: response.ok,
          statusCode: response.status,
          raw: text
        };
      }
    } finally {
      clearTimeout(timeout);
    }
  }
}
