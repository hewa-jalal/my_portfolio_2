import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'hover_button.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: <Widget>[
              SizedBox(width: 5),
              CustomHoverButton(
                child: Lottie.asset(
                  'assets/lottie/github.json',
                  animate: false,
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(width: 10),
              CustomHoverButton(
                child: Lottie.asset(
                  'assets/lottie/in.json',
                  animate: false,
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(width: 5),
              CustomHoverButton(
                child: Lottie.asset(
                  'assets/lottie/insta.json',
                  animate: false,
                  height: 60,
                  width: 60,
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 180,
              height: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      // Colors.blue,
                      // Colors.red,
                      Colors.purple,
                      Colors.blue,
                      Colors.green,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
