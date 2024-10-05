import 'package:bloc_state_management/themes/text_styles.dart';
import 'package:bloc_state_management/themes/theme.dart';
import 'package:flutter/material.dart';

// import 'app_theme.dart'; // Adjust the import based on your file structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,  // Use light theme
      darkTheme: AppTheme.darkTheme,  // Use dark theme
      themeMode: ThemeMode.system,  // Automatically switch based on system mode
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Flutter Bloc State Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              // Here you can add functionality for theme toggle
            },
          ),
        ],
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Click me', style: AppTextStyles.buttonText),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(150, 40),
          ),// Use buttonText directly
        ),
      ),
    );
  }
}
