<?php

$maxtemp = 50;

require 'vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Database configuration
$servername = "localhost";
$username = "";
$password = "";
$dbname = "";

// Get parameters from URL
$temp = isset($_GET['temp']) ? floatval($_GET['temp']) : null;
$humid = isset($_GET['humid']) ? floatval($_GET['humid']) : null;
$latitude = isset($_GET['latitude']) ? floatval($_GET['latitude']) : null;
$longitude = isset($_GET['longitude']) ? floatval($_GET['longitude']) : null;
$altitude = isset($_GET['altitude']) ? floatval($_GET['altitude']) : null;
$speed = isset($_GET['speed']) ? floatval($_GET['speed']) : null;
$heading = isset($_GET['heading']) ? floatval($_GET['heading']) : null;

// Function to get location details using Nominatim
function getLocationDetails($lat, $lon) {
    $url = "https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lon&format=json&zoom=10&addressdetails=1";
    $opts = [
        "http" => [
            "method" => "GET",
            "header" => "User-Agent: PHP-reverse-geocoder"
        ]
    ];
    $context = stream_context_create($opts);
    $response = file_get_contents($url, false, $context);
    if ($response !== false) {
        $data = json_decode($response, true);
        $address = $data['address'];
        return [
            'village' => $address['village'] ?? $address['hamlet'] ?? $address['town'] ?? $address['city'] ?? $address['county'] ?? 'Unknown',
            'district' => $address['county'] ?? 'Unknown',
            'state' => $address['state'] ?? 'Unknown',
            'country' => $address['country'] ?? 'Unknown'
        ];
    }
    return ['village' => 'Unknown', 'district' => 'Unknown', 'state' => 'Unknown', 'country' => 'Unknown'];
}

$location = getLocationDetails($latitude, $longitude);
$village = $location['village'];
$district = $location['district'];
$state = $location['state'];
$country = $location['country'];

// Send alert email if temperature > $maxtemp
if ($temp > $maxtemp) {
    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();
        $mail->Host = 'email-smtp.us-west-2.amazonaws.com';
        $mail->SMTPAuth = true;
        $mail->Username = '';
        $mail->Password = '';
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        $mail->setFrom('', 'Project 01 Alert');
        $mail->addAddress('');
        $mail->addAddress('');

        $mail->isHTML(true);
        $mail->Subject = 'High Temperature Alert!';
        $mail->Body = "<h3>🚨 High Temperature Detected!</h3>
                       <p><strong>Temperature:</strong> {$temp} °C</p>
                       <p><strong>Humidity:</strong> {$humid} %</p>
                       <p><strong>Location:</strong> {$village}, {$state}, {$country}</p>
                       <p><strong>Coordinates:</strong> {$latitude}, {$longitude}</p>
                       <p><strong>Speed:</strong> {$speed} km/hr</p>
                       <p><strong>Heading:</strong> {$heading} degrees</p>
                       <p><strong>Time:</strong> " . date('Y-m-d H:i:s') . "</p>";

        $mail->send();
    } catch (Exception $e) {
        error_log("Mailer Error: {$mail->ErrorInfo}");
    }
}

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare SQL query
$sql = "INSERT INTO sensor_data (temperature, humidity, city, region, country, latitude, longitude, altitude, speed, heading)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ddsssddddd", $temp, $humid, $village, $state, $country, $latitude, $longitude, $altitude, $speed, $heading);

if ($stmt->execute()) {
    echo "New record inserted successfully at $village, $district, $state, $country";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>