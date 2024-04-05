import 'package:chess_folio/components/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReasonBox extends StatefulWidget {
  const ReasonBox({super.key,required this.labels,required this.add,required this.remove,required this.count});

  final String labels;
  final int count;

  final VoidCallback add;
  final VoidCallback remove;

  @override
  State<ReasonBox> createState() => _ReasonBoxState();
}

class _ReasonBoxState extends State<ReasonBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17,12,17,10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange[100],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: widget.add,
                icon: Icon(Icons.add_circle_outlined,
                color: Colors.deepOrange[300],size: 35,)
                ),

              Column(
                children: [
                  Row(
                    children: [
                      Text(
                    widget.labels,
                    style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 3,),
                  IconsPick(name: widget.labels),
                    ],
                  ),
                 const SizedBox(height: 6,),
                  Text(
                    '${widget.count}',
                    style:const TextStyle(
                      color: Colors.brown,
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),

              IconButton(
                onPressed: widget.remove,
                icon:  Icon(Icons.remove_circle,
                color: Colors.deepOrange[400],size: 35)
                ),
            ],
          ),
        ),
      ),
    );
  }
}