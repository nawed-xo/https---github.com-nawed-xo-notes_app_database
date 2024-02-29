import 'package:flutter/material.dart';
import 'package:notes_app/customWidget/customwidget.dart';
import 'package:notes_app/databse/notes_model.dart';
import 'package:notes_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class Writing_Page extends StatefulWidget {
  const Writing_Page({super.key});

  @override
  State<Writing_Page> createState() => _Writing_PageState();
}

class _Writing_PageState extends State<Writing_Page> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//////////
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  context.read<notes_provider>().addAllNotes(Notes_Model(
                      title: titleController.text, desc: descController.text));

                  Navigator.pop(context);
                },
                child: Icon(Icons.save)),
          )
        ],
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
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Description...",
                  hintStyle: TextStyle(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide()),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
