import 'package:flutter/material.dart';
import 'package:web_services_v2/models/article.dart';
import 'package:web_services_v2/models/articles.dart';
import 'package:web_services_v2/pages/News_details.dart';
import 'package:web_services_v2/pages/widgets/article_widget.dart';
import 'package:web_services_v2/services/news_services.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  NewsService newsService = NewsService();
  Articles? articles;

  @override
  void initState() {
    // TODO: implement initState
    newsService.getAll().then((value) {
      setState(() {
        articles = value;
      });
      print("Data Loaded");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build UI");
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
      ),
      body: articles==null ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: articles!.articles.length,
        itemBuilder: (context, index) {
        Article article = articles!.articles[index];
        return ArticleWidget(article: article);
      },),
    );
  }
}
