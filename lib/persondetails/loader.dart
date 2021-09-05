import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PersonDetails {
  int id;
  String name;
  String avatar;
  String locationName;
  String locationUrl;
  String status;
  String created;
  String type;
  String gender;

  String originName;
  String originUrl;
  List<String> episodes;
}

Future<PersonDetails>loadPerson(int id) async{
  var response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/$id'));

  PersonDetails person;
  if(response.statusCode == 200) {
    var personData = convert.jsonDecode(response.body);
    person = PersonDetails();
    person.id = personData["id"];
    person.name = personData["name"];
    person.avatar = personData["image"];
    person.locationName = personData["location"]["name"];
    person.locationUrl = personData["location"]["url"];
    person.status = personData["status"];
    person.created = personData["created"];
    person.gender = personData["gender"];
    person.type = personData["type"];
    person.originName = personData["origin"]["name"];
    person.originUrl = personData["origin"]["url"];
    // person.episodes = personData["episode"];




  } else {

  }
  return person;
}