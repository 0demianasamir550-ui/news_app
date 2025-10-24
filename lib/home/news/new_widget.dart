import 'package:flutter/material.dart';
import '../../api/api_manager.dart';
import '../../model/NewsResponse.dart' as news;
import '../../model/SourceResponse.dart' as src;
import '../../utils/app_colors.dart';

class NewWidget extends StatefulWidget {
  final src.Source source;

  const NewWidget({super.key, required this.source});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  late Future<news.NewsResponse> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = ApiManager.getNewsBySourceId(widget.source.id ?? '');
  }

  void _reloadNews() {
    setState(() {
      newsFuture = ApiManager.getNewsBySourceId(widget.source.id ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator( // ✅ سحب لتحديث البيانات
      onRefresh: () async {
        _reloadNews();
        await Future.delayed(const Duration(seconds: 1)); // عشان يظهر الـ animation
      },
      child: FutureBuilder<news.NewsResponse>(
        future: newsFuture,
        builder: (context, AsyncSnapshot<news.NewsResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong',
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _reloadNews,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.data?.status != 'ok') {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data?.message ?? 'Error',
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _reloadNews,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          var newsList = snapshot.data?.articles ?? [];

          if (newsList.isEmpty) {
            return const Center(child: Text('No news available'));
          }

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(), // ✅ ضروري عشان السحب يشتغل حتى لو القائمة قصيرة
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  newsList[index].title ?? '',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            },
          );
        },
      ),
    );
  }
}