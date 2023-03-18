import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:news_app_clean_architecture/_intro_screens/screens/controller/intro_cubit.dart';

import 'core/global/globals.dart';

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
    print("hi 3") ;

    final media = MediaQuery.of(context).size;

    IntroBloc bloc = IntroBloc();
    final cubit = BlocProvider.of<IntroBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //   Container(
                    //     width: 500 ,
                    //     height: 300 ,
                    //     color: Colors.red,
                    //     child: GoogleMap(
                    //       onMapCreated: (x){},
                    //       initialCameraPosition: CameraPosition (
                    //         target: LatLng (24.77 , 34.66),
                    //         zoom: 10.0,
                    //       ),
                    //       markers: {
                    //         Marker( markerId: MarkerId (("")),
                    //           position: LatLng (12, 12),
                    //           infoWindow: InfoWindow (
                    //             title: "Meto",
                    //             snippet: "Hamzawy",
                    //           ),
                    //         )
                    //       },
                    //     ),
                    //   ),
                    //   Container(
                    //     width: 500 ,
                    //     height: 300 ,
                    //     color: Colors.red,
                    //     child: GoogleMap(
                    //       onMapCreated: (x) {},
                    //
                    //       initialCameraPosition: CameraPosition(
                    //         target: LatLng(
                    //             sharedPreferences
                    //                 .getDouble("latitude")!
                    //                 .toDouble(),
                    //             sharedPreferences
                    //                 .getDouble("longitude")!
                    //                 .toDouble()),
                    //         zoom: 3.0,
                    //       ),
                    //       markers: {
                    //         Marker(
                    //           markerId: const MarkerId(("")),
                    //           position: LatLng(
                    //               sharedPreferences
                    //                   .getDouble("latitude")!
                    //                   .toDouble(),
                    //               sharedPreferences
                    //                   .getDouble("longitude")!
                    //                   .toDouble()),
                    //           infoWindow: InfoWindow(
                    //             title: "Meto",
                    //             snippet: "Hamzawy",
                    //           ),
                    //         )
                    //       },
                    //     ),
                    //   ),
                    //
                    //   Container (
                    //     child: RaisedButton (
                    //       onPressed: () async {
                    //
                    //       },
                    //       child: Text ("Get Location"),
                    //     ),
                    //   ),

                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * .03),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .23,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(80),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(
                                0.0,
                                10.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: -6.0,
                            ),
                          ],
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.35),
                              BlendMode.multiply,
                            ),
                            image: const AssetImage(
                                'assets/images/image_profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .24,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(80),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [
                                0.1,
                                0.4,
                                0.6,
                                0.9,
                              ],
                              colors: [
                                Colors.black45,
                                Colors.black38.withOpacity(.2),
                                Colors.white.withOpacity(.1),
                                Colors.white.withOpacity(.2),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: media.width * .05,
                                top: media.height * .04,
                                right: media.width * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                      width: media.width * .5,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Tools to Create, Optimize Meta Descriptions",
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "interBold",
                                            fontSize: media.width * .04),
                                      )),
                                ),
                                SizedBox(
                                    width: media.width * .5,
                                    child: Text(
                                      "Ann Smarty",
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontFamily: "inter",
                                          fontSize: media.width * .04),
                                    )),
                                Expanded(
                                  child: SizedBox(
                                      width: media.width * .5,
                                      child: Text(
                                        "2023-02-16T 13:54:52Z",
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontFamily: "inter",
                                            fontSize: media.width * .04),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    const Text(
                      'hi',

                    ),
                  ]),
            ),
            TextButton(
                onPressed: () async {
                  cubit.changeLocalizationEvent() ;
                },
                child: const Text("change language")),
            TextButton(
                onPressed: () {
                },
                child: const Text("change Theme")),
          ],
        ),
      ),
    );
  }
}
