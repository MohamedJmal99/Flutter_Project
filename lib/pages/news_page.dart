import 'package:flutter/material.dart';
import 'package:web_services_v2/models/articles.dart';
import 'package:web_services_v2/pages/News_details.dart';
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
      body: ListView(
        children: articles?.articles
                .map((article) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(article.publishedAt.toIso8601String()),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade300,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        showDialog(context: context, builder: (context) {
                                          return AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                    onTap:(){
                                                      Navigator.of(context).pop();
                                            },
                                                    child: Align(alignment: Alignment.topRight,
                                                    child: Icon(Icons.close),
                                                    ),
                                                ),
                                                Image.network(article.urlToImage),
                                              ],
                                            ),
                                          );
                                        },)  ;
                                    },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          article.urlToImage,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      article.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            article.description,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        Expanded(child: Text(article.content)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                              return NewsDetails();
                                            },),);
                                          },
                                          child: Text('Read more',style: TextStyle(
                                            color: Colors.blue
                                          ),),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ))
                .toList() ??
            [],
      ),
    );
  }
}
