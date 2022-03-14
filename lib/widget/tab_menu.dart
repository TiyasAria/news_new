import 'package:flutter/material.dart';
import 'package:news_new/model/article.dart';

import 'news_item.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> article;

  TabBarMenu(this.article);


  @override
  _TabBarMenuState createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 7, vsync: this);
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

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.deepOrangeAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              labelColor: Colors.deepOrangeAccent,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: 'Business',
                ),
                Tab(
                  text: 'Entertainment',
                ),
                Tab(
                  text: 'General',
                ),
                Tab(
                  text: 'Health',
                ),
                Tab(
                  text: 'Science',
                ),
                Tab(
                  text: 'Sports',
                ),
                Tab(
                  text: 'Technology',
                ),
              ]),
          SizedBox(height: 10,),
          Expanded(
              child: TabBarView(controller: _tabController, children:  [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      itemCount: widget.article.length,
                      reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return NewsItem(
                            article : widget.article[index]);
                      }),
                ),
                Center(
                  child: Text(
                    'Entertainment',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'General',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Health',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Science',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Sports',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Technology',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
