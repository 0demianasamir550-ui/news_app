

import 'package:flutter/material.dart';
  import 'package:news_app/home/news/news_webview_screen.dart';
  import '../../api/api_manager.dart';
  import '../../model/NewsResponse.dart' as news;
  import '../../model/SourceResponse.dart' as src;
  import '../../home/news/news_item.dart';

  class NewWidget extends StatefulWidget {
  final src.Source source;

  const NewWidget({super.key, required this.source});

  @override
  State<NewWidget> createState() => _NewWidgetState();
  }

  class _NewWidgetState extends State<NewWidget> {
  late double height;
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

  void _showNewsPreview(news.News newsItem) {
  showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (_) {
  return DraggableScrollableSheet(
  initialChildSize: 0.5,
  minChildSize: 0.3,
  maxChildSize: 0.9,
  builder: (context, scrollController) {
  return Container(
  decoration: const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  child: ListView(
  controller: scrollController,
  children: [
  if (newsItem.urlToImage != null)
  Image.network(newsItem.urlToImage!, fit: BoxFit.cover),
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text(
  newsItem.title ?? '',
  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  ),
  ),
  if (newsItem.description != null)
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text(newsItem.description!),
  ),
  const SizedBox(height: 10),
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
  onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) => NewsWebViewScreen(url: newsItem.url ?? ''),
  ),
  );
  },
  child: const Text('View Full Article'),
  ),
  ),
  ],
  ),
  );
  },
  );
  },
  );
  }

  @override
  Widget build(BuildContext context) {
  height = MediaQuery.of(context).size.height;

  return RefreshIndicator(
  onRefresh: () async {
  _reloadNews();
  await Future.delayed(const Duration(seconds: 1));
  },
  child: FutureBuilder<news.NewsResponse>(
  future: newsFuture,
  builder: (context, AsyncSnapshot<news.NewsResponse> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  return const Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError) {
  return Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  const Text('Something went wrong'),
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
  Text(snapshot.data?.message ?? 'Error'),
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

  return ListView.separated(
  physics: const AlwaysScrollableScrollPhysics(),
  padding: EdgeInsets.only(top: height * 0.02),
  itemBuilder: (context, index) {
  final newsItem = newsList[index];
  return GestureDetector(
  onTap: () => _showNewsPreview(newsItem),
  child: NewsItem(news: newsItem), // عرض الخبر بشكل أصلي
  );
  },
  separatorBuilder: (context, index) => SizedBox(height: height * 0.02),
  itemCount: newsList.length,
  );
  },
  ),
  );
  }
  }