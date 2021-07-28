import 'package:flutter/material.dart';
import 'course.dart';
import 'lists.dart';


TextStyle numTextStyle = TextStyle (
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
TextStyle gpaTextStyle = TextStyle (
  fontSize: 22.5,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
TextStyle creditHoursTextStyle = TextStyle (
  fontSize: 21,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);
TextStyle headerTextStyle = TextStyle (
  fontSize: 20.0,
  color: Colors.red[700],
  fontWeight: FontWeight.w700,
);
double semesterGpa = 0;
double cGPA = 0;
int totalCreditHours = 0;
int oldCreditHours = 0;
int newCreditHours = 0;
String lang = 'العربية';
String headerTextCourse = "Course";
String headerTextGrade = "Grade";
String headerTextCredits = "Credits";
String headerTextIsAgain = "isAgain?";
String hintText1 = "Total Credit Hours";
String hintText2 = "Your CGPA";

bool langChecker = true;
bool clearFields= false;


int numOfCourses = 0;
List<Course> courses = [];

class MyHeader extends StatelessWidget {
  final TextStyle headerTextStyle;
  final String text;

  MyHeader({
    @required this.headerTextStyle,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row (
      children: <Widget>[
        CircleAvatar (
          backgroundColor: Colors.grey,
          radius: 7.0,
        ),
        Text (
          text,
          style: headerTextStyle,
        ),
      ],
    );
  }
}
class MyTextField extends StatelessWidget {

  final String hintText;
  final Function onChange;

  MyTextField ({
    @required this.hintText,
    @required this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hintText,
      ),
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}
class GpaWidget extends StatelessWidget {
  const GpaWidget({
    Key key,
    @required this.gpaTextStyle,
    @required this.widgetText,
    @required this.semesterGpa,
    @required this.numTextStyle,
  }) : super(key: key);

  final TextStyle gpaTextStyle;
  final double semesterGpa;
  final TextStyle numTextStyle;
  final String widgetText;

  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        Text (
            widgetText,
            style: gpaTextStyle
        ),
        SizedBox (
          height: 10.0,
        ),
        Text (
            "${semesterGpa.toString()}",
            style: numTextStyle
        ),
      ],
    );
  }
}
class CourseCard extends StatelessWidget {
  CourseCard ({
    @required this.courseNumber
  });
  final int courseNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(7.0)
      ),
      child: Text (
          "#$courseNumber",
          style: TextStyle (
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )
      ),
    );
  }
}
class RoundedDropDown extends StatelessWidget {
  final List<String> listItems;
  final Color backgroundColor;
  final double radius;
  final String hintText;
  final Function onChange;
  final String id;

  RoundedDropDown ({
    @required this.listItems,
    @required this.hintText,
    @required this.backgroundColor,
    @required this.radius,
    @required this.onChange,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar (
      child:  DropdownButton<String> (
        iconSize: 0.0,
        hint: Text (
          hintText,
          style: TextStyle (
              color: Colors.black
          ),
        ),
        items: listItems.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (String newValue) {
          onChange(newValue);
        },
      ),
      radius: radius,
      backgroundColor: backgroundColor,
    );
  }
}
class CourseRow extends StatelessWidget {
  const CourseRow({
    Key key,
    @required this.courseNumber,
    @required this.hId,
    @required this.gId,
    @required this.qId,
    this.onHourChange,
    this.onGradeChange,
    this.onQuestionChange,
  });
  final int courseNumber;
  final String hId;
  final String gId;
  final String qId;
  final Function onHourChange;
  final Function onGradeChange;
  final Function onQuestionChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider (
          color: Colors.black,
        ),
        Row (
          children: <Widget>[
            CourseCard(courseNumber: courseNumber,),
            SizedBox (
              width: 50.0,
            ),
            RoundedDropDown (
              id: gId,
              listItems: gradeValues,
              hintText: gradeValue[int.parse(gId.substring(1,2))-1],
              radius: 25,
              backgroundColor: Colors.green[500],
              onChange: (newValue) {
                onGradeChange(newValue);
              },
            ),
            SizedBox (
              width: 50.0,
            ),
            RoundedDropDown (
              listItems: creditValues,
              hintText: hourValue[int.parse(hId.substring(1,2))-1],
              radius: 25,
              backgroundColor: Colors.green[500],
              onChange: (newValue) {
                onHourChange(newValue);

              },
              id: hId,
            ),
            SizedBox (
              width: 50.0,
            ),
            RoundedDropDown (
              id: qId,
              listItems: isAgainItems,
              hintText: qValue[int.parse(qId.substring(1,2))-1],
              radius: 25,
              backgroundColor: Colors.green[500],
              onChange: (newValue) {
                onQuestionChange(newValue);
              },
            ),

          ],
        ),
      ],
    );
  }
}
class EditableRow extends StatelessWidget {

  final String gradeText;
  final String initialText;
  final Function onChange;

  EditableRow({
    @required this.gradeText,
    @required this.initialText,
    this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return Row (
      children: <Widget>[
        Expanded (
          child: CircleAvatar (
            child: Text (
              gradeText,
              style: TextStyle (
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            backgroundColor: Colors.green[500],
          ),
        ),
        Expanded (
          child: TextFormField(
            initialValue: initialText,
            textAlign: TextAlign.center,
            style: TextStyle (
                fontSize: 23.0
            ),
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onChanged: (value) {},
          ),
        )
      ],
    );
  }
}
