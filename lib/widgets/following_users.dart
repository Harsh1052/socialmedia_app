import 'package:flutter/material.dart';
import 'package:socialmedia_app/data/data.dart';
import 'package:socialmedia_app/models/user_model.dart';

class FollowingUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Following',
            style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 20.0,
                fontFamily: 'Lobster',
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 80.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                User user = users[index];

                return Container(
                  margin: EdgeInsets.all(5.0),
                  width: 70.0,
                  height: 70.0,
                  child: ClipOval(
                    child: Card(
                      child: Image(
                        image: AssetImage(user.profileImageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
              itemCount: users.length,
            ),
          ),
        )
      ],
    );
  }
}
