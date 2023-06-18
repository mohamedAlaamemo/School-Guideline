import 'package:flutter/material.dart';
import 'package:trypro/core/widgets/my_asset_image.dart';

import '../../core/constant.dart';

class AnalysisAdmin extends StatefulWidget {
   AnalysisAdmin({Key? key}) : super(key: key);


  @override
  State<AnalysisAdmin> createState() => _AnalysisAdminState();
}

class _AnalysisAdminState extends State<AnalysisAdmin> {
  bool isShow1=false,isShow2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis'),
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
              //height: 360,
              child: Stack(
                children: [
                  if(isShow1)
                  const Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: MyAssetImage(image: 'admin1.png')),
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
                            'Gender Distribution',
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
              height: 330,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  if(isShow2)
                  const Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: MyAssetImage(image: 'admin2.png')),
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
                            'Distribution of parents',
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
