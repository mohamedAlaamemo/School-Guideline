import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class subjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Subjects",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),)
            ],
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                       children: [
                         Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            //color: Colors.blue[100],
                            color: Color(0xFF083663),
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: const Row(
                            children: [
                           Image(image:NetworkImage("https://cdn-icons-png.flaticon.com/128/1739/1739515.png"))

                            ],
                          ),
                    ),
                         const SizedBox(height: 10,),
                         Text("Math", style: TextStyle(fontSize: 20,color: color1),)
                       ],
                     ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          //color: Colors.blue[100],
                          color: const Color(0xFF083663),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Row(
                          children: [
                            Image(image:NetworkImage("https://cdn-icons-png.flaticon.com/128/6741/6741199.png"))

                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text("Arabic", style: TextStyle(fontSize: 20,color: color1),)
                    ],
                  ),
                ),
                // const SizedBox(width: 20,),
                // Expanded(
                //   child: Column(
                //     children: [
                //       Container(
                //
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(
                //             20,
                //           ),
                //           //color: Colors.blue[100],
                //           color: const Color(0xFF083663),
                //         ),
                //         padding: EdgeInsets.all(10.0),
                //         child: const Row(
                //           children: [
                //             Image(image:NetworkImage("https://cdn-icons-png.flaticon.com/128/5003/5003987.png"))
                //
                //           ],
                //         ),
                //       ),
                //       const SizedBox(height: 10,),
                //
                //       Text("English", style: TextStyle(fontSize: 20,color: color1),)
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          

          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          //color: Colors.blue[100],
                          color: const Color(0xFF083663),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Row(
                          children: [
                            Image(image:NetworkImage("https://cdn-icons-png.flaticon.com/128/1283/1283419.png"))

                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text("Science", style: TextStyle(fontSize: 20,color: color1),)
                    ],
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          //color: Colors.blue[100],
                          color: const Color(0xFF083663),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Row(
                          children: [
                            Image(image:NetworkImage("https://cdn-icons-png.flaticon.com/128/8633/8633114.png"))

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),

                      Text("Social Studies", style: TextStyle(fontSize: 20,color: color1),)
                    ],
                  ),
                ),
                // const SizedBox(width: 20,),
                // Column(
                //   children: [
                //     Container(
                //
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(
                //           20,
                //         ),
                //         //color: Colors.blue[100],
                //         color: const Color(0xFF083663),
                //       ),
                //       padding: const EdgeInsets.all(10.0),
                //       child: const Row(
                //         children: [
                //           Image(image:NetworkImage("https://cdn-icons-png.flaticon.com/128/1753/1753751.png"))
                //
                //         ],
                //       ),
                //     ),
                //     const SizedBox(height: 10,),
                //
                //     Text("Computer", style: TextStyle(fontSize: 20,color: color1),)
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
