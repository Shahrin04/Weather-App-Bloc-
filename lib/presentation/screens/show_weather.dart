import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/logic/bloc/weather_bloc.dart';

class ShowWeather extends StatelessWidget {
  final city;
  WeatherModel weather;

  ShowWeather({this.city, this.weather});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 32, right: 32, top: 10),
        child: Column(
          children: [
            Text(city,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(weather.getTemp.round().toString() + 'C',
                style: TextStyle(color: Colors.white70, fontSize: 50)),
            Text(
              "Temperature",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(weather.getMaxTemp.round().toString() + 'C',
                        style: TextStyle(color: Colors.white70, fontSize: 30)),
                    Text(
                      "Max Temperature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(weather.getMinTemp.round().toString() + 'C',
                        style: TextStyle(color: Colors.white70, fontSize: 30)),
                    Text(
                      "Min Temperature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(weather.pressure.toString() + 'mbar',
                        style: TextStyle(color: Colors.white70, fontSize: 30)),
                    Text(
                      "Pressure",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(weather.humidity.toString() + '%',
                        style: TextStyle(color: Colors.white70, fontSize: 30)),
                    Text(
                      "Humidity",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                  onPressed: () {
                    weatherBloc.add(ResetWeather());
                  },
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text('Search',
                      style: TextStyle(color: Colors.white70, fontSize: 16))),
            )
          ],
        ),
      ),
    );
  }
}
