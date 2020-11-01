import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/profile_default.jpg',
        fit: BoxFit.cover,
      )
    );
  }
}