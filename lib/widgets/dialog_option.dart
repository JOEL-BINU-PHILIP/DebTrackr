import 'package:flutter/material.dart';

class DialogOption extends StatelessWidget {
  const DialogOption({super.key , required this.dialogText , required this.navigateTo});
  final String dialogText;
  final Function() navigateTo;
  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      //Here we are padding because otherwise all the options wil get squeezed together
      padding: const EdgeInsets.only(right: 40, left: 40, top: 5, bottom: 5),
      onPressed: navigateTo,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xFF9290C3),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              style: BorderStyle.solid,
              color: Colors.black, // Change the color as per your preference
              width: 2.0, // Adjust the width of the border
            )),
        child: Center(
          child: Text(
            dialogText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
