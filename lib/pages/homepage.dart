import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/apis/request_category.dart';
import 'package:news_ui/apis/request_new.dart';
import 'package:news_ui/models/object/new.dart';
import 'package:news_ui/models/response/weather_models.dart';
import 'package:news_ui/views/buttomnavigationcustom.dart';
import 'package:news_ui/views/categorylistview.dart';
import 'package:news_ui/views/customappbarhome.dart';
import 'package:news_ui/views/homebody.dart';
import 'package:http/http.dart' as http;
import 'package:news_ui/models/object/category.dart' as category;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double long = -1;
  late double lat = -1;
  late String city = "";
  late String temperature = "";
  late List<New> list = [];
  late List<category.Category> categories = [];

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

    //loction && time
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
            });
          });
        }
      });

      RequestCategory.fetchCategory().then((value) {
        setState(() {
          categories = value;
          requestCategory(categories[0].slug!);
        });
      });
    });
  }

  void requestCategory(String slug) {
    RequestNew.fetchNew(slug).then((news) {
      setState(() {
        list = news;
      });
    });
  }

  static Map<String, Object?> _parseWeather(String reponseBody) {
    WeatherModels models = WeatherModels.fromJson(jsonDecode(reponseBody));
    double temp = models.main!.temp as double;
    var weather = {
      "temp": (temp - 273.15).toStringAsFixed(2).toString(),
      "cityName": models.name as String
    };

    return weather;
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: CustomAppBar(
          city: city,
          temperature: temperature,
        ),
        body: HomeBody(list: list),
        drawer: Drawer(
            child: CategoryListView(
                categories: categories, requestCategory: requestCategory)),
        bottomNavigationBar: BottomNavigationCustom(
            selectedIndex: _selectedIndex, onItemTapped: _onItemTapped));
  }
}
