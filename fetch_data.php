<?php
// Database configuration
$servername = "localhost";
$username = "";
$password = "";
$dbname = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the latest 50 entries, ordered by newest first
$sql = "SELECT 
            temperature, 
            humidity, 
            city,
            region,
            country,
            latitude, 
            longitude, 
            altitude,
            speed,
            heading,
            DATE_FORMAT(timestamp, '%Y-%m-%d %H:%i:%s') as timestamp 
        FROM 
            sensor_data 
        ORDER BY 
            id DESC 
        LIMIT 50";

$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = array(
            "temperature" => $row['temperature'],
            "humidity"    => $row['humidity'],
            "city"        => $row['city'] ?? "Unknown",
            "region"      => $row['region'] ?? "Unknown",
            "country"     => $row['country'] ?? "Unknown",
            "latitude"    => $row['latitude'] !== null ? floatval($row['latitude']) : null,
            "longitude"   => $row['longitude'] !== null ? floatval($row['longitude']) : null,
            "altitude"    => $row['altitude'] !== null ? floatval($row['altitude']) : null,
            "speed"       => $row['speed'] !== null ? floatval($row['speed']) : null,
            "heading"     => $row['heading'] !== null ? floatval($row['heading']) : null,
            "timestamp"   => $row['timestamp']
        );
    }
}

// Return JSON data
header('Content-Type: application/json');
echo json_encode($data);

// Close connection
$conn->close();
?>
