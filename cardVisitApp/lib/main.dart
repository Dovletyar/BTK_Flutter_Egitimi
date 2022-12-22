import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50,
                backgroundImage: AssetImage('assets/devlet.jpg'),
              ),
              Text('Dovletyar Sultanov',
              style: TextStyle(
                letterSpacing: 0.3,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
              ),
              Text('Software Developer',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.white60
              ),
              ),

              SizedBox(
                child: Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                height: 10,
                width: 270,
              ),

              Card(
                margin: EdgeInsets.fromLTRB(15, 40, 15, 10),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                    size: 40,
                  ),
                  title: Text(
                    '+90 552 251 77 94',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                    size: 40,
                  ),
                  title: Text(
                    'dovletyar4@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}





//
// Icon(
// Icons.phone,
// color: Colors.teal,
// size: 40,
// ),
//
//
// Text(
// '+90 552 251 77 94',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.normal,
// color: Colors.teal.shade900,
// ),
// ),