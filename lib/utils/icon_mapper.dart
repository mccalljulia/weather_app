String getWeatherIcon(int weatherId) {
  if (weatherId < 300) {
    return 'assets/images/icons/thunderstorm.png';
  } else if (weatherId < 400) {
    return 'assets/images/icons/drizzle.png';       // 3xx drizzle
  } else if (weatherId < 500) {
    return 'assets/images/icons/error.png';         // fallback, no id in 400s
  } else if (weatherId < 600) {
    return 'assets/images/icons/rain.png';          // 5xx rain
  } else if (weatherId < 700) {
    return 'assets/images/icons/snow.png';          // 6xx snow
  } else if (weatherId < 800) {
    return 'assets/images/icons/atmosphere.png';    // 7xx atmosphere
  } else if (weatherId == 800) {
    return 'assets/images/icons/clear.png';         // 800 clear
  } else if (weatherId == 801 || weatherId == 802) {
    return 'assets/images/icons/partly_cloudy.png'; // 801, 802 partly cloudy
  }else if (weatherId < 805) {
    return 'assets/images/icons/clouds.png';        // 803, 804 clouds
  }
  else {
    return 'assets/images/icons/error.png';
  }
}