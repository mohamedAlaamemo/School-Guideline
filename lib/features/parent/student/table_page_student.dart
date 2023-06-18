import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trypro/features/admin/tasks_tab.dart';

import '../../../add_task.dart';
class TablePageStudent extends StatefulWidget {
  Color color1 = Color(0xFF151B54);
  static const String routeName='HomeScreen';
  @override
  State<TablePageStudent> createState() => _TablePageStudentState();
}
class _TablePageStudentState extends State<TablePageStudent> {

  Color color1 = Color(0xFF151B54);
  int  selectedindexTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      tabs,
    );
  }
  var tabs =
  TasksTab();
  void showAddTaskButtomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext) {
      return AddTask();
    }
    );
  }
}
class MyDateUtils {
  static String formatTaskDate(DateTime dateTime) {
    DateFormat formatter=DateFormat('dd-mm-yyyy');
    return formatter.format(dateTime);
  }
}