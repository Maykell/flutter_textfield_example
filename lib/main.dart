import 'package:flutter/material.dart';
import 'package:flutter_textfield_validation/screeens/home_screen.dart';

void main() => runApp(App());

final _theme = _themeData();

ThemeData _themeData() {
  ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.blueGrey.shade900,
    accentColor: Colors.amber,
    buttonColor: Colors.amber,
    scaffoldBackgroundColor: Colors.blueGrey.shade900,
    textTheme: _themeText(base.textTheme),
    errorColor: Colors.red[500],
    primaryTextTheme: _themeText(base.textTheme),
    accentTextTheme: _themeText(base.textTheme),
    textSelectionColor: Colors.amber,
    textSelectionHandleColor: Colors.amber,
    hintColor: Colors.amber,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.blueGrey.shade800,
        labelStyle: TextStyle(
        color: Colors.amber,
      ),
      hintStyle: TextStyle(
        color: Colors.white,
      )
    ),
    buttonTheme: ButtonThemeData(
      height: 50.0,
    ),
  );
}

TextTheme _themeText(TextTheme base) {
  return base.copyWith().apply(
        bodyColor: Colors.white,
        displayColor: Colors.amber,
      );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Textfield Validation",
      theme: _theme,
      home: HomeScreen(
        title: "HomeScreen",
      ),
    );
  }
}
