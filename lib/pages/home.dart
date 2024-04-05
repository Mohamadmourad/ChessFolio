import 'package:chess_folio/components/button.dart';
import 'package:chess_folio/components/reasonBox.dart';
import 'package:chess_folio/methods/localStorage.dart';
import 'package:chess_folio/pages/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key,required this.count,required this.labels});
   final List<String> labels;
   final List<int> count;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void add(int index){
    setState(() {
      widget.count[index]++;
    });
    saveLocal(widget.count);
  }
  void remove(int index){
    setState(() {
      widget.count[index]--;
      if(widget.count[index]< 0){
         widget.count[index] = 0;
      }
    });
    saveLocal(widget.count);
  }

  void reset(){
    setState(() {
      for(int i = 0;i<widget.count.length;i++){
      widget.count[i] = 0;
    }
    });
    saveLocal(widget.count);
  }

  void result(){
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultPage(
      count: widget.count,
      labels: widget.labels,
    ),
  ),
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        title:  Text(
          'ChessFolio',
          style: TextStyle(
            color: Colors.brown[500],
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Btn(lable: "Result",clr: Colors.deepOrange.shade300,action: result),
              Btn(lable: "Reset",clr: Colors.deepOrange.shade200,action: reset),
            ]
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.labels.length,
              itemBuilder: (context, index) {
                return ReasonBox(labels: widget.labels[index],count: widget.count[index],add: () => add(index),remove: () => remove(index));
              },
            ),
          ),
        ],
      ),
    );
  }
}