import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repositories/weather_repo.dart';
import 'package:weather_app/logic/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/screens/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
        child: SearchPage(),
      ),
    );
  }
}
