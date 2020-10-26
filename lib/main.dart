import 'package:flutter/material.dart';
import 'Explore Screen/explore_screen.dart';
import 'Profile Screen/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExploreScreen(),
    );
  }
}
