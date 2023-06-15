import 'package:flutter/material.dart';
import 'package:poll_power/core/commons/widget/profile_pic_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: const Scaffold(
          body: ProfilPic(
            firstLetter: 'AC',
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
