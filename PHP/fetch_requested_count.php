<?php

$host = 'localhost'; 
$username = 'root'; 
$password = ''; 
$dbname = 'roammate_db';  

$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Query to get the count of rows in the 'requested_itineraries' table
$query = "SELECT COUNT(id) AS total_requested FROM requested_itineraries";
$result = mysqli_query($conn, $query);

// Check if the query was successful
if ($result) {
    // Fetch the result as an associative array
    $row = mysqli_fetch_assoc($result);
    $count = $row['total_requested'];

    // Return the count as JSON
    echo json_encode(['count' => $count]);
} else {
    // Return an error if the query failed
    echo json_encode(['error' => 'Failed to fetch data']);
}

// Close the database connection
mysqli_close($conn);
?>
