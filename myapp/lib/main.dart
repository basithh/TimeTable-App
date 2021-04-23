import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var now = DateTime.now();
String weektodaystr(String week) {
  dynamic weekdata = {
    '1': 'Monday',
    '2': 'Tuesday',
    '3': 'Wednesday',
    '4': 'Thursday',
    '5': 'Friday',
    '6': 'Saturday',
    '7': 'Sunday'
  };
  Map<String, String> values = Map<String, String>.from(weekdata);
  return values[week];
}

List timetablestr(String week) {
  var ttdata = {
    '1': [
      ['Predictive Modeling', '9:20AM to 11:00AM'],
      ['SEM', '11:20AM to 01:00PM'],
      ['Graph Theory and Application', '2:00PM to 3:40PM']
    ],
    '2': [
      ['Distributed Computing', '9:20AM to 11:00AM'],
      ['Big Data Analytics Tools Lab', '11:20AM to 01:00PM'],
      ['Social Entreneurship', '2:00PM to 3:40PM']
    ],
    '3': [
      ['Graph Theory and Application', '9:20AM to 11:00AM'],
      ['AI Analyst', '11:20AM to 01:00PM'],
      ['Communication and Soft Skill', '2:00PM to 3:40PM']
    ],
    '4': [
      ['Foundation course in Big Data Analytics', '9:20AM to 11:00AM'],
      ['Statistical Methods for Data', '11:20AM to 01:00PM'],
      ['Distributed Computing/Predictive Modeling', '2:00PM to 3:40PM']
    ],
    '5': [
      ['Social Entreneurship', '9:20AM to 11:00AM'],
      ['Industry Session', '11:20AM to 01:00PM'],
      ['AI analsyt', '2:00PM to 3:40PM']
    ],
    '6': [
      ['Free', '9:20AM to 11:00AM']
    ],
    '7': [
      ['Free', '9:20AM to 11:00AM']
    ]
  };
  // Map<String, List<List<String>>> values =
  //     Map<String, List<List<String>>>.from(ttdata);
  print(ttdata['1'].toString());
  return ttdata[week];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimeTable App',
      home: Scaffold(
          body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 100,
              child: Center(
                  child: Text(
                weektodaystr(now.weekday.toString()),
                style: TextStyle(fontSize: 50, fontFamily: 'Satisfy'),
              )),
            ),
            Column(children: [
              for (List tName in timetablestr(now.weekday.toString()))
                subjectFun(tName[0], tName[1]),
            ]),
          ],
        ),
      )),
    );
  }

  Container subjectFun(String name, String time) {
    return Container(
      height: 110,
      width: double.infinity,
      child: Card(
          color: Colors.black26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 30, fontFamily: 'Satisfy'),
                ),
              ),
              Container(padding: EdgeInsets.all(10), child: Text(time))
            ],
          )),
    );
  }
}
