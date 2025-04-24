import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseParkingView extends StatelessWidget {
  static const name = '/browse_parking';
  const BrowseParkingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }
}