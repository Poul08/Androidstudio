import 'package:flutter/cupertino.dart';

void main(){
  runApp(

      CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),)
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();
  String ans = "";

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text('Calculator'),
            trailing: CupertinoButton(child: Icon(CupertinoIcons.settings, size: 20,), onPressed: (){

              showCupertinoDialog(context: context, builder: (context){
                return CupertinoAlertDialog(
                  title: Text('List of Members'),
                  content: Column(
                    children: [
                      ClipOval(child: Image.asset('images/poul.jpg', height: 50,)),
                      Text('Poul Justin Maninang'),
                      ClipOval(child: Image.asset('images/poul.jpg', height: 50,)),
                      Text('Nick Dela Cruz')
                    ],
                  ),
                  actions: [
                    CupertinoButton(child: Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed ),), onPressed: (){
                      Navigator.pop(context);
                    })
                  ],
                );
              });


            })
        ),


        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 100,),
                SizedBox(height: 40,),
                CupertinoTextField(
                  controller: _num1,
                ),
                SizedBox(height: 10,),
                CupertinoTextField(
                  controller: _num2,
                ),
                CupertinoButton(child: Text('Calculate'), onPressed: (){
                  setState(() {
                    double n1 = double.parse(_num1.text);
                    double n2 = double.parse(_num2.text);
                    double answer = n1 + n2;
                    ans = answer.toString();
                    print(ans);
                  });


                }),

                Text("$ans"),

              ],
            ),
          ),
        ));
  }
}
