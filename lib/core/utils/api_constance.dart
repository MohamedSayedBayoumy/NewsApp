class ApiConstanceAuth {
  static const baseUrl = "https://student.valuxapps.com/api/";
  static const pathLogin = "https://student.valuxapps.com/api/login";
  static const pathRegister = "https://student.valuxapps.com/api/register";
  static const pathUpdateProfile =
      "https://student.valuxapps.com/api/update-profile";
  static const logoutProfile = "https://student.valuxapps.com/api/logout";
}

class ApiConstanceWeather {
  static const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  static  String urlIcon(String? icon) => "https://openweathermap.org/img/wn/$icon@2x.png";
  static const key = "de322af954e0a15b65def971432d2621";
}

