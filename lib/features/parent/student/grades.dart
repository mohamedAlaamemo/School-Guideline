import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';

import '../../../core/constant.dart';

class Grades extends StatelessWidget {
  const Grades({Key? key}) : super(key: key);

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
              children: [
                SizedBox(height: 20,),
                if(state is LayoutGetAllGradeForStudentLodingState)
                  Center(child: CircularProgressIndicator(color: color1,)),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>showGradeStudent(model: cubit.studentGradeList[index]),
                      separatorBuilder:(context,index)=>  const SizedBox(height: 10,),
                      itemCount: cubit.studentGradeList.length
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}
