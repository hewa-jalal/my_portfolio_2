import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ST extends StatefulWidget {
  const ST({Key? key}) : super(key: key);

  @override
  _STState createState() => _STState();
}

class _STState extends State<ST> {
  final AutoScrollController controller = AutoScrollController();

  late List<Widget> items;

  int _currentFocusedIndex = 0;

  @override
  void initState() {
    items = List.generate(
      33,
      (index) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          color: index.isEven ? Colors.deepOrange : Colors.deepPurple,
          child: Text(index.toString()),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          IconButton(
            onPressed: () {
              _currentFocusedIndex--;
              if (_currentFocusedIndex < 0) {
                _currentFocusedIndex = items.length - 1;
              }

              controller.scrollToIndex(_currentFocusedIndex,
                  preferPosition: AutoScrollPosition.begin);

              setState(() {});
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: items,
            ),
          ),
          IconButton(
            onPressed: () {
              _currentFocusedIndex++;
              if (_currentFocusedIndex > items.length) {
                _currentFocusedIndex = 0;
              }
              controller.scrollToIndex(_currentFocusedIndex,
                  preferPosition: AutoScrollPosition.begin);
              setState(() {});
            },
            icon: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        ],
      ),
    );
  }
}
