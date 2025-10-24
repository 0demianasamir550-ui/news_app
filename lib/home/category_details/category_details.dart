import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_details/sourse_tab_widget.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ),
          );
        }

        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Something went wrong'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grayColor,
                ),
                onPressed: () {
                  setState(() {
                    ApiManager.getSources();
                  });
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }

        if (snapshot.data?.status != 'ok') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grayColor,
                ),
                onPressed: () {
                  setState(() {
                    ApiManager.getSources();
                  });
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }

        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourcesList);

        return ListView.builder(
          itemCount: sourcesList.length, // ✅ لازم تفضل كده مش itemsCount
          itemBuilder: (context, index) {
            return Text(
              sourcesList[index].name ?? '',
            );
          },
        );
      },
    );
  }
}