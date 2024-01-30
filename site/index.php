<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername = "10.10.20.11";
$username = "myuser";
$password = "mypassword";
$database = "mydatabase";
$port = 3306;

// Crea la connessione
$conn = new mysqli($servername, $username, $password, $database, $port);

// Verifica la connessione
if ($conn->connect_error) {
    die("Connessione al database fallita: " . $conn->connect_error);
} else {
    echo "<h1>Connessione al database riuscita!</h1>";
}

// Chiudi la connessione
$conn->close();

?>

