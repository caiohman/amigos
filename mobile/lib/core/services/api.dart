import 'package:http/http.dart' as http;
import 'package:mobile/features/models/person.dart';
import 'dart:convert';

class Api {

  Future<List<Person>> getPerson() async {
    try{
      
      final uri = Uri( scheme: 'http', host: '192.168.0.71', port: 8081, path: '/',);
      final response = await http.get(uri);
      if (response.statusCode != 200) { throw Exception("Failed"); }
      else { 
        List<dynamic> items = jsonDecode(response.body);
	List<Person> people = items.map(
	  (items) => Person.fromJson(items)
	).toList();
	return people;
      }
    } catch(err) { rethrow; }
  }
}

