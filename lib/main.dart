import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> users = [
    {'name': 'Poul', 'image': 'images/poul.jpg', 'info': 'Poul is a software engineer.'},
    {'name': 'Nick', 'image': 'images/nick.jpg', 'info': 'Nick is a graphic designer.'},
    {'name': 'John', 'image': 'images/person2.jpg', 'info': 'John is a content creator.'},
    {'name': 'Jane', 'image': 'images/person1.jpg', 'info': 'Jane is a digital marketer.'},
    {'name': 'Eve', 'image': 'images/person3.jpg', 'info': 'Eve is a data analyst.'},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: users.map((user) {
              return GestureDetector(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text(user['name']!),
                        content: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                user['image']!,
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(user['info']!),
                          ],
                        ),
                        actions: [
                          CupertinoButton(
                            child: Text('Close',
                                style: TextStyle(color: CupertinoColors.destructiveRed)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          user['image']!,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(user['name']!, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
