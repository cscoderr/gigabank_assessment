import 'package:flutter/material.dart';
import 'package:flutterassignment/address/address_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF42009D),
          primary: const Color(0xFF42009D),
          secondary: const Color(0xFFFD9D08),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFFFD9D08),
          linearTrackColor: Color(0xFFE5E5E5),
          linearMinHeight: 5,
        ),
      ),
      home: const HomePage(title: 'Flutter Gigabank assignment'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _navigateToAddAddressScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddressScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.blue,
                elevation: 5,
              ),
              onPressed: _navigateToAddAddressScreen,
              child: const Text('Add address',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
