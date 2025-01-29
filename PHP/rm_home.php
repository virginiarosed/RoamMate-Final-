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
    <title>RoamMate│ Home</title>
    <link rel="stylesheet" href="../css/rm_home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="icon" href="../Images/icon.png" type="image/png">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Add Chart.js library -->
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
                <li class="active"><a href="../PHP/rm_home.php"><img src="../Images/home.svg" alt="Home Icon"><span>Home</span></a></li>
                <li><a href="../PHP/rm_standard.php"><img src="../Images/standard_itinerary.svg" alt="Standard Icon" style="width: 35px; height: auto;"><span>Standard Itineraries</span></a></li>
                <li><a href="../PHP/rm_requested.php"><img src="../Images/requested_itinerary.svg" alt="Requested Itinerary Icon" style="width: 33px; height: auto;"><span>Add Requested</span></a></li>
                <li><a href="../PHP/rm_requested_record.php"><img src="../Images/requested_record.svg" alt="Requested Record Icon" style="width: 27px; height: auto;"s><span>Requested Itineraries</span></a></li>
                <li><a href="../PHP/logout.php"><img src="../Images/logout.svg" alt="Log Out Icon" style="width: 33px; height: auto;"><span>Log Out</span></a></li>
            </ul>            
        </nav>
        <main class="content">

            <div class="image-container">
                
                <div class="left-part">
                    <img src="../Images/rm_client_logo.svg" alt="Client Logo">
                </div>

                <div class="right-part">
                    <img src="../Images/rm_client_title.svg" alt="Admin Title">
                </div>
            </div>

            <div class="new-container">
                <!-- Left Part (Vertically Divided into Top and Bottom) -->
                <div class="left-section">
                    <div class="top-part">
                        <div class="button" id="strandardButton">
                            <a href="../PHP/rm_standard.php">
                                <img src="../Images/standard_itinerary.svg" alt="Standard Icon">
                                <span>Standard Itinerary</span>
                                <div id="standardCount"></div>
                            </a>
                        </div>
                    </div>
            
                    <div class="bottom-part">
                        <div class="button" id="requestedButton">
                            <a href="../PHP/rm_requested_record.php">
                                <img src="../Images/requested_record.svg" alt="Requested Itinerary Icon">
                                <span>Requested Itinerary</span>
                                <div id="requestedCount"></div>
                            </a>
                        </div>
                    </div>
                </div>
            
                <!-- Right Part (For the Chart) -->
                <div class="right-section">
                    <div class="chart-container">
                        <canvas id="requestedItinerariesChart"></canvas>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Function to fetch the number of itineraries and display it
function fetchStandardCount() {
    fetch('../PHP/fetch_standard_count.php')  // Make sure this path is correct
        .then(response => response.json())
        .then(data => {
            if (data.count) {
                // If the count is returned, display it in the div
                document.getElementById('standardCount').textContent = data.count;
            } else {
                // If an error occurs, handle it here
                console.error('Error fetching itinerary count:', data.error);
                document.getElementById('standardCount').textContent = 'Error';
            }
        })
        .catch(error => {
            console.error('Fetch error:', error);
            document.getElementById('standardCount').textContent = 'Error';
        });
}

// Call the function on page load
document.addEventListener('DOMContentLoaded', fetchStandardCount);

document.addEventListener("DOMContentLoaded", function () {
    fetchRequestedCount();
    fetchRequestedItinerariesData(); // Fetch data for the bar graph
    fetchDestinations(); // Fetch both standard and requested destinations

    // Fetch the count of requested itineraries from the server
    function fetchRequestedCount() {
        fetch('../PHP/fetch_requested_count.php')
            .then(response => response.json())
            .then(data => {
                const requestedCountDiv = document.getElementById('requestedCount');
                
                // Check if there was an error or if the count is valid
                if (data.error) {
                    console.error(data.error);
                    requestedCountDiv.textContent = "Error loading count";
                } else {
                    requestedCountDiv.textContent = data.count; // Display the count
                }
            })
            .catch(error => {
                console.error('Error fetching requested itineraries count:', error);
            });
    }

    // Fetch data for the bar graph
    function fetchRequestedItinerariesData() {
        fetch('../PHP/fetch_requested_itineraries_data.php')
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('requestedItinerariesChart').getContext('2d');
                const chart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                        datasets: [{
                            label: 'Requested Itineraries',
                            data: data.counts,
                            backgroundColor: 'rgba(188, 108, 37, 0.2)', // Use the color from rm_home.css
                            borderColor: 'rgba(188, 108, 37, 1)', // Use the color from rm_home.css
                            borderWidth: 1,
                            barThickness: 30 // Adjust the bar thickness
                        }]
                    },
                    options: {
                        maintainAspectRatio: false, // Allow the chart to fill the container
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error('Error fetching requested itineraries data:', error);
            });
    }
});
    </script>

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