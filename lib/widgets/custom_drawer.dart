import 'package:flutter/material.dart';
import 'package:socialmedia_app/data/data.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl),
                width: double.infinity,
                fit: BoxFit.cover,
                height: (MediaQuery.of(context).size.width) * 0.55,
              ),
              Positioned(
                bottom: 0.0,
                child: ClipOval(
                  child: Image(
                    image: AssetImage(currentUser.profileImageUrl),
                    height: 80.0,
                    width: 80.0,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text('Chat'),
                leading: Icon(Icons.chat),
              ),
              ListTile(
                title: Text('Map'),
                leading: Icon(Icons.location_on),
              ),
              ListTile(
                title: Text('Your Profile'),
                leading: Icon(Icons.portrait_rounded),
              ),
              ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
