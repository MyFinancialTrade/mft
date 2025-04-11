import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/money.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.47,
              left: 0,
              right: 0,
              bottom: -1,
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21.dp),
                    topRight: Radius.circular(21.dp),
                  ),
                  // border: Border.all(color: Colors.black),
                ),
                child: Column(children: [Text('hello')]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
