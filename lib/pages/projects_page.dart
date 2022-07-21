import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_2/models/project_model.dart';
import 'package:my_portfolio_2/utils/constants.dart';
import 'package:my_portfolio_2/utils/projects_list.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../widgets/project_card.dart';

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
    final height = MediaQuery.of(context).size.height;

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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ScreenTypeLayout(
                desktop: LayoutBuilder(builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 0.8),
                    // childAspectRatio:
                    //     constraints.maxWidth / (constraints.maxHeight / 0.75),
                    // height was => 1.3
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: projects
                        .map(
                          (project) => ProjectCard(
                            project: project,
                          ),
                        )
                        .toList(),
                  );
                }),
                mobile: ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return ImprovedProjectCard(
                      project: project,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
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
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                          ),
                          SizedBox(height: height * .01),
                          AutoSizeText(
                            project.description,
                            textScaleFactor: 1.2,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.white70,
                                    ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                ProjectButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FrostedGlass extends StatelessWidget {
  const FrostedGlass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.1),
          ),
          child: ExpansionTile(
            // backgroundColor: Colors.transparent,
            leading: Image.asset(
              'assets/images/fruits_vs_vegetables_logo_nobg.png',
            ),
            title: Text('Fruits vs Vegetables'),
            subtitle: Text(
              '''Id eu exercitation amet nisi labore voluptate. Commodo tempor et magna quis excepteur voluptate quis excepteur labore minim exercitation.''',
            ),
            children: [
              ElevatedButton(
                onPressed: () {},
                child: FlutterLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
