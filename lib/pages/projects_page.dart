import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_2/models/project_model.dart';
import 'package:my_portfolio_2/utils/projects_list.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../widgets/project_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  final List<String> elements = const [
    "Zero",
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "A Million Billion Trillion",
    "A much, much longer text that will still fit",
  ];

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
          Expanded(
            child: ScreenTypeLayout(
              desktop: ProjectsCardGrid(
                count: 3,
                aspectRatio: 1.7,
              ),
              tablet: ProjectsCardGrid(
                count: 2,
                aspectRatio: 1.6,
              ),
              mobile: ProjectsCardGrid(
                count: 1,
                aspectRatio: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsCardGrid extends StatelessWidget {
  final int count;
  final double aspectRatio;
  const ProjectsCardGrid({
    Key? key,
    required this.count,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: Text(
            'Published Projects',
            style: TextStyle(
              fontSize: 26.sp,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: count,
              childAspectRatio: aspectRatio,
              children: projects
                  .map(
                    (project) => ImprovedProjectCard(
                      project: project,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class ImprovedProjectCard extends StatelessWidget {
  const ImprovedProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlurryContainer(
          blur: 5,
          elevation: 0,
          color: Colors.white.withOpacity(0.12),
          padding: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: Card(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Image.asset(
                        project.image,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          AutoSizeText(
                            project.title,
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 1,
                          ),
                          SizedBox(height: height * .015),
                          AutoSizeText(
                            project.description,
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.2,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.white70,
                                      // fontSize: 12.sp,
                                      fontSize: 15,
                                    ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // SizedBox(height: 10),
                Expanded(
                  child: ProjectButtons(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
