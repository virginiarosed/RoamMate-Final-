<?php
    session_start();
    if (!isset($_SESSION['admin_email'])) {
        header('Location: rm_adminlogin_process.php');
        exit();
    }
    ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RoamMate│ Add Requested Itineraries</title>
    <link rel="stylesheet" href="../CSS/rm_requested.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="icon" href="../Images/icon.png" type="image/png">
</head>
<body>
    <header class="header">
        <!-- Logo Image -->
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
                <li class="active"><a href="../PHP/rm_requested.php"><img src="../Images/requested_itinerary.svg" alt="Requested Itinerary Icon" style="width: 33px; height: auto;"><span>Add Requested</span></a></li>
                <li><a href="../PHP/rm_requested_record.php"><img src="../Images/requested_record.svg" alt="Requested Record Icon" style="width: 27px; height: auto;"s><span>Requested Itineraries</span></a></li>
                <li><a href="../PHP/logout.php"><img src="../Images/logout.svg" alt="Log Out Icon" style="width: 33px; height: auto;"><span>Log Out</span></a></li>
            </ul>            
        </nav>
        <main class="content"> 
            <img src="../Images/rm_requested_title.svg" alt="Requested Title" class="requested-img">

            <div class="itinerary-container">
                <!-- Left Part: Form -->
                <form id="itinerary-form" method="POST" action="../PHP/submit_requested_itinerary.php">
                    <div class="itinerary-form">
                        <h1>Add Requested Itinerary</h1>
                        
                        <div class="form-group">
                            <label for="client-name">Client's Name <span style="color: red;">*</span></label>
                            <textarea id="client-name" name="client-name" placeholder="Enter client's name" required></textarea>
                        </div>

                        <div class="form-group">
                            <label for="destination">Destination <span style="color: red;">*</span></label>
                            <textarea id="destination" name="destination" placeholder="Enter destination here" required></textarea>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="start-date">Start Date <span style="color: red;">*</span></label>
                                <input type="date" id="start-date" name="start_date" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="end-date">End Date <span style="color: red;">*</span></label>
                                <input type="date" id="end-date" name="end_date" required>
                            </div>
                        </div>                    
                        
                        <div class="form-group">
                            <label for="lodging">Lodging <span style="color: red;">*</span></label>
                            <textarea id="lodging" name="lodging" placeholder="Enter lodging details" required></textarea>
                        </div>
                        
                        <p id="duration-text"><b>Duration:</b> 0 Days, 0 Nights</p>

                    </div>

                    <!-- Error Messages -->
                    <div id="client-name-error" style="color: red; display: none; font-size: 15px; text-align: center; margin: 0 auto; margin-bottom: 10px;">
                        <p>Client's name cannot start with a space or special characters and must be longer than one letter.</p>
                    </div>
                    <div id="destination-error" style="color: red; display: none; font-size: 15px; text-align: center; margin: 0 auto; margin-bottom: 10px;">
                        <p>Destination cannot start with a space or special characters and must be longer than one letter.</p>
                    </div>
                    <div id="duration-error" style="color: red; display: none; font-size: 15px; text-align: center; margin-bottom: -10px;">
                        <p>Days must be higher than nights, and nights must be exactly 1 less than days.</p>
                    </div>
                    <div id="lodging-error" style="color: red; display: none; font-size: 15px; text-align: center; margin-bottom: 10px;">
                        <p>Lodging details cannot be empty</p>
                    </div>
                </form>
                
                <div class="itinerary-day">
                    <!-- Day container -->
                    <div id="main-day-container">
                        <!-- Dynamic day containers will be inserted here -->
                    </div>
            
                    <!-- Add Button for submitting the form -->
                    <div class="form-group">
                        <button type="submit" class="add-itinerary-btn">Add Itinerary</button>
                    </div>
                </div>
            </div>
            <!-- Modal for Success Message -->
            <div id="modal-popup" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p id="modal-message"></p>
                </div>
            </div>  
        </main>
    </div>
    <script src="../JS/rm_requested.js"></script>

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