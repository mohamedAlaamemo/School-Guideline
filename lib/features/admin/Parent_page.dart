import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/constant.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';
import 'package:trypro/features/home/profile_page.dart';

import '../../core/cubit/layout_cubit.dart';
import '../home/notifications.dart';
class Parentpage extends StatefulWidget {
  const Parentpage({Key? key}) : super(key: key);

  @override
  State<Parentpage> createState() => _ParentpageState();
}

class _ParentpageState extends State<Parentpage> {

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit =LayoutCubit.get(context);
    return Scaffold(
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
        backgroundColor:Color(0xFF083663),
        //Colors.blue[300],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                // Add a search icon or button outside the border of the search bar

                Expanded(
                  // Use a Material design search bar
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      // Add a clear button to the search bar
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
                child: ListView.separated(
                  separatorBuilder:(context,index)=>SizedBox(height: 15,) ,
                itemBuilder:(context,index)=> listOfParent(context: context,model:cubit.allParentList[index],id: cubit.allParentListId[index]),
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.allParentList.length,
                )
            )

          ],
        ),



      ),
    );
  },
);
  }
}


