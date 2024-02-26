import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Screens/writingpage.dart';
import 'package:notes_app/databse/app_databse.dart';
import 'package:notes_app/databse/notes_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  DbHelper db = DbHelper.db;
  List<Notes_Model> arrNotes = [];

  @override
  void initState() {
    super.initState();
    getAllNotes();
  }

  void getAllNotes() async {
    arrNotes = await db.fetchAlldata();
    setState(() {});
  }

  void navigateToWritingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Writing_Page()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: arrNotes.length,
        itemBuilder: (context, index) {
          return Text(arrNotes[index].title);
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: navigateToWritingPage,
        child: Icon(Icons.add),
      ),
    );
  }
}
