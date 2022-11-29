import 'package:flutter/material.dart';
import 'package:my_portfolio_2/widgets/header.dart';
import 'package:my_portfolio_2/widgets/social_icons.dart';
import 'package:parallax_rain/parallax_rain.dart';

import 'introduction_text.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.25,
            child: ParallaxRain(
              // dropFallSpeed: 1.5,
              dropColors: [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow,
                Colors.brown,
                Colors.blueGrey,
              ],
            ),
          ),
          // Container(
          //   child: SizedBox.expand(
          //     child: Opacity(
          //       opacity: 0.15,
          //       child: Lottie.asset(
          //         'assets/lottie/flutter_logo.json',
          //         fit: BoxFit.contain,
          //       ),
          //     ),
          //   ),
          // ),
          ImprovedIntroductionText(),
          SocialIcons(),
          Align(
            // alignment: Alignment.topLeft,
            child: Header(),
          ),
          // Positioned(
          //   bottom: 74,
          //   child: Text(
          //     'Scroll down to see my projects',
          //     style: GoogleFonts.raleway(
          //       fontSize: 20,
          //       color: Colors.white,
          //       letterSpacing: 4,
          //       height: 1.5,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   child: Lottie.asset(
          //     'assets/lottie/scroll_down.json',
          //     fit: BoxFit.contain,
          //     alignment: Alignment.bottomCenter,
          //   ),
          // )
        ],
      ),
    );
  }
}
