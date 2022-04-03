import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/scopedModels/main_scoped_model.dart'; //cSpell:disable

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //*to access all model
    final MainScopedModel _model = MainScopedModel();

    return ScopedModel(
      model: _model,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:
              GoogleFonts.ibmPlexSansThaiTextTheme(Theme.of(context).textTheme),
        ),
        home: HomePage(
          title: 'Todo App :: NP (871-326)',
          model: _model,
        ),
      ),
    );
  }
}
