import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget{
  const NavBar({super.key});

  @override
  final preferredSize = const Size.fromHeight(80.0);

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
      backgroundColor: Colors.blue,
    );	
  }
}
