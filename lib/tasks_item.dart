import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
class TaskItem extends StatelessWidget {

  Color color1 = Color(0xFF151B54);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane:ActionPane(
        extentRatio: 0.3,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(onPressed: (buildContext) {},
            autoClose: true,
            backgroundColor: Colors.red,
            label: 'Delete',
            icon: Icons.delete,
            borderRadius: const BorderRadius.only(
              topLeft:Radius.circular(18) ,
              bottomLeft: Radius.circular(18),
            ),
          ),
        ],
      ) ,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12 ),
          color: Colors.white,
        ),
        child:
        Row(
          children: [
            const Text('15:17',style: TextStyle(fontSize: 15),),
            const SizedBox(width: 3,),
            Container(
              height: 80,
              width: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color:color1,

              ),
            ),
            const SizedBox(width: 15,),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' Arabic',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey,fontSize: 15),),
                  SizedBox(width: 3,),
                  Text('Ahmed',style: TextStyle(fontSize: 20),),
                  SizedBox(height: 12,),
                ],
              ),

            ),
            if(LayoutCubit.get(context).userModel.kind=='admin')
            GestureDetector(
                onTap: (){},
                child: const Icon(Icons.delete,color: Colors.red,)
            ),
          ],
        ),
      ),
    );
  }
}