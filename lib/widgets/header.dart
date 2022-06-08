import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio_2/widgets/hover_button.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomHoverButton(
                  child: Text(
                    'About',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: Colors.white,
                      // letterSpacing: 4,
                      // height: 1.5,
                    ),
                  ),
                ),
                CustomHoverButton(
                  child: Text(
                    'Work',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: Colors.white,
                      // letterSpacing: 4,
                      // height: 1.5,
                    ),
                  ),
                ),
                CustomHoverButton(
                  child: Text(
                    'Resume',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: Colors.white,
                      // letterSpacing: 4,
                      // height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
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
        ],
      ),
    );
  }
}
