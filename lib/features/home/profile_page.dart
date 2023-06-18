import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/network/local/cache_helper.dart';
import 'package:trypro/core/widgets/navigation.dart';
import 'package:trypro/features/home/first_page.dart';
import '../../core/constant.dart';
import '../../core/cubit/layout_cubit.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF083663),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                  onTap: (){
                    if(choice=='Logout')
                      {

                        setState(() {
                        });
                      }
                  },
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                children: [
                  Container(width: 130,height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white70,
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2, blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10)
                          )
                        ],
                        shape:BoxShape.circle,
                        image:const DecorationImage(

                            fit: BoxFit.cover,
                            image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                        )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: (){
                        showModalBottomSheet(
                            context: context,
                            builder: ( (builder) => bottomsheet()),
                        );
                      },
                      child: Container(

                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white70,
                            ),
                            color: const Color(0xFF083663)),

                        child: const Icon(Icons.edit,color: Colors.white,),
                      ),
                    ),)
                ],
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Text(
              'Name',
              style: TextStyle(
                  color: Colors.grey[800],
                  letterSpacing: 2
              ),
            ),
            const SizedBox(height: 10),
            Text(
              LayoutCubit.get(context).userModel.name.toString(),
              style: const TextStyle(
                  color: Color(0xFF083663),
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  LayoutCubit.get(context).userModel.email.toString(),
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      letterSpacing: 1
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          CacheHelper.removeDate(key: 'uId');
          CacheHelper.removeDate(key: 'kind');
          Navigation.navigatorAndFinished(context, FirstPage());
        },
        backgroundColor: color1,
        child: Icon(Icons.logout,color: color2,),
      ),
    );
  },
);
  }
}
void handleClick(String value) {
  switch (value) {
    case 'Logout':
      break;
    case 'Settings':
      break;
  }
}

Widget bottomsheet(){
  return Container(
    height: 100.0,
    width: 30,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        Text("Choose profile photo",
          style: TextStyle(
              fontSize: 20.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                  icon:Icon(Icons.camera_alt),
                  onPressed:()
                  {

                  },
                  label: Text("camera")),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton.icon(
                  icon:Icon(Icons.image),
                  onPressed:()
                  {

                  },
                  label: Text("Gallery")
              ),

            ]
        ),
      ],
    ),
  );
}
