import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/constant.dart';

import '../../core/cubit/layout_cubit.dart';

class AbsenceLevel extends StatelessWidget {
  const AbsenceLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 50,),
                Text(
                  'Attendance Table',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: color1
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.pinkAccent[100],
                          padding:const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 10),
                          child: const Center(
                            child: Text(
                                'Name',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0,),
                      Expanded(
                        child: Container(
                          color: Colors.pinkAccent[100],
                          padding:const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 10),                          child: const Center(
                            child: Text(
                                'Attend',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => listOfAbsenceTeachr(context: context,index: index,model: cubit.studentLevel1[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(
                            height: 10,
                          ),
                      itemCount:cubit.studentLevel1.length
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((
                            states) => color1),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Submitted',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
