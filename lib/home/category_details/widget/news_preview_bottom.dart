import 'package:flutter/material.dart';
import '../../../model/NewsResponse.dart';
import '../../news/news_webview_screen.dart';

class NewsPreviewBottom extends StatelessWidget {
  final News newsItem;

  const NewsPreviewBottom({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              newsItem.urlToImage ?? 'https://via.placeholder.com/400',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            newsItem.title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            newsItem.description ?? '',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NewsWebViewScreen(url: newsItem.url ?? ''),
                ),
              );
            },
            child: const Text(
              'View Full Article',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}