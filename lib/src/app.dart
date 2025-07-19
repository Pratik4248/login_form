import 'package:flutter/material.dart';
import '../src/screens/login_screen.dart';


class App extends StatefulWidget{
  @override
    createState(){
    return Login();
    }
  }

class Login extends State<App>{
  @override
  Widget build(context){
       return MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
           appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 99, 123, 180),
       centerTitle: true,
      title: Text(
  ' Login Form ',
  style: TextStyle(
    fontSize: 24,         // Size of the text
    fontWeight: FontWeight.bold, // Bold text
    color: Colors.black,   // Text color
    fontStyle: FontStyle.italic, // Italic text
  ),
)
    ),
        ),
       );
  }
}