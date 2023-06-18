import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trypro/features/admin/table.dart';

import '../../core/cubit/layout_cubit.dart';
import 'Parent_page.dart';
import 'Teachers_page.dart';
import 'analysis_admin.dart';

class adminhome extends StatelessWidget {
  const adminhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      LayoutCubit.get(context).userModel.name.toString(),
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color(0xFF083663),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color(0xFF083663),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
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
                              "https://cdn-icons-png.flaticon.com/128/3429/3429433.png",
                              height: 90,
                              width: 60,
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Teachers",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              " ",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        LayoutCubit.get(context).getAllTeacher();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Teacherspage()));
                      },
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF083663),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/2173/2173907.png",
                              height: 90,
                              width: 60,
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Parents",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              " ",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        LayoutCubit.get(context).getAllParent();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Parentpage()));
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
                              "https://cdn-icons-png.flaticon.com/128/1584/1584362.png",
                              height: 90,
                              width: 60,
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Schedule",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              " ",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TablePage()));
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
                            Text(
                              " ",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  AnalysisAdmin())
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }
}
