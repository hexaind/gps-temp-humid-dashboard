<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Live Temperature and Humidity Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <!-- Leaflet CSS & JS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
  <style>
  table th,
  table td {
    text-align: center;
    vertical-align: middle;
  }
</style>

</head>
<body>

<div class="container-fluid p-4">
  <h2 class="text-center mb-4">Live Temperature and Humidity Dashboard</h2>

  <!-- Chart -->
  <div class="card mb-4">
    <div class="card-body">
      <canvas id="liveChart" style="width: 100%; height: 400px;"></canvas>
    </div>
  </div>
<!-- Map Section -->
<div class="card mb-4">
  <div class="card-body">
    <h4 class="card-title">Live Location Map</h4>
    <div id="map" style="height: 400px;"></div>
  </div>
</div>
  <!-- Table -->
  <div class="card">
    <div class="card-body">
      <h4 class="card-title">Latest 50 Entries with Location Data</h4>
      <div class="table-responsive">
        <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
          <th>Date</th>
          <th>Time</th>
          <th>Temperature (°C)</th>
          <th>Humidity (%)</th>
          <th>City</th>
          <th>Region</th>
          <th>Country</th>
          <th>Latitude</th>
          <th>Longitude</th>
          <th>Altitude (m)</th>
          <th>Speed (km/h)</th>
          <th>Heading (°)</th>
        </tr>
      </thead>
          <tbody id="data-table">
            <!-- Filled by JS -->
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<script>
  var liveChart;
  let map;
let polyline;
let markers = [];

function initializeMap() {
  map = L.map('map').setView([20.5937, 78.9629], 10); // Default India center
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; Live Temperature & Humidity Dashboard'
  }).addTo(map);
}
  function getCompassDirection(degree) {
  const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW', 'N'];
  return directions[Math.round(degree / 45) % 8];
}

  function loadData() {
    $.ajax({
      url: 'fetch_data.php',
      method: 'GET',
      dataType: 'json',
      success: function(data) {

// Clear previous map overlays
if (polyline) {
  map.removeLayer(polyline);
}
markers.forEach(marker => map.removeLayer(marker));
markers = [];

let latlngs = [];

data.forEach(record => {
  if (record.latitude !== null && record.longitude !== null) {
    const latlng = [record.latitude, record.longitude];
    latlngs.push(latlng);

    const marker = L.marker(latlng).bindPopup(
      `<b>${record.city}, ${record.region}</b><br>Temp: ${record.temperature}°C<br>Humid: ${record.humidity}%`
    );
    marker.addTo(map);
    markers.push(marker);
  }
});

// Draw path
polyline = L.polyline(latlngs, { color: 'blue' }).addTo(map);

// Auto-center on last location
if (latlngs.length > 0) {
  map.setView(latlngs[latlngs.length - 1], 13);
}

        var chartData = [...data].reverse(); // For chart: oldest to latest
        var labels = [], tempData = [], humidData = [];

        chartData.forEach(function(record) {
          var time = record.timestamp.split(' ')[1].slice(0, 5); // HH:MM
          labels.push(time);
          tempData.push(record.temperature);
          humidData.push(record.humidity);
        });

        if (liveChart) {
          liveChart.data.labels = labels;
          liveChart.data.datasets[0].data = tempData;
          liveChart.data.datasets[1].data = humidData;
          liveChart.update();
        } else {
          var ctx = document.getElementById('liveChart').getContext('2d');
          liveChart = new Chart(ctx, {
            type: 'line',
            data: {
              labels: labels,
              datasets: [
                {
                  label: 'Temperature (°C)',
                  data: tempData,
                  borderColor: 'rgba(255, 99, 132, 1)',
                  backgroundColor: 'rgba(255, 99, 132, 0.2)',
                  borderWidth: 2,
                  tension: 0.4
                },
                {
                  label: 'Humidity (%)',
                  data: humidData,
                  borderColor: 'rgba(54, 162, 235, 1)',
                  backgroundColor: 'rgba(54, 162, 235, 0.2)',
                  borderWidth: 2,
                  tension: 0.4
                }
              ]
            },
            options: {
              responsive: true,
              scales: {
                x: {
                  title: { display: true, text: 'Time' }
                },
                y: {
                  title: { display: true, text: 'Values' }
                }
              }
            }
          });
        }

        var tableContent = '';
        data.forEach(function(record) {
          var timestampParts = record.timestamp.split(' ');
          var date = timestampParts[0];
          var timeParts = timestampParts[1].slice(0, 5).split(':');
          var hours = parseInt(timeParts[0]);
          var minutes = timeParts[1];
          var ampm = hours >= 12 ? 'PM' : 'AM';
          hours = hours % 12 || 12;
          var formattedTime = hours + ':' + minutes + ' ' + ampm;

          tableContent += '<tr>';
          tableContent += '<td>' + date + '</td>';
          tableContent += '<td>' + formattedTime + '</td>';
          tableContent += '<td>' + (record.temperature ?? 'null') + '</td>';
          tableContent += '<td>' + (record.humidity ?? 'null') + '</td>';
          tableContent += '<td>' + record.city + '</td>';
          tableContent += '<td>' + record.region + '</td>';
          tableContent += '<td>' + record.country + '</td>';
          tableContent += '<td>' + (record.latitude !== null ? record.latitude.toFixed(6) : 'null') + '</td>';
          tableContent += '<td>' + (record.longitude !== null ? record.longitude.toFixed(6) : 'null') + '</td>';
          tableContent += '<td>' + (record.altitude !== null ? record.altitude.toFixed(2) : 'null') + '</td>';
          tableContent += '<td>' + (record.speed !== null ? record.speed.toFixed(2) : 'null') + '</td>';
          tableContent += '<td>' + (record.heading !== null ? getCompassDirection(record.heading) + ' (' + record.heading.toFixed(2) + '°)' : 'null') + '</td>';
          tableContent += '</tr>';
        });
        $('#data-table').html(tableContent);
      }
    });
  }

  initializeMap();
  loadData();

  setInterval(loadData, 10000);
</script>

</body>
</html>
