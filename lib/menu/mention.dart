import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MentionLegales extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  	return MentionLegalesState();
  }
}

class MentionLegalesState extends State<MentionLegales>{
	bool chargementFait = false;
	String mentionText = "Chargement...";
  @override
  Widget build(BuildContext context) {
  	chargement();
    return Padding(padding: EdgeInsets.all(20), child: Text(mentionText));
  }

  Future<void> chargement() async
  {
  	if(chargementFait){
  		return;
	}
  	chargementFait = true;
	  String s = await rootBundle.loadString("assets/mentions.txt");
  	setState(() {
  		mentionText = s;
  	});
  }
}