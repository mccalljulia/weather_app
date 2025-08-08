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
