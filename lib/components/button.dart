import 'package:buttons_flutter/buttons_flutter.dart';
import 'package:flutter/material.dart';

class Btn extends StatefulWidget {
  const Btn({super.key,required this.lable,required this.clr,required this.action});

  final String lable;
  final Color clr;
  final VoidCallback action;

  @override
  State<Btn> createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Button(
              borderRadius: 10,
              bgColor: widget.clr,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              onPressed: widget.action,
              child: Text(
                widget.lable,
                style: TextStyle(
                  color: Colors.brown[600],
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
    );
  }
}