class WeatherModel {
  String? cityName;
  double? temperature;
  double? feelsLike;
  String? overallState;
  String? iconCode;
  double? minTemp;
  double? maxTemp;
  WeatherModel(
      {this.cityName,
      this.temperature,
      this.feelsLike,
      this.overallState,
      this.iconCode,
      this.minTemp,
      this.maxTemp});

//function to parse json to dart

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temperature = json["main"]["temp"];
    feelsLike = json["main"]["feels_like"];
    overallState = json["weather"][0]["description"];
    iconCode = json["weather"][0]["icon"];
    minTemp = json["main"]["temp_min"];
    maxTemp = json["main"]["temp_max"];
  }
}
