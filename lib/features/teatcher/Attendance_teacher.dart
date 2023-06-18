import 'package:flutter/material.dart';
import 'package:trypro/core/widgets/navigation.dart';

import '../../core/constant.dart';
import '../../core/cubit/layout_cubit.dart';
import 'absence_level.dart';

class attendanceteacher extends StatefulWidget {
  @override
  State<attendanceteacher> createState() => _attendanceState();
}
class _attendanceState extends State<attendanceteacher> {

  bool ? value = false;
  bool ? value2 = false;
  bool ? value3= false;
  bool ? value4 = false;
  bool ? value5 = false;

  //Color color1 = Color(0xFF151B54);
  //Color color2=Color(0xFFfaf0e6) ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70.0,),
                const Center(
                  child: Text('Attendance Table',

                    style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextButton(
                           style: ButtonStyle(
                             backgroundColor: MaterialStateColor.resolveWith((states) => color1),
                           ),
                            onPressed: (){
                             LayoutCubit.get(context).getAllStudentLevel(level: '1');
                             Navigation.navigatorTo(context, const AbsenceLevel());
                            },
                            child: const Text(
                                'Level 1',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextButton(
                           style: ButtonStyle(
                             backgroundColor: MaterialStateColor.resolveWith((states) => color1),
                           ),
                            onPressed: (){
                              LayoutCubit.get(context).getAllStudentLevel(level: '2');
                              Navigation.navigatorTo(context, AbsenceLevel());

                            },
                            child: const Text(
                                'Level 2',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextButton(
                           style: ButtonStyle(
                             backgroundColor: MaterialStateColor.resolveWith((states) => color1),
                           ),
                            onPressed: (){
                              LayoutCubit.get(context).getAllStudentLevel(level: '3');
                              Navigation.navigatorTo(context, AbsenceLevel());
                            },
                            child: const Text(
                                'Level 3',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}