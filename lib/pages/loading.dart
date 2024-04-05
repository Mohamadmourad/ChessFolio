import 'package:chess_folio/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:chess_folio/methods/localStorage.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<String> names = ['vision','time','tactic','strategy','endgame','opening'];
     @override
    void initState() {
    super.initState();
     loadFromStorage().then((list) {
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(labels: names,count: list != null ? list:[0,0,0,0,0,0])
          )
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
    body: Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: Colors.deepOrange.shade200,
        size: 100,
      ),
    ),);
  }
}