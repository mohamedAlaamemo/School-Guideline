import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/constant.dart';

import '../../core/cubit/layout_cubit.dart';
class parenthome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BlocConsumer<LayoutCubit, LayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit =LayoutCubit.get(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Text('Welcome ${LayoutCubit.get(context).userModel.name}, ',style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: 16,),),
                const SizedBox(height: 2,),
                Text(
                  textAlign:TextAlign.start,
                  'Choose who to follow : ',style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: 16,),)
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                  itemBuilder:(context,index)=>showStudentList(context:context,model:cubit.studentList[index],index: index ),
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.studentList.length,
              ),
            ),
          ],
        ),
      );
  },
),
    );
  }
}
