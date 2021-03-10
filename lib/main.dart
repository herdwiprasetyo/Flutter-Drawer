import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}


class Home extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.yellow),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State <SplashScreen>{
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),
            ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage())));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/cake.jpg"),
                        radius: 60,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "My Apliication System",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                     padding: EdgeInsets.only(top: 20),
                      child: Text('Welcome to my Application',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}