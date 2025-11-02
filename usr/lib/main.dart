import "package:flutter/material.dart";
import "package:couldai_user_app/screens/home_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Telegram Bot Client",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF18222D),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF212D3B),
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2B5278),
          secondary: Color(0xFF5288C1),
          background: Color(0xFF18222D),
          surface: Color(0xFF212D3B),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
