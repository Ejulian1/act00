import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _themeIndex = 0;
  int _quoteIndex = 0;

  final Random _random = Random();
  Timer? _quoteTimer;

  // Color themes
  final List<ColorScheme> _colorThemes = [
    ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ColorScheme.fromSeed(seedColor: Colors.pink),
    ColorScheme.fromSeed(seedColor: Colors.blue),
  ];

  final List<String> _themeNames = [
    "Purple Theme",
    "Pink Theme",
    "Blue Theme",
  ];

  final List<String> _quotes = [
    "The best way to get started is to quit talking and start doing.",
    "Don't let yesterday take up too much of today.",
    "It's not whether you get knocked down, it's whether you get up.",
    "If you are working on something exciting, it will keep you motivated.",
    "Success is not in what you have, but who you are.",
  ];

  @override
  void initState() {
    super.initState();
    _startQuoteTimer();
  }

  @override
  void dispose() {
    _quoteTimer?.cancel();
    super.dispose();
  }

  void _startQuoteTimer() {
    _quoteTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      _randomizeQuote();
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _switchTheme() {
    setState(() {
      _themeIndex = (_themeIndex + 1) % _colorThemes.length;
    });
  }

  void _randomizeQuote() {
    setState(() {
      _quoteIndex = _random.nextInt(_quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = _colorThemes[_themeIndex];

    return Theme(
      data: ThemeData(
        colorScheme: currentTheme,
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: currentTheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.palette),
              onPressed: _switchTheme,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Profile Card
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.person,
                            size: 50, color: currentTheme.primary),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Student Name',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Major: Computer Science',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Theme Indicator
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: currentTheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Current Theme: ${_themeNames[_themeIndex]}',
                    style: TextStyle(
                      color: currentTheme.onPrimaryContainer,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Motivational Quotes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    color: currentTheme.secondaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            _quotes[_quoteIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color:
                                  currentTheme.onSecondaryContainer,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Icon Gallery
                const Text(
                  'Hobbies & Interests',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _IconItem(icon: Icons.music_note, label: 'Music'),
                    _IconItem(icon: Icons.sports_soccer, label: 'Sports'),
                    _IconItem(icon: Icons.brush, label: 'Art'),
                    _IconItem(icon: Icons.book, label: 'Reading'),
                    _IconItem(icon: Icons.camera_alt, label: 'Photo'),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _IconItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Icon(icon, size: 40, color: theme.primary),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
