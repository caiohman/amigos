import 'package:flutter/material.dart';
import 'package:mobile/features/models/friend.dart';
import 'package:mobile/features/widgets/event_card.dart';
import 'package:mobile/features/widgets/search.dart';
import 'package:mobile/core/services/api.dart';

class Events extends StatefulWidget {

  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

  final List<Friend> _events = [];
  final Api api = Api();

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    await api.getEvents().then((event) => _events.addAll(event));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
	  Container(
	   child: Center(child: Search()),	
	  ),
	  Expanded(
	    child: ListView.builder(
	      itemCount: _events.length,
	      itemBuilder: (context, index) {
	        Friend event = _events[index];
	        return  EventCard(event: event);
	      }
	    ),  
	  ),
        ], 
    );	
  }
} 
