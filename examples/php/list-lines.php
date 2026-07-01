<?php

require __DIR__ . '/../../src/php/XuiOneClient.php';

$baseUrl = getenv('XUI_BASE_URL') ?: 'https://PANEL-DOMAIN:9000/ACCESSCODE/';
$apiKey = getenv('XUI_API_KEY') ?: 'YOUR_ADMIN_API_KEY';
$verifySsl = (getenv('XUI_VERIFY_SSL') ?: 'true') !== 'false';

$client = new XuiOneClient($baseUrl, $apiKey, $verifySsl);

try {
    $response = $client->get('get_lines');
    echo json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . PHP_EOL;
} catch (Throwable $e) {
    fwrite(STDERR, $e->getMessage() . PHP_EOL);
    exit(1);
}
