import 'package:flutter/material.dart';
import 'home_page.dart';
import 'schedular_page.dart';
import 'package:flutter/services.dart';
import 'ticket_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'Flutter Day 03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'openSans'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SchedulePage(),
        '/third': (context) => TicketPage(),
      },
    );
  }
}
