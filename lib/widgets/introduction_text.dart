import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              height: 2.0,
            ),
          ),
          TextSpan(text: '\nI\'m a'),
          TextSpan(
            text: ' Flutter ',
            style: GoogleFonts.raleway(
              fontSize: 60,
              color: Colors.blue,
              letterSpacing: 4,
              height: 2.0,
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

class ImprovedIntroductionText extends StatelessWidget {
  const ImprovedIntroductionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(34.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, I\'m',
            style: GoogleFonts.raleway(
              fontSize: 44,
              color: Colors.white,
              letterSpacing: 4,
              height: 1.8,
            ),
          ),
          Text(
            'Hewa Jalal',
            style: GoogleFonts.raleway(
              fontSize: 68,
              color: Colors.red,
              // color: Colors.deepOrange[400],
              letterSpacing: 8,
              height: 1.8,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                'I build apps for ',
                style: GoogleFonts.raleway(
                  fontSize: 64,
                  color: Colors.white,
                  letterSpacing: 4,
                  height: 1.8,
                ),
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Android',
                    textStyle: customTextStyle(64),
                    speed: Duration(milliseconds: 60),
                  ),
                  TypewriterAnimatedText(
                    'IOS',
                    textStyle: customTextStyle(64),
                    speed: Duration(milliseconds: 60),
                  ),
                  TypewriterAnimatedText(
                    'Desktop',
                    textStyle: customTextStyle(64),
                    speed: Duration(milliseconds: 60),
                  ),
                  TypewriterAnimatedText(
                    'Web',
                    textStyle: customTextStyle(64),
                    speed: Duration(milliseconds: 60),
                  ),
                ],
              ),
              Text(
                'with',
                style: GoogleFonts.raleway(
                  fontSize: 54,
                  color: Colors.white,
                  letterSpacing: 4,
                  height: 1.8,
                ),
              ),
              Text(
                ' Flutter',
                style: GoogleFonts.raleway(
                  fontSize: 54,
                  color: Colors.blue,
                  letterSpacing: 4,
                  height: 1.8,
                ),
              ),

              // Text(
              //   'apps',
              //   style: GoogleFonts.raleway(
              //     fontSize: 50,
              //     color: Colors.white,
              //     letterSpacing: 4,
              //     height: 1.5,
              //   ),
              // ),
            ],
          ),
          // Row(
          //   children: <Widget>[
          //     Text(
          //       'with',
          //       style: GoogleFonts.raleway(
          //         fontSize: 54,
          //         color: Colors.white,
          //         letterSpacing: 4,
          //         height: 1.5,
          //       ),
          //     ),
          //     Text(
          //       ' Flutter',
          //       style: GoogleFonts.raleway(
          //         fontSize: 54,
          //         color: Colors.blue,
          //         letterSpacing: 4,
          //         height: 1.5,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
    return RichText(
      text: TextSpan(
        text: 'Hello, I\'m',
        style: GoogleFonts.raleway(
          fontSize: 30,
          color: Colors.white,
          letterSpacing: 4,
          height: 1.5,
        ),
        children: [
          TextSpan(text: '\n'),
          TextSpan(
            text: 'Hewa Jalal',
            style: GoogleFonts.raleway(
              fontSize: 54,
              color: Colors.red,
              // color: Colors.deepOrange[400],
              letterSpacing: 8,
              height: 1.5,
            ),
          ),
          TextSpan(text: '\n'),
          TextSpan(
            text: 'I build IOS, Android, Desktop apps & Websites',
            style: GoogleFonts.raleway(
              fontSize: 50,
              color: Colors.white,
              letterSpacing: 4,
              height: 1.5,
            ),
          ),
          // TextSpan(
          //   text: 'IOS',
          //   style: GoogleFonts.raleway(
          //     fontSize: 50,
          //     // color: Colors.yellow,
          //     color: Colors.red,
          //     letterSpacing: 4,
          //   ),
          // ),
          // TextSpan(
          //   text: ', Android',
          //   style: GoogleFonts.raleway(
          //     fontSize: 50,
          //     // color: Colors.green,
          //     color: Colors.green,
          //     letterSpacing: 4,
          //   ),
          // ),
          // TextSpan(
          //   text: ', Desktop',
          //   style: GoogleFonts.raleway(
          //     fontSize: 50,
          //     color: Colors.blue,
          //     letterSpacing: 4,
          //   ),
          // ),
          // TextSpan(
          //   text: ' apps ',
          //   style: GoogleFonts.raleway(
          //     fontSize: 50,
          //     color: Colors.white,
          //     letterSpacing: 4,
          //   ),
          // ),
          // TextSpan(
          //   text: '&',
          //   style: GoogleFonts.raleway(
          //     fontSize: 50,
          //     color: Colors.yellow[400],
          //     letterSpacing: 4,
          //   ),
          // ),
          // TextSpan(
          //   text: ' Websites',
          //   style: GoogleFonts.raleway(
          //     fontSize: 50,
          //     // color: Colors.blue,
          //     color: Colors.deepPurple[400],
          //     letterSpacing: 4,
          //   ),
          // ),
          TextSpan(text: '\n'),
          TextSpan(
            text: 'with',
            style: GoogleFonts.raleway(
              fontSize: 54,
              color: Colors.white,
              letterSpacing: 4,
              height: 1.5,
            ),
          ),
          TextSpan(
            text: ' Flutter',
            style: GoogleFonts.raleway(
              fontSize: 54,
              color: Colors.blue,
              letterSpacing: 4,
              height: 1.5,
            ),
          ),

          // TextSpan(
          //   text: 'developer',
          //   style: GoogleFonts.raleway(
          //     fontSize: 50,
          //     color: Colors.white,
          //     letterSpacing: 4,
          //   ),
          // ),
        ],
      ),
    );
  }
}

TextStyle customTextStyle(double fontSize) {
  return GoogleFonts.raleway(
    fontSize: fontSize.sp,
    color: Colors.white,
    letterSpacing: 4,
    // height: 1.5,
    height: 1.8,
    // fontWeight: FontWeight.bold,
  );
}

TextStyle customTitleTextStyle(double fontSize, BuildContext context) {
  return GoogleFonts.asap(
    // fontSize: fontSize.sp,
    color: Colors.white,
    letterSpacing: 4,
    // height: 1.5,
    height: 1.8,
    textStyle: Theme.of(context).textTheme.titleMedium,
    // fontWeight: FontWeight.bold,
  );
}
