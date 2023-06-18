import 'package:flutter/material.dart';
import 'package:trypro/core/cubit/layout_cubit.dart';
import 'package:trypro/core/widgets/show_toast.dart';

import 'Add_secdual.dart';


class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}
class _AddTaskState extends State<AddTask> {
  Color color1 = Color(0xFF151B54);
  var formKey=GlobalKey<FormState>();
  var teacherNameController=TextEditingController();
  var subjectController = TextEditingController();
  var levelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Table',
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: color1)),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Teacher Name'),
              controller: teacherNameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Subject Name',
              ),
              controller: subjectController,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Select Date:',
              style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: 14),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                showTakeDatePicker();
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  MyDateUtils.formatTaskDate(selecteddate),
                  style: TextStyle(color: color1),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showTaketimePicker();
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  TimeOfDay.now().toString(),
                  style: TextStyle(color: color1),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: color1,
                  onPrimary: color1,
                ),
                onPressed: (){
                  if(teacherNameController.text.isNotEmpty&&subjectController.text.isNotEmpty)
                    {
                      LayoutCubit.get(context).insertTable(
                         context: context,
                          date: selecteddate.toString().substring(0,10),
                          subjectName: subjectController.text,
                          teacherName: teacherNameController.text,
                        time:selectedTime.format(context).toString()
                  );
                    }
                  else
                    {
                      displayErrorMotionToast(context, mes: 'You must insert all data');
                    }
                }, child: const Text('Submit',style: TextStyle(color: Colors.white70),))
          ],
        ),
      ),
    );
  }
  var selecteddate=DateTime.now();
  void showTakeDatePicker () async{
    var userSelectedDate =await showDatePicker(context: context,
        initialDate: selecteddate,
        firstDate: DateTime.now()
        , lastDate:DateTime.now().add(Duration(days: 365)));
    if(userSelectedDate==null ) {
      return ; }
    setState(() {
      selecteddate = userSelectedDate;
      print(selecteddate.toString());
    });

  }

  var selectedTime=TimeOfDay.now();
  void showTaketimePicker () async{
    var userSelectedTime =await showTimePicker(context: context,
         initialTime: TimeOfDay.now()
    );
    if(userSelectedTime==null ) {
      return ; }
    setState(() {
      selectedTime = userSelectedTime;
      print(selectedTime.format(context).toString());
    });

  }



}