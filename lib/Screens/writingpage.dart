import 'package:flutter/material.dart';
import 'package:notes_app/customWidget/customwidget.dart';
import 'package:notes_app/databse/app_databse.dart';
import 'package:notes_app/databse/notes_model.dart';

class Writing_Page extends StatefulWidget {
  const Writing_Page({super.key});

  @override
  State<Writing_Page> createState() => _Writing_PageState();
}

class _Writing_PageState extends State<Writing_Page> {


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
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
                  setState(() {
                    addNotes(titleController.text, descController.text);
                    getAllNotes();
                    Navigator.pop(context);

                  });
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
              custom_widget.custom_feild(titleController),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: descController,
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
