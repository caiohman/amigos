import 'package:flutter/material.dart';

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _Social();
}

class _Social extends State<Social> {
  
  @override
  Widget build(BuildContext context) {
    return Row( 
      spacing: 5.0,
      children: 
        [
	  Icon(Icons.phone, color: Colors.green, size: 14.0,),
	  Icon(Icons.camera_alt_outlined, color: Colors.purple, size: 14.0,),
        ]
    );	
  }
}
