import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trypro/features/home/notifications.dart';
import 'package:trypro/features/home/profile_page.dart';
import '../chat/chat_page.dart';
import '../../core/cubit/layout_cubit.dart';
import 'Assignment_teacher.dart';
import 'home_teacher.dart';

class navigationbarteacher extends StatefulWidget {
  const navigationbarteacher({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<navigationbarteacher> {

  final items = const [
    Icon(Icons.person_search_rounded, size: 30, color: Colors.white,),
    Icon(Icons.cloud_upload_rounded, size: 30, color: Colors.white,),
    Icon(Icons.chat_bubble, size: 30, color: Colors.white,)
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Center(
          child: Text('School Guideline'),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          InkWell(
            child: const CircleAvatar(
              backgroundColor: Color(0xFF083663),radius: 30.0,
              backgroundImage:
              NetworkImage( 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',

              ),),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>profile() ));
            },
          ),

        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: IconButton(
              iconSize: 20,
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => notifications()),
                );
              },
            ),
          ),
        ],
        backgroundColor:const Color(0xFF083663),


        //Colors.blue[300],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
            if(index==2)
              {
                LayoutCubit.get(context).gitAllAdmin(context);
                LayoutCubit.get(context).getAllParent();
                LayoutCubit.get(context).getAllTeacher();
                LayoutCubit.get(context).EmitState();
              }
          });
        },
        height: 70,
        color: const Color(0xFF083663),
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget =  const TeacherHome();
        break;
      case 1:
        widget =  Assignteacher();
        break;
      default:
        widget =  ChatPage();
        break;
    }
    return widget;
  }
}

