import 'package:flutter/material.dart';

Color getBackgroundColor(int weatherId) {
  if (weatherId >= 200 && weatherId < 300) {
    return Colors.deepPurple; // Thunderstorm
  } else if (weatherId >= 300 && weatherId < 400) {
    return Colors.blueGrey; // Drizzle
  } else if (weatherId >= 500 && weatherId < 600) {
    return Colors.blue; // Rain
  } else if (weatherId >= 600 && weatherId < 700) {
    return Colors.white70; // Snow
  } else if (weatherId >= 700 && weatherId < 800) {
    return Colors.grey; // Atmosphere (mist, fog, etc.)
  } else if (weatherId == 800) {
    return Colors.orangeAccent; // Clear
  } else if (weatherId > 800 && weatherId < 900) {
    return Colors.grey.shade600; // Clouds
  } else {
    return Colors.teal; // Fallback
  }
}
