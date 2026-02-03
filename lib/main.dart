import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 2-3 preset color themes
  final List<ThemeData> themes = [
    ThemeData(primarySwatch: Colors.blue),
    ThemeData(primarySwatch: Colors.green),
    ThemeData(primarySwatch: Colors.purple),
  ];
  int currentTheme = 0;

  // Motivational quotes
  final List<String> quotes = [
    "Believe in yourself!",
    "Keep pushing forward!",
    "Every day is a new opportunity!",
    "Dream big, work hard!",
  ];
  String currentQuote = "Believe in yourself!";

  // Random generator
  final Random random = Random();

  void changeTheme() {
    setState(() {
      currentTheme = (currentTheme + 1) % themes.length;
    });
  }

  void changeQuote() {
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team App',
      theme: themes[currentTheme],
      home: Scaffold(
        appBar: AppBar(
          title: Text('Team App Enhancements'),
          actions: [
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: changeTheme,
              tooltip: 'Change Theme',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              // Profile Card
              Card(
                elevation: 4,
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.person, size: 50, color: Colors.blue),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student Name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Major: Computer Science',
                            style:
                                TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Motivational Quotes
              GestureDetector(
                onTap: changeQuote,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    currentQuote,
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Icon Gallery
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.sports_basketball, size: 40, color: Colors.orange),
                    Icon(Icons.music_note, size: 40, color: Colors.red),
                    Icon(Icons.brush, size: 40, color: Colors.purple),
                    Icon(Icons.book, size: 40, color: Colors.green),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
