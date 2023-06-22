import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.candidateData});

  final List candidateData;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(body: _buildHomeContainer()),
        onWillPop: () async {
          return false;
        });
  }

  Widget _buildHomeContainer() {
    return ListView.builder(
        itemCount: candidateData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(candidateData[index]['firstName']),
          );
        });
  }
}
