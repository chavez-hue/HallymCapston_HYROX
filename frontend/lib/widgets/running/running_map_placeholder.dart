import 'package:flutter/material.dart';

class RunningMapPlaceholder extends StatelessWidget {
  const RunningMapPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[300],
      child: const Center(
        child: Text(
          'MAP AREA',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}