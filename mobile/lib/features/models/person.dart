class Person {
    final String name;

    Person({required this.name});
    factory Person.fromJson(Map<String, dynamic> json){
	return Person(name: json["name"]);
    }	    	
}
