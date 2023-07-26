import 'package:flutter/material.dart';
import 'package:todos_app/screens/create_screen.dart';
import 'package:todos_app/screens/detail_screen.dart';
import 'package:todos_app/screens/edit_screen.dart';
import 'package:todos_app/screens/home_screen.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: customTheme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  CreateScreen.routeName: (context) => const CreateScreen(),
  DetailScreen.routeName: (context) => const DetailScreen(),
  EditScreen.routeName: (context) => const EditScreen(),
};

ThemeData customTheme() => ThemeData(
    useMaterial3: true,
    // scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: appBarBgColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 15),
        focusedBorder: customOutlineInputBorder(width: 2),
        errorBorder: customOutlineInputBorder(color: Colors.red),
        focusedErrorBorder:
            customOutlineInputBorder(width: 2, color: Colors.red),
        enabledBorder: customOutlineInputBorder()),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
      bodySmall: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
    colorScheme: const ColorScheme.light(
        primary: Colors.black87,
        secondary: Colors.white,
        tertiary: Color.fromARGB(255, 203, 200, 200)));

OutlineInputBorder customOutlineInputBorder(
    {double width = 1, Color color = Colors.black}) {
  return OutlineInputBorder(borderSide: BorderSide(width: width, color: color));
}
