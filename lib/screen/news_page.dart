import 'package:flutter/material.dart';
import 'package:newsapp/model/articeles.dart';
import 'package:newsapp/utils/utils.dart';
import 'package:newsapp/widget/carousel_widget.dart';
import 'package:newsapp/widget/tab_menu.dart';

class NewsPage extends StatelessWidget {
 final List<Article> article ;
 NewsPage(this.article);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10),
          child: Text('Breaking News', style: titleHome,)),
          CarouselWidget(article),
          TabMenu(article)
        ],
      ),
    );
  }
}
