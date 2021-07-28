import 'package:flutter/material.dart';
import 'components.dart';
import 'lists.dart';
import 'gpa_brain.dart';
import 'settings.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const String id = "main";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double inputCGPA;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.green[400],
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox (
                        height: 17.0,
                      ),
                      Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: FlatButton (
                              child: Text (
                                '$lang',
                                style: TextStyle (
                                    fontSize: 20,
                                    color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  changeLang();
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text (
                              "GPA Calculator",
                              style: TextStyle (
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: FlatButton (
                              onPressed: () {
                                setState(() {
                                  clearAll();
                                });
                              },
                              child: Icon (
                                Icons.clear
                              ),
                            ),
                          ),
                          Expanded(
                            child: FlatButton (
                              onPressed: (){
                                Navigator.pushNamed(context, MySettings.id);
                                },
                              child: Icon (
                                Icons.settings
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox (
                        height: 20.0,
                      ),
                      Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GpaWidget (
                              gpaTextStyle: gpaTextStyle,
                              semesterGpa: semesterGpa,
                              numTextStyle: numTextStyle,
                              widgetText: "Semester GPA",
                          ),
                          GpaWidget (
                              gpaTextStyle: gpaTextStyle,
                              semesterGpa: cGPA,
                              numTextStyle: numTextStyle,
                              widgetText: "Cumulative GPA",
                          ),
                        ],
                      ),
                      SizedBox (
                        height: 13.0
                      ),
                      Container (
                        child: Text (
                          "Total Credit Hours: $totalCreditHours",
                          style: creditHoursTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox (
                        height: 17.0,
                      )
                    ],
                  ),
                ),
                MyTextField (
                  hintText: hintText1,
                  onChange: (value){
                    setState(() {
                      totalCreditHours = int.parse(value);
                    });
                  },
                ),
                MyTextField (
                  hintText: hintText2,
                  onChange: (value){
                    setState(() {
                      inputCGPA = double.parse(value);
                      cGPA = double.parse(((semesterGpa*calcCreditTime(hourValue) + totalCreditHours*inputCGPA)/(totalCreditHours + calcCreditTime(hourValue)) ).toStringAsFixed(3));
                    });
                  },
                ),
                SizedBox (
                  height: 25.0
                ),
                Row (
                  children: <Widget>[
                    Expanded(
                      child: MyHeader (
                          headerTextStyle: headerTextStyle,
                          text: headerTextCourse,
                      ),
                    ),
                    Expanded(
                      child: MyHeader (
                          headerTextStyle: headerTextStyle,
                          text: headerTextGrade,
                      ),
                    ),
                    Expanded(
                      child: MyHeader (
                          headerTextStyle: headerTextStyle,
                          text: headerTextCredits,
                      ),
                    ),
                    Expanded(
                      child: MyHeader (
                          headerTextStyle: headerTextStyle,
                          text: headerTextIsAgain,
                      ),
                    ),

                  ],
                ),
                Column (
                  children: <Widget>[
                    CourseRow (
                        courseNumber: 1,
                        gId: 'g1',
                        hId: 'h1',
                        qId: 'q1',
                        onHourChange: (newValue) {
                          setState(() {
                            onHourChangeDo(newValue: newValue, index: 0, inputCGPA: inputCGPA);
                          });
                        },
                        onGradeChange: (newValue) {
                          setState(() {
                            onGradeChangeDo(newValue: newValue, index: 0);
                          });
                      },
                      onQuestionChange: (newValue) {
                          setState(() {
                            onQuestionChangeDo(newValue: newValue, index: 0, inputCGPA: inputCGPA);
                          });
                      },
                    ),
                    CourseRow (
                        courseNumber: 2,
                        gId: 'g2',
                        hId: 'h2',
                        qId: 'q2',
                        onHourChange: (newValue) {
                          setState(() {
                            onHourChangeDo(newValue: newValue, index: 1, inputCGPA: inputCGPA);
                          });
                        },
                        onGradeChange: (newValue) {
                          setState(() {
                            onGradeChangeDo(newValue: newValue, index: 1);
                          });
                      },
                      onQuestionChange: (newValue) {
                          setState(() {
                            onQuestionChangeDo(newValue: newValue, index: 1, inputCGPA: inputCGPA);
                          });
                      },
                    ),
                    CourseRow (
                      courseNumber: 3,
                      gId: 'g3',
                      hId: 'h3',
                      qId: 'q3',
                      onHourChange: (newValue) {
                        setState(() {
                          onHourChangeDo(newValue: newValue, index: 2, inputCGPA: inputCGPA);
                        });
                      },
                      onGradeChange: (newValue) {
                        setState(() {
                          onGradeChangeDo(newValue: newValue, index: 2);
                        });
                      },
                      onQuestionChange: (newValue) {
                        setState(() {
                          onQuestionChangeDo(newValue: newValue, index: 2, inputCGPA: inputCGPA);
                        });
                      },
                    ),
                    CourseRow (
                      courseNumber: 4,
                      gId: 'g4',
                      hId: 'h4',
                      qId: 'q4',
                      onHourChange: (newValue) {
                        setState(() {
                          onHourChangeDo(newValue: newValue, index: 3, inputCGPA: inputCGPA);
                        });
                      },
                      onGradeChange: (newValue) {
                        setState(() {
                          onGradeChangeDo(newValue: newValue, index: 3);
                        });
                      },
                      onQuestionChange: (newValue) {
                        setState(() {
                          onQuestionChangeDo(newValue: newValue, index: 3, inputCGPA: inputCGPA);
                        });
                      },
                    ),
                    CourseRow (
                      courseNumber: 5,
                      gId: 'g5',
                      hId: 'h5',
                      qId: 'q5',
                      onHourChange: (newValue) {
                        setState(() {
                          onHourChangeDo(newValue: newValue, index: 4, inputCGPA: inputCGPA);
                        });
                      },
                      onGradeChange: (newValue) {
                        setState(() {
                          onGradeChangeDo(newValue: newValue, index: 4);
                        });
                      },
                      onQuestionChange: (newValue) {
                        setState(() {
                          onQuestionChangeDo(newValue: newValue, index: 4, inputCGPA: inputCGPA);
                        });
                      },
                    ),
                    CourseRow (
                      courseNumber: 6,
                      gId: 'g6',
                      hId: 'h6',
                      qId: 'q6',
                      onHourChange: (newValue) {
                        setState(() {
                          onHourChangeDo(newValue: newValue, index: 5, inputCGPA: inputCGPA);
                        });
                      },
                      onGradeChange: (newValue) {
                        setState(() {
                          onGradeChangeDo(newValue: newValue, index: 5);
                        });
                      },
                      onQuestionChange: (newValue) {
                        setState(() {
                          onQuestionChangeDo(newValue: newValue, index: 5, inputCGPA: inputCGPA);
                        });
                      },
                    ),
                    CourseRow (
                      courseNumber: 7,
                      gId: 'g7',
                      hId: 'h7',
                      qId: 'q7',
                      onHourChange: (newValue) {
                        setState(() {
                          onHourChangeDo(newValue: newValue, index: 6, inputCGPA: inputCGPA);
                        });
                      },
                      onGradeChange: (newValue) {
                        setState(() {
                          onGradeChangeDo(newValue: newValue, index: 6);
                        });
                      },
                      onQuestionChange: (newValue) {
                        setState(() {
                          onQuestionChangeDo(newValue: newValue, index: 6, inputCGPA: inputCGPA);
                        });
                      },
                    ),
                    CourseRow (
                      courseNumber: 8,
                      gId: 'g8',
                      hId: 'h8',
                      qId: 'q8',
                      onHourChange: (newValue) {
                        setState(() {
                          onHourChangeDo(newValue: newValue, index: 7, inputCGPA: inputCGPA);
                        });
                      },
                      onGradeChange: (newValue) {
                        setState(() {
                          onGradeChangeDo(newValue: newValue, index: 7);
                        });
                      },
                      onQuestionChange: (newValue) {
                        setState(() {
                          onQuestionChangeDo(newValue: newValue, index: 7, inputCGPA: inputCGPA);
                        });
                      },
                    ),
                    CourseRow (
                      courseNumber: 9,
                      gId: 'g9',
                      hId: 'h9',
                      qId: 'q9',
                      onHourChange: (newValue) {
                        setState(() {
                          onHourChangeDo(newValue: newValue, index: 8, inputCGPA: inputCGPA);
                        });
                      },
                      onGradeChange: (newValue) {
                        setState(() {
                          onGradeChangeDo(newValue: newValue, index: 8);
                        });
                      },
                      onQuestionChange: (newValue) {
                        setState(() {
                          onQuestionChangeDo(newValue: newValue, index: 8, inputCGPA: inputCGPA);
                        });
                      },
                    ),
                  ],

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

