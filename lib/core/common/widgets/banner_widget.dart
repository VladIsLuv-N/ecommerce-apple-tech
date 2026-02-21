import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final Color color;

  const BannerWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text('Banner', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
