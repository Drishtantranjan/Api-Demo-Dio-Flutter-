import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String? videoUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.videoUrl,
  });
}

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<NewsArticle> articles = [];

  get requestData => null;

  @override
  void initState() {
    super.initState();
    fetchNewsArticles();
  }

  Future<void> fetchNewsArticles() async {
    final Dio dio = Dio();
    try {
      final response = await dio.post(
        'http://qgo.electreps.com:8080/go/json/fetch/nodes.json',
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        if (data.containsKey('result')) {
          final List<dynamic> articlesData = data['result'];
          final List<NewsArticle> fetchedArticles =
              articlesData.map((articleData) {
            String title = articleData['title'] ?? '';
            String description = articleData['bodyValueOriginal'][0] ??
                ''; // Update this line to access the correct field.
            String imageUrl = articleData['imageUrl'] ?? '';
            String? videoUrl = articleData['videoUrl']
                [0]; // Update this line to access the correct field.

            return NewsArticle(
              title: title,
              description: description,
              imageUrl: imageUrl,
              videoUrl: videoUrl,
            );
          }).toList();

          setState(() {
            articles = fetchedArticles;
            print(articlesData);
          });
        } else {
          setState(() {
            articles = [];
          });
        }
      } else {
        throw Exception('Failed to load news articles');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsCard(article: articles[index]);
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          if (article.videoUrl != null)
            VideoPlayerWidget(videoUrl: article.videoUrl!),
          if (article.videoUrl == null) Image.network(article.imageUrl),
          ListTile(
            title: Text(article.title),
            subtitle: Text(article.description),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: NewsListScreen(),
  ));
}
