import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      padding: EdgeInsets.only(top: 6.h),
      constraints:  BoxConstraints(minWidth: 3.h, minHeight: 3.h),
      icon: Container(
        margin: const EdgeInsets.only(left: 7, top: 2),
        width: 3.h,
        height: 3.h,
        child: Image.asset(
          'assets/icons/arrow.png',
          color: const Color(0xFF212121),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
