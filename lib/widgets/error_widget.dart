import 'package:flutter/material.dart';

class ErrorMessege extends StatelessWidget {
  const ErrorMessege({super.key, required this.messege});

  final String messege;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        messege,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}