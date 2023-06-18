import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trypro/features/admin/tasks_tab.dart';
import '../../add_task.dart';
class TablePage extends StatefulWidget {
  Color color1 = Color(0xFF151B54);
  static const String routeName='HomeScreen';
  @override
  State<TablePage> createState() => _TablePageState();
}
class _TablePageState extends State<TablePage> {

  Color color1 = Color(0xFF151B54);
  int  selectedindexTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: const Text('Table'),
        backgroundColor: Color(0xFF151B54),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton
        (
        backgroundColor: color1,
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white,width: 4),
        ),
        onPressed: (){
          showAddTaskButtomSheet();
        },
        child: const Icon(Icons.add,color: Colors.white,),

      ),
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