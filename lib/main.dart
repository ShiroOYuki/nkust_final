import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nkust_final/newNotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: addNotes()
    );
  }
}




class addNotes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _addNotes();
}

class _addNotes extends State<addNotes>{

  List<Widget> notes = <Widget>[];

  @override
  Widget build(BuildContext context) {

    void updatePage() {
      if (kDebugMode) {
        print("Update");
      }
      setState(() {
        // 讀資料庫並更新
        String title = "Card";
        String index = "Hello World!\na\na\nnb\nshota";
        // notes.clear();

        notes.add(
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text(title),
                    subtitle: Text(index)
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          // delete SQL
                          // ...
                          // end delete SQL

                          // notes.removeAt(0);
                          updatePage();
                        },
                        child: const Text("Delete"))
                    ],
                  )
                ],
              ),
            )
        );
      });
    }



    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Final"),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const newNote())
                  ).then((value) => updatePage());
                },
              ),
            ),
            body: SingleChildScrollView(
                child: Center(
                    child: Column(
                      children: notes
                    )
                )
            )
        )
    );
  }
}