import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/data/data.dart';
import 'package:socialmedia_app/widgets/custom_drawer.dart';
import 'package:socialmedia_app/widgets/following_users.dart';
import 'package:socialmedia_app/widgets/post_wigest.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;

  PageController pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [Text('Trending'), Text('Following')],
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Instagram             ',
            style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Lobster',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        leading: Icon(Icons.menu),
      ),
      drawer: CustomDrawer(),
      body: ListView(children: [
        FollowingUser(),
        PostWidget(
          pageController: pageController,
          title: 'Posts',
          post: posts,
        )
      ]),
    );
  }
}
