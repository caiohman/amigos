import 'package:http/http.dart' as http;
import 'package:mobile/features/models/friend.dart';
import 'dart:convert';

class Api {

  Future<List<Friend>> getPerson() async {
    try{
      
      final uri = Uri( scheme: 'http', host: '192.168.0.71', port: 8081, path: '/',);
      final response = await http.get(uri);
      if (response.statusCode != 200) { throw Exception("Failed"); }
      else { 
        List<dynamic> items = jsonDecode(response.body);
	List<Friend> friends = items.map(
	  (items) => Friend.fromJson(items)
	).toList();
	return friends;
      }
    } catch(err) { rethrow; }
  }
}

