import 'package:flutter/material.dart';
import 'package:my_portfolio_2/widgets/header.dart';
import 'package:parallax_rain/parallax_rain.dart';
import '../widgets/introduction_text.dart';
import '../widgets/social_icons.dart';
import 'project_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FabCircularMenu(
      //   ringWidth: 30,
      //   ringDiameter: 200,
      //   children: <Widget>[
      //     IconButton(
      //         icon: Icon(Icons.home),
      //         onPressed: () {
      //           print('Home');
      //         }),
      //     IconButton(
      //       icon: Icon(Icons.favorite),
      //       onPressed: () {
      //         print('Favorite');
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.favorite),
      //       onPressed: () {
      //         print('Favorite');
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.favorite),
      //       onPressed: () {
      //         print('Favorite');
      //       },
      //     ),
      //   ],
      // ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          IntroductionWidget(),
          ProjectsPage(),
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
          IntroductionText(),
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
