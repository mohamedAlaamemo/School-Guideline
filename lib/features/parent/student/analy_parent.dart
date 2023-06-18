import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../../../core/widgets/my_asset_image.dart';

class AnalysisParent extends StatefulWidget {

  String studentName;

  AnalysisParent({required this.studentName});



  @override
  State<AnalysisParent> createState() => _AnalysisParentState(studentName: studentName);
}

class _AnalysisParentState extends State<AnalysisParent> {
  bool roaa=false;

  String studentName;

  _AnalysisParentState({required this.studentName});




  @override
  Widget build(BuildContext context) {
    String image='hazem.png';
    if(studentName=='roaa ehab')
    {
      image='roaa.png';
    }
    else if(studentName=='tariq talat')
    {
      image='tariq.png';
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            if(studentName=='roaa ehab'||studentName=='tariq talat'||studentName=='hazem İbrahim')
            SizedBox(
              height: (roaa)?250:null,
              child: Stack(
                children: [
                  if(roaa)
                   Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: MyAssetImage(image: image)),
                  InkWell(
                    onTap: () {
                      roaa=!roaa;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: color1,
                            borderRadius: BorderRadius.circular(20)),
                        child:  Center(
                          child: Text(
                            'Math Grade for ${studentName}',
                            style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}
