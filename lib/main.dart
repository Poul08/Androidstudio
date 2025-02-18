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
    {'name': 'Poul', 'image': 'images/poul.jpg', 'email': 'pouljustinmaninang@gmail.com', 'birthday': 'May 8, 2001', 'contact': '123-456-7890', 'address': 'San luis Pampanga.', 'age': '23'},
    {'name': 'Nick', 'image': 'images/nick.jpg', 'email': 'nickrghedelacruz@gmail.com', 'birthday': 'June 20, 1990', 'contact': '234-567-8901', 'address': 'Candaba, Pampanga', 'age': '34'},
    {'name': 'Irish', 'image': 'images/person2.jpg', 'email': 'irishjaneeemagat@gmail.com', 'birthday': 'July 7, 1998', 'contact': '345-678-9012', 'address': 'Candaba, Pampanga', 'age': '26'},
    {'name': 'Janella', 'image': 'images/person1.jpg', 'email': 'janellapangilinan@gmail.com', 'birthday': 'May 27, 1995', 'contact': '456-789-0123', 'address': 'Candaba, Pampanga', 'age': '29'},
    {'name': 'Aira', 'image': 'images/person3.jpg', 'email': 'airamaemagat@gmail.com', 'birthday': 'March 4, 1995', 'contact': '567-890-1234', 'address': 'Candaba, Pampanga', 'age': '29'},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.group, size: 24),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('List of Members'),
                  content: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: users.map((user) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(50), // Circular border
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    user['image']!,
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(user['name']!, style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  actions: [
                    CupertinoButton(
                      child: Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
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
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  user['image']!,
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Email: ${user['email']}'),
                            Text('Birthday: ${user['birthday']}'),
                            Text('Age: ${user['age']}'),
                            Text('Contact: ${user['contact']}'),
                            Text('Address: ${user['address']}'),
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            user['image']!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(user['name']!, style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      Text(user['email']!, style: TextStyle(fontSize: 12)),
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
