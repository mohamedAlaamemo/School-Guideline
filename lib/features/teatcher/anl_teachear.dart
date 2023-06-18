import 'package:flutter/material.dart';

import '../../core/constant.dart';
import '../../core/widgets/my_asset_image.dart';

class AnalysisTeacher extends StatefulWidget {
  const AnalysisTeacher({Key? key}) : super(key: key);

  @override
  State<AnalysisTeacher> createState() => _AnalysisTeacherState();
}

class _AnalysisTeacherState extends State<AnalysisTeacher> {
  bool isShow1=false,isShow2=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
        backgroundColor: color1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: (isShow1)?360:null,
              child: Stack(
                children: [
                  if(isShow1)
                    const Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: MyAssetImage(image: 't1.png')),
                  InkWell(
                    onTap: () {
                      isShow1=!isShow1;
                      setState((){});
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: color1,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Average Grades for quizzes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 270,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  if(isShow2)
                    const Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: MyAssetImage(image: 't2.png')),
                  InkWell(
                    onTap: () {
                      isShow2=!isShow2;
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: color1,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Grades cross quizzes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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
