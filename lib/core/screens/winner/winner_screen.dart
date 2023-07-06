import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class WinnerScrenn extends StatelessWidget {
  const WinnerScrenn({super.key, required this.winner});

  final Map<String, dynamic> winner;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: AppColors.purple),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "${winner['firstName']}"
              .getWidget(fontSize: 80, fontColor: AppColors.white),
          "${winner['lastName']}"
              .getWidget(fontColor: AppColors.white, fontSize: 60),
          "${winner['grade']}"
              .getWidget(fontColor: AppColors.white, fontSize: 24)
        ],
      ),
    );
  }
}
