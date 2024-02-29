import 'package:flutter/material.dart';
import 'package:notes_app/Screens/homepage.dart';
import 'package:notes_app/provider/app_provider.dart';
import 'package:notes_app/themesetting/themeColors.dart';
import 'package:notes_app/themesetting/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => notes_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var isDark = context.watch<themeProvider>().themevalue;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: isDark ? lightMode : darkMode,
      home: const MyHomePage(),
    );
  }
}
