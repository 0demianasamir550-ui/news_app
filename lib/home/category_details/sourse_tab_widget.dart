import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/widget/source_name.dart';
import 'package:news_app/home/news/new_widget.dart';
import '../../model/SourceResponse.dart' as src;
import '../../utils/app_colors.dart';
 // هنا افترضت إنك عندك widget صغير للتاب

class SourceTabWidget extends StatefulWidget {
  final List<src.Source> sourcesList;
  const SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: Theme.of(context).splashColor,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: widget.sourcesList.map((s) {
              return SourceName(
                source: s,
                isSelected: selectedIndex == widget.sourcesList.indexOf(s),
              );
            }).toList(),
          ),
          Expanded(
            child: NewWidget(source: widget.sourcesList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}