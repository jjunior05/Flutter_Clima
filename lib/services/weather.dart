import '../services/location.dart';
import '../services/networking.dart';

const chaveApi = '3d7b4cd6d3373fd9527add50158dbd52';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {


  Future<dynamic> getCityWeather(String cityName) async{
    Networkhelper networkHelper = Networkhelper('$openWeatherMap?q=$cityName&appid=$chaveApi&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    Networkhelper networkHelper = await Networkhelper(
        '$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$chaveApi&units=metric');
    var weatherData =  networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
