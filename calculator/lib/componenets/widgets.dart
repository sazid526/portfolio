

import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;

  const MyButton({Key? key,required this.title,

    this.color = const Color(0xffafafaf),
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
               height: 80,
               decoration: BoxDecoration(
                 color: color,
                 shape: BoxShape.circle
               ),
               child: Center(
                   child: Text(
                     title,
                     style: headingTextStyle,
                   )
               ),
             ),
        ),
      ),
    );
  }
}
