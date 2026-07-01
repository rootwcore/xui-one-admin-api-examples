<?php

require __DIR__ . '/../../src/php/XuiOneClient.php';

$baseUrl = getenv('XUI_BASE_URL') ?: 'https://PANEL-DOMAIN:9000/ACCESSCODE/';
$apiKey = getenv('XUI_API_KEY') ?: 'YOUR_ADMIN_API_KEY';
$verifySsl = (getenv('XUI_VERIFY_SSL') ?: 'true') !== 'false';

$client = new XuiOneClient($baseUrl, $apiKey, $verifySsl);

/**
 * WARNING:
 * create_line parameters may vary between XUI.ONE versions.
 * Create a line manually in the panel and inspect Developer Tools > Network
 * to confirm the exact field names expected by your installation.
 */
$params = [
    'username' => 'demo_user',
    'password' => 'demo_password',
    'max_connections' => 1,
    'exp_date' => strtotime('+30 days'),
    'bouquets' => json_encode([1]),
    'member_id' => 1,
];

try {
    $response = $client->post('create_line', $params);
    echo json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . PHP_EOL;
} catch (Throwable $e) {
    fwrite(STDERR, $e->getMessage() . PHP_EOL);
    exit(1);
}
