import 'package:flutter/material.dart';
import 'package:web_services_v2/models/article.dart';

class TextDetails extends StatefulWidget {
  final String title;
  final String content;

  const TextDetails({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  State<TextDetails> createState() => _TextDetailsState();
}

class _TextDetailsState extends State<TextDetails> {
  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isOpened = !isOpened;
                });
              },
              icon: Icon(isOpened ? Icons.arrow_circle_down : Icons.arrow_circle_up),
            ),
          ],
        ),
        if (isOpened)
          Text(widget.content),

        SizedBox(height: 16),
      ],
    );
  }
}
