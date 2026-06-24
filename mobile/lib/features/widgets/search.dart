import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
       shrinkWrap: true,
       isFullScreen: false,
       viewConstraints: BoxConstraints(maxWidth: 300.0, minWidth: 200.0, maxHeight: 200.0, minHeight: 100.0),
       builder: (BuildContext context, SearchController controller) {
         return IconButton(
	   icon: Icon(Icons.search),
	   onPressed: () { controller.openView(); },
	 );	 
       },
       suggestionsBuilder: (BuildContext context, SearchController controller){
         final query = controller.value.text.trim();
	 if (query == '') {print("nothing to show");}
	 return [];
       },
    );  
  }
}
