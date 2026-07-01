<?php

/**
 * Minimal XUI.ONE Admin API client.
 *
 * This class is intentionally dependency-free and uses cURL.
 * Use only with panels you own or are authorized to manage.
 */
class XuiOneClient
{
    private string $baseUrl;
    private string $apiKey;
    private bool $verifySsl;
    private int $timeout;

    public function __construct(string $baseUrl, string $apiKey, bool $verifySsl = true, int $timeout = 20)
    {
        $this->baseUrl = rtrim($baseUrl, '/') . '/';
        $this->apiKey = $apiKey;
        $this->verifySsl = $verifySsl;
        $this->timeout = $timeout;
    }

    public function get(string $action, array $params = []): array
    {
        return $this->request('GET', $action, $params);
    }

    public function post(string $action, array $params = []): array
    {
        return $this->request('POST', $action, $params);
    }

    private function request(string $method, string $action, array $params = []): array
    {
        $query = [
            'api_key' => $this->apiKey,
            'action' => $action,
        ];

        $url = $this->baseUrl . '?' . http_build_query($query);

        if ($method === 'GET' && !empty($params)) {
            $url .= '&' . http_build_query($params);
        }

        $ch = curl_init($url);
        $options = [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => $this->timeout,
            CURLOPT_SSL_VERIFYPEER => $this->verifySsl,
            CURLOPT_SSL_VERIFYHOST => $this->verifySsl ? 2 : 0,
            CURLOPT_HTTPHEADER => [
                'Accept: application/json',
            ],
        ];

        if ($method === 'POST') {
            $options[CURLOPT_POST] = true;
            $options[CURLOPT_POSTFIELDS] = http_build_query($params);
            $options[CURLOPT_HTTPHEADER][] = 'Content-Type: application/x-www-form-urlencoded';
        }

        curl_setopt_array($ch, $options);

        $body = curl_exec($ch);
        $errno = curl_errno($ch);
        $error = curl_error($ch);
        $statusCode = (int) curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($errno) {
            throw new RuntimeException('cURL error: ' . $error, $errno);
        }

        $decoded = json_decode((string) $body, true);

        if (json_last_error() === JSON_ERROR_NONE) {
            return [
                'ok' => $statusCode >= 200 && $statusCode < 300,
                'status_code' => $statusCode,
                'data' => $decoded,
            ];
        }

        return [
            'ok' => $statusCode >= 200 && $statusCode < 300,
            'status_code' => $statusCode,
            'raw' => $body,
        ];
    }
}
