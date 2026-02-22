<?php
require 'vendor/autoload.php'; // Include Stripe PHP library

\Stripe\Stripe::setApiKey('your-secret-key-here'); // Your secret Stripe API key

// Check if the Stripe token exists
if (!isset($_POST['stripeToken'])) {
    die('No Stripe token was provided.');
}

// Retrieve Stripe token from POST data
$token = $_POST['stripeToken'];

try {
    // Create a charge (process payment)
    $charge = \Stripe\Charge::create([
        'amount' => 5000, // 
        'currency' => '$$', // Change this to your desired currency
        'description' => 'Purchase',
        'source' => $token,
    ]);

    // If payment is successful, redirect to success page
    header('Location: success.php');
    exit;
} catch (\Stripe\Exception\CardException $e) {
    // The card has been declined or there was an error
    echo 'Payment failed: ' . $e->getMessage();
}
?>
