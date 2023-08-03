import 'package:flutter/material.dart';
import 'package:my_map/backend/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyNews",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Top Headlines",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    String title = news[index]['title'];
                    return Text(title);
                  },
                )
        ],
      ),
    );
  }
}
