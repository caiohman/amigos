class Friend {
    final String name;
    final int id;
    final String phoneNumber;
    final String birth;

    Friend({
      required this.name, 
      required this.id, 
      required this.phoneNumber,
      required this.birth
    });
    factory Friend.fromJson(Map<String, dynamic> json){
	return Friend(
	  name: json["name"],
	  id: json["id"],
	  phoneNumber: json["phoneNumber"],
	  birth: json["birth"],
	);
    }	    	
}
