import 'package:flutter/material.dart';
class RoundActionButton extends StatelessWidget {
  final IconData symbolicon;
  final Function() assignment;
  const RoundActionButton({super.key, required this.symbolicon, required this.assignment});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: assignment,
      elevation: 10,
      fillColor: const Color(0xFF000000),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(width: 2 ,color: Colors.white)),
      constraints: const BoxConstraints(minHeight: 70, minWidth: 70),
      child: Icon(
        size: 45,
        symbolicon,
        color: Colors.white,
      ),
    );
  }
}