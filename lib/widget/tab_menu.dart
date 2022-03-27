import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/articeles.dart';
import '../service/data_service.dart';
import 'news_item.dart';

class TabMenu extends StatefulWidget {
  final List<Article> article;

  TabMenu(this.article);


  @override
  _TabBarMenuState createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabMenu> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  final  List<Tab> myTabs = <Tab> [
    const Tab(
      text: 'Business',
    ),
    const Tab(
      text: 'Entertainment',
    ),
    const Tab(
      text: 'General',
    ),
    const Tab(
      text: 'Health',
    ),
    const Tab(
      text: 'Science',
    ),
    const Tab(
      text: 'Sports',
    ),
    const Tab(
      text: 'Technology',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
              controller: _tabController,
              labelColor: Colors.deepOrangeAccent,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator:  const BubbleTabIndicator(
                  indicatorHeight: 30.0,
                  indicatorColor: Colors.black,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab
              ),
              isScrollable: true,
              tabs: myTabs
          ),
          SizedBox(height: 10,),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children:  myTabs.map((Tab tab) {
                    return FutureBuilder(
                        future: news.getNewsByCategory(tab.text.toString()),
                        builder: (context, snapshot ) => snapshot.data != null
                            ? _listNewsCategory(snapshot.data as List<Article>)
                            : const Center(child:  CircularProgressIndicator())
                    );
                  }).toList()
              ))
        ],
      ),
    );
  }

  Widget _listNewsCategory(List<Article> articles){
    return Container(
        height:  MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
        child: ListView.builder(
          itemBuilder: (context, index) => NewsItem(articles[index]),
          itemCount: articles.length,

        )
    );
  }
}
