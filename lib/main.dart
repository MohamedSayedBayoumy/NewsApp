import 'package:flutter/material.dart';

import 'core/core_components/screen_util_init.dart';
import 'core/global/globals.dart';
import 'core/services/services_locator.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized() ;
  ServicesLocator.service() ;
  init() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialAppWithScreenUtil();
  }
}
