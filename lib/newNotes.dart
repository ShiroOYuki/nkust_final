import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const newNote());
}

class newNote extends StatelessWidget {
  const newNote({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textBorder = const OutlineInputBorder(
        borderSide: BorderSide(
            width: 3,
            color: Colors.white
        )
    );
    var titleColor = const Color.fromRGBO(43, 43, 43, 100);
    var mainColor = const Color.fromRGBO(143, 143, 143, 100);
    var title = "";
    var index = "";

    return Scaffold(
      appBar: AppBar(
          title: const Text("Final", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: titleColor
      ),
      body: LayoutBuilder(
        builder: (context, constrains) {
          return Center(
              child: Column (
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10,
                              top: 0,
                              bottom: 0
                          ),
                          fillColor: mainColor,
                          filled: true,
                          enabledBorder: textBorder,
                          focusedBorder: textBorder,
                          errorBorder: textBorder
                      ),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                      onChanged: (text) {
                        title = text;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      height: 200,
                      width: 300,
                      child: TextField(
                        textAlign: TextAlign.start,
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            fillColor: mainColor,
                            filled: true,
                            enabledBorder: textBorder,
                            focusedBorder: textBorder,
                            errorBorder: textBorder
                        ),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (text) {
                          index = text;
                        },
                      )
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          save2SQL(title, index);
                        },
                        child: const Text("Save"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(30)
                        ),
                      )
                  )

                ],
              )
          );
        },
      ),
      backgroundColor: mainColor,
    );
  }
}

void save2SQL(String title, String index){
  // 標題: title
  // 內文: index
  if (kDebugMode) {
    print(title);
    print(index);
  }
}