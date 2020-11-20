import 'package:flutter/material.dart';
import 'package:socialmedia_app/data/data.dart';
import 'package:socialmedia_app/models/post_model.dart';

class PostWidget extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> post;

  _buildPageList(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400.0,
            child: child,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6.0,
                    color: Colors.black26,
                    offset: Offset(0, 2),
                  )
                ]),
            child: ClipRect(
              child: Image(
                height: 350.0,
                width: 300,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
                color: Colors.white54,
              ),
              height: 100.0,
              child: Padding(
                padding: EdgeInsets.only(left: 5.0, top: 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(post.location),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Text(post.likes.toString())
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              color: Colors.blue,
                            ),
                            Text(post.comments.toString())
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  PostWidget({this.pageController, this.post, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Lobster',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          child: PageView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildPageList(context, index);
            },
            controller: pageController,
            itemCount: post.length,
          ),
        ),
      ],
    );
  }
}
