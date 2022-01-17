import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_2/utils/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

final projectList = <Project>[
  Project(
    title: 'Fruits vs Vegetables',
    description:
        'ever wondered if a food is a fruit or vegetable? now you can easily discover that.',
  ),

  Project(
      title: 'in bed ideas',
      description: 'simple note taking app that can help you'),
  Project(title: 'Islam Time', description: 'description'),
  Project(title: 'Fruits vs Vegetables', description: 'description'),

  // ProjectCard2(imageAsset: 'assets/images/fruits_vs_vegetables_logo_nobg.png'),
  // ProjectCard2(imageAsset: 'assets/images/islam_time_logo.png'),
];

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            MediaQuery.of(context).size.width.toString(),
            style: TextStyle(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: getValueForScreenType(
                context: context,
                mobile: ProjectsGridView(
                  crossAxisCount: 1,
                  childAspectRatio: 1.7,
                ),
                tablet: ProjectsGridView(childAspectRatio: 1.1),
                desktop: ProjectsGridView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard2 extends StatelessWidget {
  const ProjectCard2({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              imageAsset,
              height: getValueForScreenType(
                context: context,
                mobile: 16,
                tablet: 80,
                desktop: 100,
              ),
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Text(
              'Fruits vs Vegetables',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 16,
                  tablet: 18,
                  desktop: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'ever wondered if a food is a fruit or vegetable? now you can easily discover that.',
              style: TextStyle(
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 11,
                  tablet: 18,
                  desktop: 14,
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            project.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Spacer(),
          LayoutBuilder(builder: (
            context,
            constraints,
          ) {
            return Text(
              project.description,
              maxLines: getValueForScreenType(
                context: context,
                mobile: 3,
                desktop: 4,
              ),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  height: 1.5,
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: constraints.maxWidth * 0.04,
                    desktop: constraints.maxWidth * 0.04,
                    tablet: constraints.maxWidth * 0.06,
                  )
                  // fontSize: 20.sp,
                  // fontSize: getValueForScreenType(
                  //   context: context,
                  //   mobile: 16.sp,
                  //   tablet: 18.sp,
                  //   desktop: 20.sp,
                  ),
            );
          }),
          Spacer(),
          // TextButton(
          //   onPressed: () {},
          //   // child: Text(
          //   //   "Read More >>",
          //   //   style: TextStyle(color: primaryColor),
          //   // ),
          // AspectRatio(
          //   aspectRatio: getValueForScreenType(
          //     context: context,
          //     mobile: 7,
          //     desktop: 7.0,
          //     tablet: 7.0,
          //   ),
          //   child:

          Image.asset(
            'assets/images/Google-Play-Store.png',
            height: getValueForScreenType(
              context: context,
              mobile: 0.12.sh,
              desktop: 0.1.sh,
              tablet: 0.11.sh,
            ),
            // width: 60.w,
            fit: BoxFit.contain,
            alignment: Alignment.bottomLeft,
          ),
          // ),
        ],
      ),
    );
  }
}

//  Image.asset(
//               'assets/images/Google-Play-Store.png',
//               fit: BoxFit.scaleDown,
//               alignment: Alignment.bottomLeft,
//             ),

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.8,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => ProjectCard(
        project: projectList[index],
      ),
    );
  }
}

class Project {
  final String title;
  final String description;

  Project({
    required this.title,
    required this.description,
  });
}
