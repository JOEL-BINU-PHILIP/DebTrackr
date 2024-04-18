import 'package:debtrackr/colors.dart';
import 'package:flutter/material.dart';

class DashboardCashWidget extends StatelessWidget {
  const DashboardCashWidget(
      {super.key,
      required this.buttonColor,
      required this.buttonBorderColor,
      required this.buttonText,
      required this.moneyTextColor,
      required this.moneyamount
      });
  final Color buttonColor;
  final Color buttonBorderColor;
  final String buttonText;
  final Color moneyTextColor;
  final String moneyamount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: buttonBorderColor, width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Total $buttonText ",
            style: style,
          ),
          Text(
            moneyamount,
            style: TextStyle(
              color: moneyTextColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "see more details>>>>",
            style: TextStyle(color: Color(0xFF9290C3)),
          )
        ],
      ),
    );
  }
}
