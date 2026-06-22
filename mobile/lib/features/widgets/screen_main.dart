import 'package:flutter/material.dart';
import 'package:mobile/features/widgets/navbar.dart';
import 'package:mobile/core/services/api.dart';
import 'package:mobile/features/models/person.dart';
import 'package:mobile/features/widgets/person_card.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {

  final Api api = Api();
  List<Person> people = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(
	  child: ListView.builder(
	    itemCount: people.length,
	    itemBuilder: (context, index) {
	      String text = people[index].name;
	      return  PersonCard(text: text);
	    }
	  ),  
	), ElevatedButton(
	  child: Text("Load", style: TextStyle(color: Colors.white)),
	  onPressed: () async {
	    await api.getPerson().then(
	      (person) => people.addAll(person)
	    );
	    setState(() {});
	  }
	),	
	]
      ) 
    );
  }
}
