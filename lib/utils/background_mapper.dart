String getBackgroundImage(int weatherId) {
  if (weatherId < 300) {
    return 'assets/images/backgrounds/thunderstorm.jpg';  // 2xx thunderstorm 
  } else if (weatherId < 400) {
    return 'assets/images/backgrounds/drizzle.jpg';       // 3xx drizzle
  } else if (weatherId < 500) {
    return 'assets/images/backgrounds/default.jpg';       // fallback, no id in 400s
  } else if (weatherId < 600) {
    return 'assets/images/backgrounds/rainy.jpg';          // 5xx rain
  } else if (weatherId < 700) {
    return 'assets/images/backgrounds/snow.jpg';          // 6xx snow
  } else if (weatherId < 800) {
    return 'assets/images/backgrounds/atmosphere.jpg';    // 7xx atmosphere
  } else if (weatherId == 800) {
    return 'assets/images/backgrounds/clear.jpg';         // 800 clear
  } else if (weatherId < 900) {
    return 'assets/images/backgrounds/clouds.jpg';        // 80x clouds
  } else {
    return 'assets/images/backgrounds/default.jpg';       // fallback
  }
}
