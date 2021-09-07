import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var _cityController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
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
            Container(
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.white70,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                        onPressed: (){},
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
            ),
          ],
        ),
      ),
    );
  }
}
