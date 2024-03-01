import 'package:flutter/material.dart';
import 'package:web_services_v2/pages/widgets/text_details.dart';

import '../models/article.dart';

class NewsDetails extends StatelessWidget {
  final Article article;
  const NewsDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Image.network(article.urlToImage),
          Text(article.title,style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
          ),
          SizedBox(
            height: 16,
          ),
          TextDetails(title: "Description : ", content: article.content,),

          Text("Content :",style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
          ),
          Text(article.content),
        ],
      ),
    );
  }
}
