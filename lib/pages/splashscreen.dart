import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/models/response/weather_models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:news_ui/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double long = -1;
  late double lat = -1;
  late String city = "";
  late String temperature = "";
  bool checkSuccess = false;

  static Map<String, Object?> _parseWeather(String reponseBody) {
    WeatherModels models = WeatherModels.fromJson(jsonDecode(reponseBody));
    double? temp = models.main!.temp;
    var weather = {
      "temp": (temp! - 273.15).toStringAsFixed(2).toString(),
      "cityName": models.name as String
    };

    return weather;
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("Location services are disible");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permisions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request ....');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<Map<String, Object?>> fetchWeather(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(_parseWeather, utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 404) {
      throw Exception("not found");
    } else {
      throw Exception('Can \'t not category');
    }
  }

  @override
  void initState() {
    super.initState();

    _getCurrentLocation().then((value) {
      setState(() {
        lat = value.latitude;
        long = value.longitude;
        if (lat != -1 && long != -1) {
          String url = '${URL_weather}lat=$lat&lon=$long&appid=$api_key';
          fetchWeather(url).then((value) {
            setState(() {
              city = value["cityName"] as String;
              temperature = value["temp"] as String;

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            city: city,
                            temperature: temperature,
                          )));
            });
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Image.asset("images/logo.png"),
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
