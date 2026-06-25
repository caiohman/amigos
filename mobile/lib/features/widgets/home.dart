import 'package:flutter/material.dart';
import 'package:mobile/features/models/friend.dart';
import 'package:mobile/features/widgets/person_card.dart';
import 'package:mobile/features/widgets/search.dart';
import 'package:mobile/core/services/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Friend> _friends = [];
  final Api api = Api();

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    await api.getFriends().then((friend) => _friends.addAll(friend));
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
	      itemCount: _friends.length,
	      itemBuilder: (context, index) {
	        String text = _friends[index].name;
		return  PersonCard(text: text);
	      }
	    ),  
	  ),
        ], 
    );	
  }
} 
