import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class attendParent extends StatefulWidget {
  const attendParent({Key? key}) : super(key: key);

  @override
  State<attendParent> createState() => _attendState();
}

class _attendState extends State<attendParent> {
  DateTime today =DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today=day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(child: content()),
    );
  }
  Widget content(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("Selected Day ="+today.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
              headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day , today),
              focusedDay: today,
              firstDay: DateTime.utc(2010,10,16),
              lastDay: DateTime.utc(2030,3,14),
              onDaySelected: _onDaySelected,

            ),
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 130.0,),
              Container(
                  height: 90,
                  width:95 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.red[200],
                  ),

                  child: Column(

                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Text("Total Absent",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text("1",style: TextStyle(color: Colors.red[200],fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            height:50 ,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),

                          ),
                        ],
                      )
                    ],
                  )

              ),

              SizedBox(width: 30,),
              Container(
                  height: 90,
                  width:95 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.green[200],
                  ),

                  child: Column(

                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Text("Total Present",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text("1",style: TextStyle(color: Colors.green[200],fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            height:50 ,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),

                          ),
                        ],
                      )
                    ],
                  )

              ),
            ],
          ),

        ],
      ),
    );
  }
}
