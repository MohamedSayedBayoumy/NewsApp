import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';

import '_intro_screens/screens/controller/intro_bloc.dart';
import '_intro_screens/screens/controller/intro_state.dart';
import 'core/global/globals.dart';
import 'core/services/services_locator.dart';
import 'home_screen_categories.dart';

class Test3 extends StatefulWidget {
  const Test3({Key? key}) : super(key: key);

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  dynamic x;

  dynamic y;
  List<Marker> data = [];

  @override
  Widget build(BuildContext context) {
    LatLng x = LatLng(0.0, 0.0);

    final bloc = BlocProvider.of<IntroScreensBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 500 ,
                    height: 300 ,
                    color: Colors.red,
                    child: GoogleMap(
                      onMapCreated: (x){},
                      initialCameraPosition: CameraPosition (
                        target: LatLng (24.77 , 34.66),
                        zoom: 10.0,
                      ),
                      markers: {
                        Marker( markerId: MarkerId (("")),
                          position: LatLng (12, 12),
                          infoWindow: InfoWindow (
                            title: "Meto",
                            snippet: "Hamzawy",
                          ),
                        )
                      },
                    ),
                  ),
                  Container(
                    width: 500 ,
                    height: 300 ,
                    color: Colors.red,
                    child: GoogleMap(
                      onMapCreated: (x) {},

                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            sharedPreferences
                                .getDouble("latitude")!
                                .toDouble(),
                            sharedPreferences
                                .getDouble("longitude")!
                                .toDouble()),
                        zoom: 3.0,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId(("")),
                          position: LatLng(
                              sharedPreferences
                                  .getDouble("latitude")!
                                  .toDouble(),
                              sharedPreferences
                                  .getDouble("longitude")!
                                  .toDouble()),
                          infoWindow: InfoWindow(
                            title: "Meto",
                            snippet: "Hamzawy",
                          ),
                        )
                      },
                    ),
                  ),

                  Container (
                    child: RaisedButton (
                      onPressed: () async {

                      },
                      child: Text ("Get Location"),
                    ),
                  ),

                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    'hi',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),

            TextButton(
                onPressed: () {
                  bloc.add(ChangeLocalizationEvent(context: context));
                },
                child: const Text("change language")),
            TextButton(
                onPressed: () {
                  bloc.add(ChangeThemeModeEvent());
                },
                child: const Text("change Theme")),
          ],
        ),
      ),
    );
  }
}
