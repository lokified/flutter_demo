import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  const EmoticonFace({super.key, required this.emoticonFace});

  final String emoticonFace;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          emoticonFace,
          style: TextStyle(fontSize: 28),
        )));
  }
}
