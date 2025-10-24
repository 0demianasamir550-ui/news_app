import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';


class SourceName extends StatelessWidget {
final Source source; // 2 usages
final bool isSelected; // 2 usages
const SourceName({super.key,
required this.source,required this.isSelected
});

@override
Widget build(BuildContext context) {
return Text( source.name??'',
style: isSelected?
Theme.of(context).textTheme.labelLarge:
Theme.of(context).textTheme.labelMedium
);
}
}