import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeaderComponent({
    Key? key,
    this.title = 'Hello !',
    this.subtitle = 'Let’s start a new account',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      constraints: const BoxConstraints(
        minWidth: 245,
        minHeight: 68,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Color(0xFF8067A9),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Color(0xFF8067A9),
            ),
          ),
        ],
      ),
    );
  }
}
