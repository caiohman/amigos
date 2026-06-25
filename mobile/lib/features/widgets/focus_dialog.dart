import 'package:flutter/material.dart';

class FocusDialog extends StatefulWidget {
  const FocusDialog({super.key});

  @override
  State<FocusDialog> createState() => _FocusDialogState();
}

class _FocusDialogState extends State<FocusDialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Row(
        mainAxisSize: MainAxisSize.min,
	spacing: 20.0,
        children: <Widget> [
	  Image.asset(
	    "images/caio_ohman.jpeg",
	    width: 100.0,
	    height: 100.0,
	    fit: BoxFit.fill),
	  Text("Me"),
	], 
      ),	
    );
  }
}
