import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/cubit/layout_cubit.dart';
import 'Attendance_teacher.dart';
import 'add_grade.dart';
import 'anl_teachear.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(
            15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView(
                padding: const EdgeInsets.only(left: 20, right: 20),
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20,
                    childAspectRatio:0.8
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF083663),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            "https://cdn-icons-png.flaticon.com/128/6012/6012113.png",
                            height: 90,
                            width: 60,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Analysis",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnalysisTeacher()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF083663),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            "https://thumbs.dreamstime.com/z/tiered-support-levels-25686746.jpg",
                            height: 90,
                            width: 60,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Levels",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  attendanceteacher())
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF083663),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            'https://www.jamesgmartin.center/wp-content/uploads/2020/07/AdobeStock_328366715-1200x800.jpeg',
                            height: 90,
                            width: 60,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Add Grade",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                        ],
                      ),
                    ),
                    onTap: () {
                      LayoutCubit.get(context).getAllAssignmentFromStudentToTeacher();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  AddGrade())
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
