import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Hello, I\'m',
        style: GoogleFonts.raleway(
          fontSize: 60,
          color: Colors.white,
          letterSpacing: 4,
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: ' Hewa Jalal',
            style: GoogleFonts.raleway(
              fontSize: 60,
              color: Colors.red,
              letterSpacing: 4,
            ),
          ),
          TextSpan(text: '\nI\'m a'),
          TextSpan(
            text: ' Flutter ',
            style: GoogleFonts.raleway(
              fontSize: 60,
              color: Colors.blue,
              letterSpacing: 4,
            ),
          ),
          TextSpan(
            text: 'developer',
            style: GoogleFonts.raleway(
              fontSize: 60,
              color: Colors.white,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}
