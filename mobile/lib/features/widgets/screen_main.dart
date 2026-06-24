import 'package:flutter/material.dart';
import 'package:mobile/features/widgets/navbar.dart';
import 'package:mobile/core/services/api.dart';
import 'package:mobile/features/models/friend.dart';
import 'package:mobile/features/widgets/person_card.dart';
import 'package:mobile/features/widgets/search.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {

  final Api api = Api();
  List<Friend> friends = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
	  Container(
	   child: Center(child: Search()),	
	  ),
	  Expanded(
	    child: ListView.builder(
	      itemCount: friends.length,
	      itemBuilder: (context, index) {
	        String text = friends[index].name;
	        return  PersonCard(text: text);
	      }
	    ),  
	  ),
	  ]
        ),
	floatingActionButton: FloatingActionButton(
	  child: Text("Load", style: TextStyle(color: Colors.white)),
	    onPressed: () async {
	      await api.getPerson().then(
	        (friend) => friends.addAll(friend)
	      );
	      setState(() {});
	    }
	)
      );
    }
}
