import 'package:flutter/material.dart';

class RowNavigationBar extends StatelessWidget {
  const RowNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
