import 'package:flutter/material.dart'; 
import 'package:mobile/features/models/friend.dart';

class EventCard extends StatefulWidget {
  final Friend event;

  const EventCard({super.key, required this.event}); 

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late Friend _event;

  @override
  void initState() {
    super.initState();
    _event = widget.event;
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
	          Text(_event.name),
		  Row(
		    spacing: 10.0,
		    children: <Widget>[
		      Icon(Icons.cake, size: 12), // TODO: create a rule to change icon (birthday or other event)
		      Text("${DateTime.parse(_event.birth).day} / ${DateTime.parse(_event.birth).month}",
		      style: TextStyle(fontSize: 11)),
		  ])
	        ]),
	    ]),
	),
      ),
    );
  }

}

