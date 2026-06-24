import 'package:flutter/material.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  final preferredSize = const Size.fromHeight(80.0);
  
  @override
  State<NavBar> createState() => _NavBarState();
}


class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
	  return IconButton(
	    icon: const Icon(Icons.menu),
	    onPressed: () {},
	  );
	}	
      ),
      centerTitle: true,
      title: Row(
	mainAxisSize: MainAxisSize.min,
	children: [
	   Text(
            "a m i", 
	    style: TextStyle(
	      color: Colors.white,
	      fontSize: 13.0,
	    )
          ),
          Icon(Icons.accessibility),
          Text(
            " g o s", 
	    style: TextStyle(
	      color: Colors.white,
	      fontSize: 13.0,
	    )
          ),
	],
      ),
      actions: <Widget>[
        IconButton(
	  icon: const Icon(Icons.notifications_rounded),
	  onPressed: () {},
	),	
      ],
      backgroundColor: Colors.blue,
    );	
  }
}
