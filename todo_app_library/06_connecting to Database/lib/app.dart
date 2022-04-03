import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/home_page.dart'; //cSpell:disable

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme:
            GoogleFonts.ibmPlexSansThaiTextTheme(Theme.of(context).textTheme),
      ),
      home: const HomePage(title: 'Todo App :: NP (871-326)'),
    );
  }
}
