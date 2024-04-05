import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({super.key,required this.count,required this.labels});
   final List<String> labels;
   final List<int> count;
        
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  double percentageCalculate(int num){
    if(num == 0)return 0;
    double total = 0;

    for(int i =0;i<widget.count.length;i++){
      total += widget.count[i].toDouble();
    }
    return (num.toDouble()/total*100);
  }

  void toPrecentage(){
    for(int i = 0;i<widget.count.length;i++){
      dataMap[widget.labels[i]] = percentageCalculate(widget.count[i]);
    }
  }

  Map<String, double> dataMap = {};

   @override
  void initState(){
    super.initState();
    toPrecentage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.brown),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PieChart(dataMap: dataMap),
          ),
        ],
      ),
    );
  }
}