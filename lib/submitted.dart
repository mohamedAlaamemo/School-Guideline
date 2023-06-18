import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/constant.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';


class submitted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: 30.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xFF083663),
                        ),
                        child: const Center(
                            child: Text(
                              'Assigned',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: 30.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.green[200],
                        ),
                        child: const Center(
                            child: Text(
                              'Submitted',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => submitted()));
                      },
                    ),
                  ),
                ]),
              ),
             const SizedBox(height: 15,),
              if(state is LayoutSelectFileToSendAssignmentToTeatcherSuccessState)
                Center(child: CircularProgressIndicator(color: color1,)),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index)=>
                        showTeatcherToSendAssignment(
                        context: context,
                            model: cubit.allTeacherList[index],
                          teacherId: cubit.allTeacherListId[index],
                          studentId: cubit.studentListId[cubit.studentIndex],
                        ),
                    separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                    itemCount: cubit.allTeacherList.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
