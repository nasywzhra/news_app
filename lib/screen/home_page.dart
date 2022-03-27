import 'package:flutter/material.dart';
import 'package:newsapp/model/articeles.dart';
import 'package:newsapp/service/data_service.dart';
import 'package:newsapp/utils/utils.dart';

import 'news_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image:const DecorationImage(
              image: NetworkImage(
                  'https://pin.it/5HieL0O'
              ))
            ),
            width: 10,
            margin: EdgeInsets.all(5),
            ),
          title: Text('Good Morning', style: titleArticle.copyWith(
           fontSize: 20
    ),),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark , color: Colors.purpleAccent,)
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          ),
      body: FutureBuilder(
        builder: (context , snapshot) => snapshot.data != null
    ? NewsPage(snapshot.data as List<Article>)
    :const Center(child: CircularProgressIndicator())
      )
      );
  }
}
