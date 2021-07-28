import 'lists.dart';
import 'components.dart';
double calcGPA(String grade) {
  if (grade == "A") {
    return 4;
  } else if (grade == "A-") {
    return 3.67;
  } else if (grade == "B+") {
    return 3.33;
  } else if (grade == "B") {
    return 3;
  } else if (grade == "B-") {
    return 2.67;
  } else if (grade == "C+") {
    return 2.33;
  } else if (grade == "C") {
    return 2;
  } else if (grade == "C-") {
    return 1.67;
  } else if (grade == "D+") {
    return 1.33;
  } else if (grade == "D") {
    return 1;
  } else {
    return 0;
  }
}
int calcCreditTime(List<String> list) {
  int res = 0;
  for(String i in list) {
    if(i != "HR")
      res += int.parse(i);
  }
  return res;
}
bool isGradeChecked(int index) {
  return gradeValue[index] != "GR";
}
bool isHourChecked(int index) {
  return hourValue[index] != "HR";
}
bool isQuestionChecked(int index) {
  return qValue[index] != "NO";
}
double calcSemesterGpa(List<String> grade, List<String> hour) {
  double res = 0;
  for(int i=0; i<9; i++) {
    if(grade[i] != "GR" && hour[i] != "HR") {
      res += calcGPA(grade[i]).toDouble() * double.parse(hour[i]);
    }
  }
  return double.parse((res/calcCreditTime(hourValue)).toStringAsFixed(3));
}

void onHourChangeDo({String newValue, int index, double inputCGPA}) {
  String oldValue = hourValue[index];
  hourValue[index] = newValue;
  if(isGradeChecked(index) && oldValue != newValue) {
    int newTotalCreditHours = calcCreditTime(hourValue) + totalCreditHours;
    semesterGpa = calcSemesterGpa(gradeValue, hourValue);
    double prevCgpa = inputCGPA;
    double x1 =  totalCreditHours.toDouble()* prevCgpa + semesterGpa*calcCreditTime(hourValue);
    double x2 = newTotalCreditHours.toDouble();
    cGPA = double.parse((x1/x2).toStringAsFixed(3));
    prevCgpa = 0;
  }
}
void onGradeChangeDo({String newValue, int index}) {
  String oldValue = gradeValue[index];
  gradeValue[index] = newValue;
  if (hourValue[index] != 'HR' && oldValue != newValue) {
    int newTotalCreditHours = calcCreditTime(hourValue) + totalCreditHours;
    semesterGpa = calcSemesterGpa(gradeValue, hourValue);
    double prevCgpa = cGPA;
    cGPA = double.parse(((semesterGpa*calcCreditTime(hourValue) + totalCreditHours*prevCgpa )/(newTotalCreditHours)).toStringAsFixed(3));
    prevCgpa = 0;
    if(isQuestionChecked(index)) {
      double difference = double.parse((calcGPA(newValue) - calcGPA(qValue[index])).toStringAsFixed(3));
      cGPA +=  (int.parse(hourValue[index])*difference) / (newTotalCreditHours);
      prevCgpa = 0;
    }
  }
}
void onQuestionChangeDo({String newValue, int index, double inputCGPA}) {
  String oldValue = qValue[index];
  qValue[index] = newValue;
  if(oldValue != newValue) {
    if (isGradeChecked(index) && isHourChecked(index)) {
      if(newValue == "NO") {
        cGPA -= double.parse(((int.parse(hourValue[index])*calcGPA(gradeValue[index])) / (calcCreditTime(hourValue) + totalCreditHours)).toStringAsFixed(3));
        cGPA = double.parse(cGPA.toStringAsFixed(3));
      } else {
        int newTotalCreditHours = calcCreditTime(hourValue) + totalCreditHours;
        semesterGpa = calcSemesterGpa(gradeValue, hourValue);
        double prevCgpa = inputCGPA;
        cGPA = double.parse(((semesterGpa*calcCreditTime(hourValue) + totalCreditHours*prevCgpa )/(newTotalCreditHours)).toStringAsFixed(3));
        double difference = double.parse((calcGPA(gradeValue[index]) - calcGPA(newValue)).toStringAsFixed(3));
        cGPA +=  (int.parse(hourValue[index])*difference) / (newTotalCreditHours);
        cGPA = double.parse(cGPA.toStringAsFixed(3));
        prevCgpa = 0;
      }
    }
  }
}


void changeLang() {
  if(langChecker) {
    lang = 'English';
    headerTextCourse = "المادة";
    headerTextGrade = "العلامة";
    headerTextCredits = "الساعات";
    headerTextIsAgain = "معادة؟";
    hintText1 = "عدد الساعات المجتازة";
    hintText2 = "المعدل التراكمي السابف";
  } else {
    lang = 'العربية';
    headerTextCourse = "Course";
    headerTextGrade = "Grade";
    headerTextCredits = "Credits";
    headerTextIsAgain = "isAgain?";
    hintText1 = "Total Credit Hours";
    hintText2 = "Your CGPA";
  }
  langChecker = !langChecker;
}
void clearAll() {
  for (int i=0; i<9; i++) {
    hourValue[i] = "GR";
    gradeValue[i] = "GR";
    qValue[i] = "GR";
  }
  totalCreditHours = 0;
  cGPA = 0;
  semesterGpa = 0;
  clearFields = true;
  totalCreditHours = 0;
}

