<?php
    session_start();
    if (!isset($_SESSION['admin_email'])) {
        header('Location: ../PHP/rm_adminlogin_process.php');
        exit();
    }
    ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RoamMate│ Requested Records</title>
    <link rel="stylesheet" href="../CSS/rm_requested_record.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="icon" href="../Images/icon.png" type="image/png">
</head>
<body>
    <header class="header">
        
        <div class="logo1">
          <img src="../Images/RoamMate_title.svg" alt="Logo" />
        </div>
      
        <!-- Hamburger Menu Icon -->
        <div class="hamburger-menu" onclick="toggleMenu()">
          &#9776;
        </div>
      </header>
      
      <!-- Menu -->
      <div id="nav-menu" class="nav-menu">
        <ul>
          <li><a href="../PHP/rm_home.php">Home</a></li>
          <div class="divider2"></div>
          <li><a href="../PHP/rm_standard.php">Standard Itineraries</a></li>
          <div class="divider2"></div>
          <li><a href="../PHP/rm_requested.php">Add Requested</a></li>
          <div class="divider2"></div>
          <li><a href="../PHP/rm_requested_record.php">Requested Itineraries</a></li>
          <div class="divider2"></div>
          <li><a href="../PHP/logout.php">Logout</a></li>
        </ul>
      </div>
    <div class="container">
        <nav class="sidebar">
            <div class="logo">
                <img src="../Images/RoamMate_logo.svg" alt="Logo" class="logo-img">
            </div>
            <ul class="menu">
                <li><a href="../PHP/rm_home.php"><img src="../Images/home.svg" alt="Home Icon"><span>Home</span></a></li>
                <li><a href="../PHP/rm_standard.php"><img src="../Images/standard_itinerary.svg" alt="Standard Icon" style="width: 35px; height: auto;"><span>Standard Itineraries</span></a></li>
                <li><a href="../PHP/rm_requested.php"><img src="../Images/requested_itinerary.svg" alt="Requested Itinerary Icon" style="width: 33px; height: auto;"><span>Add Requested</span></a></li>
                <li class="active"><a href="../PHP/rm_requested_record.php"><img src="../Images/requested_record.svg" alt="Requested Record Icon" style="width: 27px; height: auto;"s><span>Requested Itineraries</span></a></li>
                <li><a href="../PHP/logout.php"><img src="../Images/logout.svg" alt="Log Out Icon" style="width: 33px; height: auto;"><span>Log Out</span></a></li>
            </ul>            
        </nav>
        <main class="content"> 
            <img src="../Images/rm_clients_title.svg" alt="Home Title" class="requested-record-img">

            <div class="requested-record-main-container">
            <div class="date-filter">
                <label for="start-date">Start Date:</label>
                <input type="date" id="start-date">
                
                <label for="end-date">End Date:</label>
                <input type="date" id="end-date">
                
                <button id="filter-btn">Filter</button>
            </div>
            <div class="requested-record-container"></div>
        </div>
        
    <script src="../JS/rm_requested_record.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Get the current URL path
            const currentPath = window.location.pathname;

            // Select all <a> elements in the sidebar
            const menuLinks = document.querySelectorAll('.menu a');

            // Loop through the links and compare their href with the current path
            menuLinks.forEach(link => {
                if (link.getAttribute('href') === currentPath) {
                    // Add the active class to the parent <li>
                    link.parentElement.classList.add('active');
                }
            });
        });

        // Function to toggle the navigation menu
        function toggleMenu() {
        const menu = document.getElementById("nav-menu");
        menu.classList.toggle("active");
        }    
    </script>
</body>
</html>
                
                