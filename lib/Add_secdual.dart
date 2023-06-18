import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_task.dart';
class Addscadual extends StatefulWidget {
  Color color1 = Color(0xFF151B54);
  static const String routeName='HomeScreen';
  @override
  State<Addscadual> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<Addscadual> {
  int  selectedindexTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body:Center(
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF083663),
                ),
                child: const Icon(Icons.add,color: Colors.white,),

                onPressed: () {

                  showAddTaskButtomSheet();

                },

              ),



              const SizedBox(height: 20,),

              const Text('Add new Table',style: TextStyle(color: Color(0xFF151B54),fontWeight: FontWeight.bold,),)

            ],

          ),
        )

    );
  }
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