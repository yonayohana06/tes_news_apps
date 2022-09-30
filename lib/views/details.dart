import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final String author, imgUrl, title, desc, content, date;

  // ignore: use_key_in_widget_constructors
  const ArticlePage(
    {
      required this.author,
      required this.imgUrl, 
      required this.title, 
      required this.desc, 
      required this.content, 
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Berita"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            height: 150.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: 
              Text(title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(date)
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text("Author : "),
              ),
              Text(author,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),
          Column(
            children: [ 
              Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Text(desc,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
