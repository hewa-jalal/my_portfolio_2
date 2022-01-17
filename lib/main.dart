import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_2/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
// import 'package:sizer/sizer.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: () => MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          canvasColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
              .copyWith(
                bodyText1: TextStyle(color: bodyTextColor),
                bodyText2: TextStyle(color: bodyTextColor),
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // builder: (context, widget) => ResponsiveWrapper.builder(
        //   ClampingScrollWrapper.builder(context, widget!),
        //   breakpoints: const [
        //     ResponsiveBreakpoint.resize(350, name: MOBILE),
        //     ResponsiveBreakpoint.autoScale(600, name: TABLET),
        //     ResponsiveBreakpoint.resize(800, name: DESKTOP),
        //     ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        //   ],
        // ),
      ),
    );
  }
}
