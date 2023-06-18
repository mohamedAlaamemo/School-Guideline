import 'package:flutter/material.dart';

import '../../core/constant.dart';
class NewLevel extends StatelessWidget {
  const NewLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70.0,),
            const Center(
              child: Text('Add New Level',

                style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => color1),
                        ),
                        onPressed: (){
                        },
                        child: const Text(
                          'Level 1',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => color1),
                        ),
                        onPressed: (){
                        },
                        child: const Text(
                          'Level 2',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => color1),
                        ),
                        onPressed: (){
                        },
                        child: const Text(
                          'Level 3',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton(
                onPressed: (){},
              backgroundColor: color1,
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),


    );
  }
}
