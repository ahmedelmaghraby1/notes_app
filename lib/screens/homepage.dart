import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    getpref();
    super.initState();
  }

  getpref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString("username");
      email = pref.getString("email");
    });
  }

  List notes = [
    {"name": "ahmed", "image": "psu.jpeg"},
    {"name": "manar", "image": "psu.jpeg"},
    {"name": "sam7", "image": "psu.jpeg"},
    {"name": "sama", "image": "psu.jpeg"},
    {"name": "mona", "image": "psu.jpeg"},
  ];
  var username;
  var email;

  @override
  Widget build(BuildContext context) {
    double mq = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(88, 180, 255, 1),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("addnotes");
          },
        ),
        appBar: AppBar(
          title: Text("Homepage"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.greenAccent),
              accountName: Text("$username"),
              accountEmail: Text("$email"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 40,
                child: Text(
                    "${username.toString().substring(0, 2).toUpperCase()}"),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: IconButton(
                icon: Icon(Icons.school),
                onPressed: () {},
              ),
              title: Text("Students"),
            ),
            ListTile(
              onTap: () {},
              leading: IconButton(
                icon: Icon(Icons.notes),
                onPressed: () {},
              ),
              title: Text("Surveys"),
            )
          ]),
        ),
        body: ListView.builder(
            itemCount: notes.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: Key("$index"),
                child: Listnotes(
                  notes: notes[index],
                ),
              );
            })));
  }
}

class Listnotes extends StatelessWidget {
  final notes;
  final wd;
  const Listnotes({this.notes, this.wd});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Expanded(
        flex: 1,
        child: Image.asset(
          "images/${notes[notes.keys.elementAt(1)]}",
        ),
      ),
      Expanded(
        flex: 2,
        child: ListTile(
          subtitle: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: (() {}),
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          title: Text("${notes['name']}"),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: (() {}),
          ),
        ),
      )
    ]));
  }
}
