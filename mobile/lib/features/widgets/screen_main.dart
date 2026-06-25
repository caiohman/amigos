import 'package:flutter/material.dart';
import 'package:mobile/features/widgets/navbar.dart';
import 'package:mobile/features/widgets/home.dart';
import 'package:mobile/features/widgets/events.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: NavBar(),
        body: TabBarView(
	  children: <Widget>[
	    Home(),
	    Events(),
	  ]
        ), 
      ),
    );
  }
}
