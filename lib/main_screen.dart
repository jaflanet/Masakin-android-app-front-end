import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.yellow,
        items: [
          Icon(Icons.home, size: 30,),
          Icon(Icons.library_books, size: 30),
          Icon(Icons.person, size: 30,)
        ],
      )
    );
  }
}