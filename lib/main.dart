import 'package:aeromatersa/screens/detalle_screen.dart';
import 'package:aeromatersa/screens/historial_screen.dart';
import 'package:aeromatersa/screens/home_screen.dart';
import 'package:aeromatersa/screens/servicios_screen.dart';
import 'package:flutter/material.dart';

import 'package:aeromatersa/screens/login_screen.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aeromater SA',
      initialRoute: 'login',
      routes: {
        'login':(_)=>LoginScreen(),
        'home': (_)=>HomeScreen(),
        'historial': (_)=>HistorialScreen(),
        'detalle': (_)=>DetalleScreen(),
        'informacion': (_)=>InformacionScreen(),
      },
      theme: ThemeData.light().copyWith(
        // scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
      ),
    );
  }
}

