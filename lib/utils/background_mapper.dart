String getBackgroundByCode(String code) {
  switch (code) {
    // clear sky
    case '01d': return 'assets/images/backgrounds/clear.jpg';
    case '01n': return 'assets/images/backgrounds/clear_night.jpg';
    // few clouds
    case '02d': return 'assets/images/backgrounds/few_clouds_day.jpg';
    case '02n': return 'assets/images/backgrounds/few_clouds_night.jpg';
    // scattered clouds
    case '03d': return 'assets/images/backgrounds/scattered_clouds_day.jpg';
    case '03n': return 'assets/images/backgrounds/scattered_clouds_night.jpg';
    // broken clouds
    case '04d': return 'assets/images/backgrounds/clouds_day.jpg';
    case '04n': return 'assets/images/backgrounds/clouds_night.jpg';
    // shower rain
    case '09d': return 'assets/images/backgrounds/drizzle_day.jpg';
    case '09n': return 'assets/images/backgrounds/drizzle_night.jpg';
    // rain
    case '10d': return 'assets/images/backgrounds/rain_day.jpg';
    case '10n': return 'assets/images/backgrounds/rain_night.jpg';
    // thunderstorm
    case '11d': return 'assets/images/backgrounds/thunderstorm_day.jpg';
    case '11n': return 'assets/images/backgrounds/thunderstorm_night.jpg';
    // snow
    case '13d': return 'assets/images/backgrounds/snow_day.jpg';
    case '13n': return 'assets/images/backgrounds/snow_night.jpg';
    // mist/atmosphere
    case '50d': return 'assets/images/backgrounds/atmosphere_day.jpg';
    case '50n': return 'assets/images/backgrounds/atmosphere_night.jpg';
    default:
      return 'assets/images/backgrounds/default.jpg';
  }
}
