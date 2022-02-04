import 'package:assignment_app/pages/auth/login.dart';
import 'package:assignment_app/pages/auth/register.dart';
import 'package:assignment_app/pages/home/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.green, canvasColor: Colors.green[50]),
      title: 'Assignment',
      // theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const Login(),
        'register': (context) => Register(),
        'dashBoard': (context) => const DashBoard(),
      },
    );
  }
  // ignore: use_key_in_widget_constructors

}
