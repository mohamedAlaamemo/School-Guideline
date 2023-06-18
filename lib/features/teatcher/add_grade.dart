import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';

import '../../core/constant.dart';

class AddGrade extends StatelessWidget {
  const AddGrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=LayoutCubit.get(context);
          return Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 30.0,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.red[200],
                              ),
                              child: const Center(
                                  child: Text(
                                    'Add Grade To Assignment',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(height: 15.0,),
                  if(state is LayoutGetAllAssignmentFromStudentToTeacherLodingState||
                      state is LayoutInsertGradeToStudentLodingState||
                  state is LayoutDownLoadFileLodingState
                  )
                    Center(child: CircularProgressIndicator(color: color1,)),
                  Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            AssimentStudent(context,model: cubit.allAssignmentFromStudentList[index]),
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 5,),
                        itemCount: cubit.allAssignmentFromStudentList.length
                    ),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
