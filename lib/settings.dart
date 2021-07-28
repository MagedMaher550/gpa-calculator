import 'package:flutter/material.dart';
import "components.dart";
import "lists.dart";
//import 'gpa_brain.dart';

class MySettings extends StatefulWidget {
  static const String id = "settings";

  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: Scaffold (
        body: SafeArea (
            child: SingleChildScrollView (
              child: Column (
                children: <Widget>[
                  Container (
                    color: Colors.green[500],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon (
                              Icons.arrow_left,
                              size: 50.0,
                              color: Colors.white,
                            ),
                          ),
                          Text (
                            "Edit Points",
                            style: TextStyle (
                              fontWeight: FontWeight.w400,
                              fontSize: 27.5,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton (
                            child: Icon (
                              Icons.check,
                              size: 50.0,
                              color: Colors.white,
                            ),
                            onPressed: (){},
                          )
                        ],
                      ),
                    ),
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text (
                              "Gr" ,
                              style: TextStyle (
                                fontSize: 30.0,
                                color: Colors.red[600],
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox (
                              width: 15.0,
                            ),
                            CircleAvatar (
                              backgroundColor: Colors.grey,
                              radius: 8.5,
                            ),
                          ],
                        ),
                      ),
                      Expanded (
                        child: Text (
                          "Points" ,
                          style: TextStyle (
                            fontSize: 30.0,
                            color: Colors.red[600],
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox (
                    height: 13.0,
                  ),
                  EditableRow(gradeText: "A", initialText: "4",),
                  EditableRow(gradeText: "A-", initialText: "3.67",),
                  EditableRow(gradeText: "B+", initialText: "3.33",),
                  EditableRow(gradeText: "B", initialText: "3",),
                  EditableRow(gradeText: "B-", initialText: "2.67",),
                  EditableRow(gradeText: "C+", initialText: "2.33",),
                  EditableRow(gradeText: "C", initialText: "2",),
                  EditableRow(gradeText: "C-", initialText: "1.67",),
                  EditableRow(gradeText: "D+", initialText: "1.33",),
                  EditableRow(gradeText: "D", initialText: "1",),
                  EditableRow(gradeText: "F", initialText: "0",),
                ],
              ),
            ),
        ),
      ),
    );
  }
}

