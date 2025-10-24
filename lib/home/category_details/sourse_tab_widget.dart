import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/widget/source_name.dart';
import 'package:news_app/home/news/new_widget.dart';
import 'package:news_app/model/SourceResponse.dart' as source;
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  final List<source.Source> sourcesList;
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
            tabAlignment: TabAlignment.start, // ✅ يبدأ من أول الشاشة
            dividerColor: AppColors.transparentColor,
            indicatorColor: Theme.of(context).splashColor,
            isScrollable: true,
            padding: EdgeInsets.zero, // ✅ بدون حواف إضافية
            labelPadding: const EdgeInsets.symmetric(horizontal: 8), // ✅ مسافة بسيطة بين التابات
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