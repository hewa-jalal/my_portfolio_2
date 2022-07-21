import 'package:animated_card/animated_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../models/project_model.dart';
import '../utils/constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlurryContainer(
      blur: 5,
      elevation: 0,
      color: Colors.white.withOpacity(0.12),
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: AnimatedCard(
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8),
          child: InkWell(
            // onTap: onProjectClick,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        flex: 40,
                        child: Image.asset(
                          project.image,
                          width: width * .25,
                          height: width * .25,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(),
                      ),
                      //* title and description
                      Expanded(
                        flex: 60,
                        child: Container(
                          child: Wrap(
                            direction: Axis.horizontal,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ProjectButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectButtons extends StatelessWidget {
  const ProjectButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Image.asset(
            googlePlayButton,
            // height: height * 0.1,
            // width: width * 0.1,
            fit: BoxFit.scaleDown,
          ),
        ),
        Expanded(
          child: Image.asset(githubButton,
              // height: height * 0.1,
              // width: width * 0.1,
              fit: BoxFit.contain),
        ),
      ],
    );
  }
}
