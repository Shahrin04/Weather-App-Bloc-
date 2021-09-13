import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/bloc/weather_bloc.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 10),
      child: Center(
        child: Column(
          children: [
            Text("Error", style: TextStyle(color: Colors.white)),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
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
