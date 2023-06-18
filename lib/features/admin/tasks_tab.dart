import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
import 'package:trypro/tasks_item.dart';

import '../../core/constant.dart';

class TasksTab extends StatelessWidget {
  Color color1 = Color(0xFF151B54);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState >(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=LayoutCubit.get(context);
    return Column(
      children: [
        Container(
          color: Colors.grey,
          child: CalendarTimeline(
            initialDate: cubit.dateTime,
            firstDate: DateTime.now().subtract(const Duration(days:30)),
            lastDate: DateTime.now().add(const Duration(days: 30)) ,
            onDateSelected: (date){
              cubit.changeDate(date: date);
              cubit.getTableList(dateTime: date.toString().substring(0,10).toString(), level: '1');
              print(date.toString().substring(0,10));
            },
            leftMargin: 20,
            activeBackgroundDayColor: Colors.white,
            activeDayColor: Theme.of(context).primaryColor,
            monthColor:color1,
            dayColor: color1,
            dotsColor: color1,
            selectableDayPredicate:(date) => date.day !=23,
            locale : 'en_ISO' ,
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.grey
            ),
            child:ListView.separated(
                itemBuilder: (context,index)=>showListOfTable(
                    context:context,
                    model: cubit.tableList[index],
                  index: index,

                ),
                separatorBuilder: (context,index)=>const SizedBox(height: 5,),
                itemCount: cubit.tableList.length
            ),
          ),
        ),
      ],
    );
  },
);
  }
}