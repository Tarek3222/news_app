import 'package:flutter/material.dart';
import 'package:news_app/views/log_in_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/photo_2024-03-02_23-31-24.jpg'),
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Hello, Tarek', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home Page'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
          ListTile  (
          leading: const Icon(Icons.brightness_2) ,
          title:const  Text('Dark Mode'),
          trailing: Switch(
            activeColor: Colors.orange,
            activeTrackColor: Colors.orangeAccent[50],
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[300],
            value: true,
             onChanged: (bool value){},
             ),
        ),
        ListTile(
          leading:const Icon(Icons.help),
          title: const Text('About us'),
          onTap: () {},
        ),
        ListTile(
          leading:const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
         ListTile(
          leading:const Icon(Icons.exit_to_app),
          title: const Text('SignOut'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LogInView();
            }));
          },
        ),
      ],
    );
  }
}