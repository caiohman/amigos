import 'package:flutter/material.dart'; 
import 'package:mobile/features/widgets/social.dart';

class PersonCard extends StatefulWidget {
  final String text;

  const PersonCard({super.key, required this.text}); 

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  late String _text;

  @override
  void initState() {
    super.initState();
    _text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () { setState(() {
	  });
	},
        child: Padding (
	  padding: const EdgeInsets.all(16.0),
	  child: Row(
	    spacing: 10.0,
	    children: [ 
	      Icon(Icons.account_circle_rounded),		
	      Column(
	        crossAxisAlignment: CrossAxisAlignment.start,
	        mainAxisSize: MainAxisSize.min,
	        children:[
	          Text(_text),
		  Social(),      
	        ]),
	    ]),
	),
      ),
    );
  }
}



