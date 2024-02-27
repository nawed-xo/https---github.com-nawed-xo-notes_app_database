import 'package:flutter/material.dart';
import 'package:notes_app/Screens/homepage.dart';
import 'package:notes_app/customWidget/customwidget.dart';
import 'package:notes_app/databse/app_databse.dart';
import 'package:notes_app/databse/notes_model.dart';
import 'package:notes_app/Screens/homepage.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  DbHelper db = DbHelper.db;
  List<Notes_Model> arrNotes = [];

  void addNotes(String title, desc) async {
    await db.addNotes(Notes_Model(title: title, desc: desc));
    arrNotes = await db.fetchAlldata();
    setState(() {});
  }

  void getAllNotes() async {
    arrNotes = await db.fetchAlldata();
    setState(() {});
  }

  TextEditingController updateTitleController = TextEditingController();
  TextEditingController updateDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//////////
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  db.updateNotes(Notes_Model(
                      title: updateTitleController.text,
                      desc: updateDescController.text));
                  getAllNotes();

                  Navigator.pop(context);
                },
                child: Icon(Icons.save)),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              custom_widget.custom_feild(updateTitleController),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: updateDescController,
                maxLines: 20,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Description...",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(148, 255, 255, 255),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
