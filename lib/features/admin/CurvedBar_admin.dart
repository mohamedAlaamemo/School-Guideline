import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';
import 'package:trypro/features/home/application/form_cubit.dart';
import '../home/notifications.dart';
import '../home/profile_page.dart';
import 'addnew/add_user.dart';
import 'adminhome.dart';
import 'form_list.dart';

class NavigationBarAdmin extends StatelessWidget {
  final items = const [
    Icon(
      Icons.home,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.person_add_alt_1,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.people_alt_outlined,
      size: 30,
      color: Colors.white,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewCubit, AddNewState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit= AddNewCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Center(
              child: Text('School Guideline'),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const CircleAvatar(
                  backgroundColor: Color(0xFF083663),
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile()));
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
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
            backgroundColor: const Color(0xFF083663),
            //Colors.blue[300],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            items: items,
            index: cubit.indexNavBarAdmin,
            onTap: (selctedIndex) {
              cubit.changeIndexNavBarAdmin(index: selctedIndex);
              if(selctedIndex==2)
                {
                  FormCubit.get(context).getAllForm(context);
                }
            },
            height: 70,
            backgroundColor: Colors.transparent,
            color: const Color(0xFF083663),
            animationDuration: const Duration(milliseconds: 300),
            // animationCurve: ,
          ),
          body: Container(
              color: Colors.blue,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: getSelectedWidget(index: cubit.indexNavBarAdmin)),
        );
      },
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const adminhome();
        break;
      case 1:
        widget = const AddNewUser();
        break;
      default:
        widget = const FormList();
        break;
    }
    return widget;
  }
}
