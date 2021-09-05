import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_projects/locationdetails.dart';
import 'package:flutter_projects/persondetails/loader.dart';
import 'package:flutter_projects/personlist/loader.dart';

class PersonDetailsPage extends StatefulWidget {
  PersonDetailsPage({Key key, this.id}) : super(key: key);

  final int id;

  @override
  _State createState() => _State(id: id);
}

class _State extends State<PersonDetailsPage> {
  _State({this.id}) : super();

  int id;
  PersonDetails person;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var personData = await loadPerson(id);
    setState(() {
      person = personData;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    if (person == null)
      widget = Center(
        child: Text("Loading..."),
      );
    else
      widget = SafeArea(
        child: Column(
          children: [
            GestureDetector(
            child:  Image.network(
                person.avatar,
                width: double.infinity,
              ),
              onTap: ()=> showLocationDetails(context, person.locationName, person.locationUrl),
            ),
            Text(person.name)
          ],
        ),
      );

    return Scaffold(
        appBar: AppBar(
          title: Text("Person details"),
        ),
        body:
            widget // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
