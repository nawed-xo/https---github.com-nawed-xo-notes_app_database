import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Screens/updatepage.dart';
import 'package:notes_app/Screens/writingpage.dart';

import 'package:notes_app/databse/notes_model.dart';
import 'package:notes_app/provider/app_provider.dart';
import 'package:notes_app/themesetting/themeProvider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToWritingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Writing_Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _isDark = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Switch(
              value: context.watch<themeProvider>().themevalue,
              onChanged: (value) {
                context.read<themeProvider>().themevalue = value;
              },
            ),
          )
        ],
      ),
      body: Consumer<notes_provider>(
        builder: (_, value, __) {
          List<Notes_Model> arrNotes = value.getAllNotes();
          return MasonryGridView.count(
            itemCount: value.getAllNotes().length,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdatePage(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.primaries[index],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          arrNotes[index].title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(color: Colors.black),
                        Text(arrNotes[index].desc,
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        IconButton(
                          onPressed: () {
                            context
                                .read<notes_provider>()
                                .deleteAllNotes(arrNotes[index].id!);
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToWritingPage,
        child: Icon(Icons.add),
      ),
    );
  }
}
