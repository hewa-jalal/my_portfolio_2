import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';

import 'package:parallax_rain/parallax_rain.dart';

import 'pages/project_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabCircularMenu(
        ringWidth: 30,
        ringDiameter: 200,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print('Home');
              }),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print('Favorite');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print('Favorite');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print('Favorite');
            },
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          ProjectsPage(),
          IntroductionWidget(),
        ],
      ),
    );
  }
}

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
              dropColors: [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow,
                Colors.brown,
                Colors.blueGrey
              ],
            ),
          ),
          Container(
            // color: Colors.black,
            child: SizedBox.expand(
              child: Opacity(
                opacity: 0.15,
                child: Lottie.asset(
                  'assets/lottie/flutter_logo.json',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Center(
            child: IntroductionRichText(),
          ),
          Positioned(
            bottom: 74,
            child: Text(
              'Scroll down to see my projects',
              style: GoogleFonts.raleway(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 4,
                height: 1.5,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Lottie.asset(
              'assets/lottie/scroll_down.json',
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          )
        ],
      ),
    );
  }
}

class IntroductionRichText extends StatelessWidget {
  const IntroductionRichText({
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
