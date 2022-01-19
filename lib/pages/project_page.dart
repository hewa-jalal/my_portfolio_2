import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_2/utils/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  Project(title: 'Fruits vs Vegetables 4', description: 'description'),
  Project(title: 'Fruits vs Vegetables 5', description: 'description'),
  Project(title: 'Fruits vs Vegetables 6', description: 'description'),

  // ProjectCard2(imageAsset: 'assets/images/fruits_vs_vegetables_logo_nobg.png'),
  // ProjectCard2(imageAsset: 'assets/images/islam_time_logo.png'),
];

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final controller = ScrollController();
  final _scrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  var globalIndex = 0;
  var _isEndOfList = false;
  var _isStartOfList = false;

  var testList = [
    Container(
      width: 0.3.sw,
      color: Colors.red,
    ),
    Container(
      width: 0.3.sw,
      color: Colors.yellow,
    ),
    Container(
      width: 0.3.sw,
      color: Colors.green,
    ),
    Container(
      width: 0.3.sw,
      color: Colors.blue,
    ),
  ];

  final _autoScrollController = AutoScrollController();
  int _currentFocusedIndex = 0;
  // late List<Widget> items;

  // @override
  // void initState() {
  //   super.initState();
  //   _autoScrollcontroller = AutoScrollController(
  //     viewportBoundaryGetter: () =>
  //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
  //     axis: Axis.horizontal,
  //   );
  // }

  @override
  void initState() {
    super.initState();

    // items = List.generate(
    //   33,
    //   (index) => AutoScrollTag(
    //     key: ValueKey(index),
    //     controller: controller,
    //     index: index,
    //     child: Container(
    //       height: 100,
    //       width: 100,
    //       alignment: Alignment.center,
    //       color: index.isEven ? Colors.deepOrange : Colors.deepPurple,
    //       child: Text(index.toString()),
    //     ),
    //   ),
    // );
  }

  Future _scrollToIndex() async {
    await _autoScrollController.scrollToIndex(4,
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  Widget build(BuildContext context) {
    print('projectList.length ==>' + projectList.length.toString());
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Headline',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: Row(
              children: [
                TextButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: _isStartOfList
                      ? null
                      : () {
                          setState(() {
                            _isEndOfList = false;
                          });

                          print(
                              '_currentFocusedIndex => $_currentFocusedIndex');
                          _currentFocusedIndex--;
                          print(
                              '_currentFocusedIndex-- => $_currentFocusedIndex');

                          if (_currentFocusedIndex < 0) {
                            setState(() {
                              _isStartOfList = true;
                            });
                            // _currentFocusedIndex = projectList.length - 1;
                          }

                          _autoScrollController.scrollToIndex(
                              _currentFocusedIndex,
                              preferPosition: AutoScrollPosition.begin);

                          setState(() {});
                        },
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (c, i) => SizedBox(width: 6),
                    controller: _autoScrollController,

                    // itemPositionsListener: itemPositionsListener,
                    // itemScrollController: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: projectList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AutoScrollTag(
                        key: ValueKey(index),
                        controller: _autoScrollController,
                        index: index,
                        child: Card(
                          child: ProjectCard(
                            project: projectList[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: _isEndOfList
                      ? null
                      : () {
                          setState(() {
                            _isStartOfList = false;
                          });

                          print(
                              '_currentFocusedIndex => $_currentFocusedIndex');
                          _currentFocusedIndex++;
                          print(
                              '_currentFocusedIndex++ => $_currentFocusedIndex');

                          if (_currentFocusedIndex >= projectList.length) {
                            // _currentFocusedIndex = projectList.length;
                            // setState(() {
                            //   _isEndOfList = true;
                            // });

                            _currentFocusedIndex = -1;
                            // _autoScrollController.scrollToIndex(
                            //   _currentFocusedIndex,
                            //   preferPosition: AutoScrollPosition.begin,
                            //   duration: Duration(seconds: 2),
                            // );
                          } else {
                            _autoScrollController.scrollToIndex(
                              _currentFocusedIndex,
                              preferPosition: AutoScrollPosition.begin,
                            );
                          }
                          setState(() {});
                        },
                ),
              ],
            ),
          ),
          // ElevatedButton(
          //   child: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     print(controller.offset + 1);
          //     controller.animateTo(
          //       controller.offset + 0.5.sw,
          //       duration: Duration(seconds: 2),
          //       curve: Curves.fastOutSlowIn,
          //     );
          //   },
          // ),
          Text(
            'Demo Headline 2',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx, int) {
                      return Card(
                        child: ListTile(
                            title: Text('Motivation $int'),
                            subtitle: Text(
                                'this is a description of the motivation')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
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
      width: getValueForScreenType(
        context: context,
        mobile: 0.8.sw,
        tablet: 0.43.sw,
        desktop: 0.3.sw,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          // ),
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
              mobile: 0.1.sh,
              desktop: 0.1.sh,
              tablet: 0.09.sh,
            ),
            fit: BoxFit.contain,
            alignment: Alignment.bottomLeft,
          ),
          // ),
        ],
      ),
    );
  }
}

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
