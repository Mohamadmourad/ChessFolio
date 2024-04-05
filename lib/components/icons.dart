import 'package:flutter/material.dart';

class IconsPick extends StatelessWidget {
  const IconsPick({super.key,required this.name});
  final String name;

  IconData getIcon(){
    if(name == 'vision'){
      return Icons.remove_red_eye_sharp;
    }
    else if(name == 'time'){
      return Icons.timelapse;
    }
    else if(name == 'tactic'){
      return Icons.ads_click;
    }
    else if(name == 'strategy'){
      return Icons.account_tree_outlined;
    }
    else if(name == 'endgame'){
      return Icons.add_moderator;
    }
    else{
      return Icons.airline_stops;
    }
      
  }
  
  @override
  Widget build(BuildContext context) {
    return  Icon(
      getIcon(),
      color: Colors.brown,
    );
  }
}