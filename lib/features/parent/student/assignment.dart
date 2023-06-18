import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/constant.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
import 'package:trypro/submitted.dart';

class assignment extends StatelessWidget {
  const assignment({Key? key}) : super(key: key);

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
            children: [
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                            'Assigned',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: 30.0,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF083663),
                        ),
                        child: const Center(
                            child: Text(
                              'Submitted',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      onTap: () {
                        LayoutCubit.get(context).getAllTeacher();
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => submitted()));
                      },
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 15.0,
              ),
              if(state is LayoutDownLoadFileLodingState)
                Center(child: CircularProgressIndicator(color: color1,)),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index)=>showStudentAssignment(
                      context: context,
                        model: cubit.allStudentAssignmentLevelList[index]
                    ),
                    separatorBuilder: (context,index)=>SizedBox(height: 10,),
                    itemCount: cubit.allStudentAssignmentLevelList.length
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
