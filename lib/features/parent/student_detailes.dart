import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
import 'package:trypro/features/parent/student/Subjects.dart';
import 'package:trypro/features/parent/student/analy_parent.dart';
import 'package:trypro/features/parent/student/grades.dart';
import 'package:trypro/features/parent/student/table_page_student.dart';

import 'student/assignment.dart';
import '../../core/constant.dart';

class StudentDetailes extends StatelessWidget {
  String studentName;

  StudentDetailes({required this.studentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        splashRadius: 50,
                        iconSize: 150,
                        icon:Icon(Icons.subject),
                        color: color1,
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>subjects()));

                        },
                      ),
                      const SizedBox(height: 5,),
                      Text("Subjects",style: TextStyle(fontWeight: FontWeight.bold,color: color1),),
                    ],
                  ),
                ),
                const SizedBox(width: 40,),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        splashRadius: 50,
                        iconSize: 150,
                        icon:const Icon(Icons.assignment),
                        color: color1,
                        onPressed: () {
                          // do something when the button is pressed
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>const assignment()));
                        },
                      ),
                      const SizedBox(height: 10,),
                      Text("Assignment",style: TextStyle(fontWeight: FontWeight.bold,color: color1),),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        splashRadius: 50,
                        iconSize: 150,
                        icon: const Icon(Icons.grading_rounded),
                        color: color1,
                        onPressed: () {
                          LayoutCubit.get(context).getAllGradeForStudent(context: context);
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>Grades()));
                        },
                      ),
                      const SizedBox(height: 5,),
                      Text("Grades",style: TextStyle(fontWeight: FontWeight.bold,color: color1),),
                    ],
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        splashRadius: 50,
                        iconSize: 150,
                        color: color1,
                        icon: const Icon(Icons.table_view_outlined),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>TablePageStudent()));
                        },
                      ),
                      const SizedBox(height: 5,),
                      Text("Schedule",style: TextStyle(fontWeight: FontWeight.bold,color: color1),),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        splashRadius: 50,
                        iconSize: 150,
                        icon: const Icon(Icons.analytics_outlined),
                        color: color1,
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=> AnalysisParent(studentName: studentName,)));
                          print(studentName);
                        },
                      ),
                      const SizedBox(height: 5,),
                      Text("Analysis",style: TextStyle(fontWeight: FontWeight.bold,color: color1),),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}
