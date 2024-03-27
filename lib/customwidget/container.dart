import 'package:flutter/material.dart';

class CustomeContainer extends StatelessWidget {
  const CustomeContainer({super.key, required this.icon, required this.label});
  final icon;
  final label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 0),
              color: Colors.black26,
              spreadRadius: 5,
              blurRadius: 5,
            )
          ]),
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
