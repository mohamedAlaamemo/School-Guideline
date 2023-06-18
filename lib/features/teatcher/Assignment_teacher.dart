import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';

import '../../core/constant.dart';
class Assignteacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit =LayoutCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Expanded(
              //           child: Container(
              //             height: 30.0,
              //             width: 250,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10.0),
              //               color: Colors.red[200],
              //             ),
              //             child: const Center(
              //                 child: Text(
              //               'Upload Assigned',
              //               style: TextStyle(color: Colors.white),
              //             )),
              //           ),
              //         ),
              //       ]
              //   ),
              // ),
              //SizedBox(height: 100,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text('Level  1'),
                                IconButton(
                                    onPressed: (){
                                      cubit.chooseAssignmentLevel(index: 0);
                                    },
                                    icon:  Icon(Icons.square,color: (cubit.assignmentLevel[0]==true)?Colors.blue:Colors.grey,)
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text('Level  2'),
                                IconButton(onPressed: (){
                                  cubit.chooseAssignmentLevel(index: 1);
                                },
                                    icon:  Icon(Icons.square,color: (cubit.assignmentLevel[1]==true)?Colors.blue:Colors.grey,)
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text('Level  3'),
                                IconButton(
                                    onPressed: (){
                                  cubit.chooseAssignmentLevel(index: 2);
                                },
                                    icon:  Icon(Icons.square,color: (cubit.assignmentLevel[2]==true)?Colors.blue:Colors.grey,)
                                ),
                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if(state is LayoutAddFileAssignmentLodingState)
                     Center(child: CircularProgressIndicator(color: color1,)),
                    if(state != LayoutAddFileAssignmentLodingState)
                    InkWell(
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF083663),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              'Upload',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                            SizedBox(
                              width: 30.0,
                            ),
                            Icon(
                              Icons.file_upload_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      String level='1';
                      if(cubit.assignmentLevel[0]==true) {
                        level='1';
                      } else if(cubit.assignmentLevel[1]==true) {
                        level='2';
                      } else if(cubit.assignmentLevel[2]==true) {
                        level='3';
                      }
                      cubit.selectFile(context: context,level: level);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
