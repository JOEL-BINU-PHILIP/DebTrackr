import 'package:debtrackr/colors.dart';
import 'package:flutter/material.dart';
class DashboardCashWidget extends StatelessWidget {
  const DashboardCashWidget({
    super.key, required this.buttonColor , required this.buttonBorderColor , required this.buttonText
  });
  final Color buttonColor;
  final Color buttonBorderColor;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color:buttonColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: buttonBorderColor, width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Total $buttonText ", style: style,),
          const Text("500rs" ,style: style,),
          const SizedBox(height: 15,),
          const Text("see more details>>>>", style: TextStyle(color:Colors.white ),)
        ],
      ),
    );
  }
}