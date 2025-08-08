String getWeatherIcon(int weatherId) {
  if (weatherId < 300) {
    return 'assets/images/icons/thunderstorm.png';
  } else if (weatherId < 400) {
    return 'assets/images/icons/drizzle.png';       // 3xx drizzle
  } else if (weatherId < 500) {
    return 'assets/images/icons/error.png';         // fallback, no id in 400s
  } else if (weatherId < 600) {
    return 'assets/images/icons/rainy.png';          // 5xx rain
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

String getWeatherIconByCode(String code) {
  switch (code) {
    case '01d':
    case '01n':
      return 'assets/images/icons/clear.png';
    case '02d':
    case '02n':
      return 'assets/images/icons/partly_cloudy.png';
    case '03d':
    case '03n':
    case '04d':
    case '04n':
      return 'assets/images/icons/clouds.png';
    case '09d':
    case '09n':
    case '10d':
    case '10n':
      return 'assets/images/icons/rainy.png';
    case '11d':
    case '11n':
      return 'assets/images/icons/thunderstorm.png';
    case '13d':
    case '13n':
      return 'assets/images/icons/snow.png';
    case '50d':
    case '50n':
      return 'assets/images/icons/atmosphere.png';
    default:
      return 'assets/images/icons/error.png';
  }
}
