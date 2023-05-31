import 'package:flutter/material.dart';
import 'package:news_ui/models/object/user.dart';

enum Brightness { light, dark }

double fontSize = 18;

Brightness? brightness = Brightness.light;
const String URL = "http://192.168.0.135:8081/";
const String GET_NEWS = "news";
const String GET_CATEGORY = "categories";
const String GET_PROPERTY = "properties";
const String URL_USER = "user";
const String URL_COMMENT = "comment";
const String GET_LIKE = "likes";
const String GET_IMAGES = "images";
const String api_key = "04970e49d844f27a9ecdddae8c588a72";
String URL_weather = "https://api.openweathermap.org/data/2.5/weather?";
Color primaryLight = const Color(0xff159A9C);
ThemeMode themeMode = ThemeMode.system;
final darkNotifier = ValueNotifier<bool>(false);
User? user;
String city = "";
String temperature = "";
