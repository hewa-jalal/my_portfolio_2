import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:glass/glass.dart';

import 'package:parallax_rain/parallax_rain.dart';

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

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.5;
    final double itemWidth = size.width / 2;
    return Scaffold(
      // backgroundColor: Colors.red,
      // body: SizedBox(
      //   height: 100,
      //   width: 400,
      //   child: GFListTile(
      //     color: Colors.blue,
      //     avatar: GFAvatar(),
      //     titleText: 'Title',
      //     subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
      //     icon: Icon(Icons.favorite),
      //   ),
      // ),
      // body: ExpansionTile(
      //   children: [Text('Open google play store')],
      //   title: Text('Fruit vs Vegetables'),
      //   subtitle: Text('a quiz app'),
      //   leading: Icon(Icons.picture_as_pdf_sharp),
      // ),
      body: Column(
        children: [
          Text('Published apps'),
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisSpacing: 40,
            crossAxisCount: 4,
            children: [
              ProjectCard2(),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard2 extends StatelessWidget {
  const ProjectCard2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/fruits_vs_vegetables_logo_nobg.png',
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Fruits vs Vegetables',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'ever wondered if a food is a fruit or vegetable? now you can easily discover that.',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: FlutterLogo(),
          )
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 20,
        color: Colors.white,
        child: Row(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Expanded(
                  child: Image.asset("assets/images/shape_of_you.png"),
                  flex: 2,
                ),
              ),
            ),
            Flexible(
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: ListTile(
                        title: Text("Shape Of You"),
                        subtitle: Text("Ed Sheeran"),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text("PLAY"),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          TextButton(
                            child: Text("ADD TO QUEUE"),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
      elevation: 8,
      margin: EdgeInsets.all(10),
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
              'Scroll down to see projects',
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
