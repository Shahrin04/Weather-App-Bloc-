import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/screens/error_page.dart';
import 'package:weather_app/presentation/screens/show_weather.dart';

class SearchPage extends StatelessWidget {
  Widget build(BuildContext context) {
    var _cityController = TextEditingController();
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FlareActor(
                  'assets/WorldSpin.flr',
                  fit: BoxFit.contain,
                  animation: 'roll',
                ),
                height: 300,
                width: 300,
              ),
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherIsNotSearched) {
                  return Container(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: Column(
                      children: [
                        Text(
                          'Search Weather',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                        Text(
                          'Instantly',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                              color: Colors.white70),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          controller: _cityController,
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                              hintText: 'City Name',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white70,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.white70,
                                      style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: FlatButton(
                              onPressed: () {
                                weatherBloc
                                    .add(FetchWeather(_cityController.text));
                              },
                              color: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text('Search',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 16))),
                        )
                      ],
                    ),
                  );
                } else if (state is WeatherIsLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherIsLoaded) {
                  return ShowWeather(
                    city: _cityController.text,
                    weather: state.getWeather,
                  );
                } else {
                  return ErrorPage();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
