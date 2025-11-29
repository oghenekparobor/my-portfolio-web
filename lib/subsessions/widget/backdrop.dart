
import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://cdn.pixabay.com/photo/2020/09/28/16/29/leaves-5610361_1280.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: .96), 
                Colors.black.withValues(alpha: .96), 
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
