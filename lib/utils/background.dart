String getBackgroundImage(int weatherId) {
  if (weatherId >= 200 && weatherId < 300) {
    return 'assets/images/thunderstorm.jpg';
  } else if (weatherId >= 300 && weatherId < 400) {
    return 'assets/images/drizzle.jpg';
  } else if (weatherId >= 500 && weatherId < 600) {
    return 'assets/images/rain.jpg';
  } else if (weatherId >= 600 && weatherId < 700) {
    return 'assets/images/snow.jpg';
  } else if (weatherId >= 700 && weatherId < 800) {
    return 'assets/images/fog.jpg'; // mist, smoke, etc.
  } else if (weatherId == 800) {
    return 'assets/images/clear.jpg';
  } else if (weatherId > 800 && weatherId < 900) {
    return 'assets/images/clouds.jpg';
  } else {
    return 'assets/images/default.jpg'; // fallback
  }
}
