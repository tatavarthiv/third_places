import 'package:flutter/material.dart';
import 'package:parks/providers/weather_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherWidget extends StatefulWidget {
  final double latitude;
  final double longitude;

  const WeatherWidget({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String _temperature = 'Fetching...';
  Icon _weatherIcon = const Icon(Icons.help_outline, size: 40); 

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  Future<void> _getWeather() async {
    try {
      final weatherData = await WeatherService().getWeather(widget.latitude, widget.longitude);

      setState(() {
        double tempCelsius = weatherData['main']['temp'];
        double tempFahrenheit = (tempCelsius * 9 / 5) + 32;
        _temperature = '${tempFahrenheit.toStringAsFixed(1)}°';
        _weatherIcon = _getWeatherIcon(weatherData['weather'][0]['main']);
      });
    } catch (e) {
      setState(() {
        _temperature = "Error";
        _weatherIcon = const Icon(Icons.error, size: 16, color: Colors.red);
      });
    }
  }

  // Map weather conditions to icons with dynamic colors
  Icon _getWeatherIcon(String condition) {
    const iconSize = 16.0;
    switch (condition.toLowerCase()) {
      case 'clear':
        return const Icon(Icons.wb_sunny, size: iconSize); 
      case 'rain':
        return const Icon(FontAwesomeIcons.cloudShowersHeavy, size: iconSize); 
      case 'clouds':
        return const Icon(Icons.cloud, size: iconSize); 
      case 'snow':
        return const Icon(FontAwesomeIcons.snowflake, size: iconSize); 
      case 'mist':
        return const Icon(FontAwesomeIcons.droplet, size: iconSize); 
      default:
        return const Icon(Icons.help_outline, size: iconSize); 
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_temperature == "Error" || _temperature == 'Fetching...') {
      return const SizedBox.shrink(); 
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _weatherIcon,
        const SizedBox(width: 8),
        Text(
          _temperature,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
