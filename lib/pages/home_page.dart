import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio_2/widgets/header.dart';
import 'package:parallax_rain/parallax_rain.dart';
import '../widgets/introduction_text.dart';
import '../widgets/introduction_widgert.dart';
import '../widgets/social_icons.dart';
import 'projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  bool pageIsScrolling = false;

  void _onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        _pageController
            .nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);

        print('scroll down');
      } else {
        _pageController
            .previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
        print('scroll up');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) => _onScroll(details.delta.dy * -1),
        child: Listener(
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
              _onScroll(pointerSignal.scrollDelta.dy);
            }
          },
          child: PageView(
            controller: _pageController,
            pageSnapping: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ProjectsPage(),
              IntroductionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
