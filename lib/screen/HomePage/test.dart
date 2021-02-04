import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Home Page', style: TextStyle(fontSize: 50.0),),),);
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('My Progess',style: TextStyle(fontSize: 50.0),),),);
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('School',style: TextStyle(fontSize: 50.0),),),);
  }
}