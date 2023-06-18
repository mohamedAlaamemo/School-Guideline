import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/features/home/application/form_cubit.dart';

import '../../core/constant.dart';

class FormList extends StatelessWidget {
  const FormList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormCubit, FormStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=FormCubit.get(context);
    return Scaffold(
      body: (cubit.allFormList.isEmpty)?Center(child: CircularProgressIndicator(color: color1,)):ListView.builder(
          itemBuilder: (context,index)=>formDetailes(context: context,model: cubit.allFormList[index],IdModel: cubit.allFormListID[index]),
        itemCount: cubit.allFormList.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  },
);
  }
}
