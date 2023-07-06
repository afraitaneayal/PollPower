import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class WinnerScrenn extends StatelessWidget {
  const WinnerScrenn({super.key, required this.winner});

  final QueryDocumentSnapshot<Map<String, dynamic>> winner;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: AppColors.purple),
      child: Column(
        children: [
          "${winner.data()['firstName']}".getWidget(),
          "${winner.data()['lastName']}".getWidget()
        ],
      ),
    );
  }
}
