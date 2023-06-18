import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trypro/core/model/application_model.dart';
import 'package:trypro/core/model/assignment_from_student.dart';
import 'package:trypro/core/model/assignment_model.dart';
import 'package:trypro/core/model/student_model.dart';
import 'package:trypro/core/widgets/my_asset_image.dart';
import 'package:trypro/core/widgets/navigation.dart';
import 'package:trypro/core/widgets/show_toast.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';
import 'package:trypro/features/admin/addnew/add_user.dart';
import 'package:trypro/features/home/application/form_cubit.dart';

import '../features/chat/chat_rome_detailes.dart';
import 'cubit/layout_cubit.dart';
import '../features/parent/student_detailes.dart';
import 'model/add_new_user_model.dart';
import 'model/student_grade.dart';
import 'model/table_model.dart';

Widget showStudentList(
    {context, required StudentModel model, required int index}) {
  return GestureDetector(
    onTap: () {
      LayoutCubit.get(context)
          .getAllAssignmentStudent(level: model.level.toString());
      LayoutCubit.get(context).changeStudentIndex(index: index);
      Navigation.navigatorTo(context,  StudentDetailes(studentName: model.name.toString(),));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 10,
        child: Row(
          children: [
            const SizedBox(
              height: 120,
              width: 100,
              child: Image(
                  image: NetworkImage(
                "https://cdn-icons-png.flaticon.com/128/2995/2995467.png",
              )),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              children: [
                Text('Name : ${model.name}'),
                Text('Level : ${model.level}'),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Color color1 = const Color(0xFF151B54);
Color color2 = const Color(0xFFFFE87C);

Widget formDetailes(
    {context, required ApplicationModel model, required String IdModel}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.grey,
      elevation: 10,
      shadowColor: color1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Name : ',
                  style: TextStyle(color: color1, fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    model.name.toString(),
                    style: TextStyle(
                      color: color2,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Birth-Date : ',
                  style: TextStyle(color: color1, fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    model.birthDate.toString(),
                    style: TextStyle(color: color2, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Address : ',
                  style: TextStyle(color: color1, fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    model.address.toString(),
                    style: TextStyle(color: color2, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'ID-Number : ',
                  style: TextStyle(color: color1, fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    model.nID.toString(),
                    style: TextStyle(color: color2, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Email : ',
                  style: TextStyle(color: color1, fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    model.email.toString(),
                    style: TextStyle(color: color2, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Gender : ',
                  style: TextStyle(color: color1, fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    model.gender.toString(),
                    style: TextStyle(color: color2, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'School : ',
                  style: TextStyle(color: color1, fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    model.school.toString(),
                    style: TextStyle(color: color2, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AddNewCubit.get(context)
                            .changeIndexNavBarAdmin(index: 1);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Center(
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        FormCubit.get(context).deleteForm(formID: IdModel);
                        displaySuccessMotionToast(context,
                            mes: 'The form is deleted successfully');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget listOfAbsenceTeachr({required StudentModel model,context,index}) {
  return BlocConsumer<LayoutCubit, LayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            color: color1,
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10, bottom: 10),
            child: Center(
              child: Text(
                model.name.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Checkbox(value: LayoutCubit.get(context).attendanceStudent[index], onChanged: (value) {
                LayoutCubit.get(context).atendStudent(index: index);
                print(LayoutCubit.get(context).attendanceStudent[index]);
              }),
            ),
          ),
        ),
      ],
    ),
  );
  },
);
}

Widget listOfParent(
    {context, required AddNewUserModel model, required String id}) {
  return Center(
    child: Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            radius: 20.0,
            backgroundImage: const NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/609/609803.png'),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Text(
              model.name.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.edit),
            onPressed: () {
              showMyAlertDialog(
                  context: context,
                  function: () {},
                  massage: 'Add Student To This Parent',
                  id: id);
            },
          ),
          const SizedBox(
            width: 5.0,
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.delete),
            onPressed: () {
              LayoutCubit.get(context).deleteUser(kind: 'Parent', id: id);
              displaySuccessMotionToast(context,
                  mes: 'Parent Delete Successfully');
            },
          ),
          const SizedBox(
            width: 5.0,
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigation.navigatorTo(
                  context,
                  ChatRomePage(
                    receiverId: id,
                    model: model,
                  ));
            },
          ),
        ],
      ),
    ),
  );
}

Widget listOfTeacher(
    {context, required AddNewUserModel model, required String id}) {
  return Center(
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            radius: 20.0,
            backgroundImage: const NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/609/609803.png'),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Text(
              model.name.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.delete),
            onPressed: () {
              LayoutCubit.get(context).deleteUser(kind: 'Teacher', id: id);
              displaySuccessMotionToast(context,
                  mes: 'Parent Delete Successfully');
            },
          ),
          const SizedBox(
            width: 5.0,
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigation.navigatorTo(
                  context,
                  ChatRomePage(
                    receiverId: id,
                    model: model,
                  ));
            },
          ),
        ],
      ),
    ),
  );
}

Widget listOfAdmin(
    {context, required AddNewUserModel model, required String id}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              radius: 20.0,
              backgroundImage: const NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/609/609803.png'),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Text(
                model.name.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.chat),
              onPressed: () {
                Navigation.navigatorTo(
                    context,
                    ChatRomePage(
                      receiverId: id,
                      model: model,
                    ));
              },
            ),
          ],
        ),
      ),
    ),
  );
}

showMyAlertDialog(
    {required BuildContext context,
    required Function function,
    required String massage,
    required String id}) {
  var studentNameController = TextEditingController();
  var studentLevelController = TextEditingController();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Add"),
    onPressed: () {
      print(studentNameController.text);
      print(studentLevelController.text);
      if (studentLevelController.text != '1' &&
          studentLevelController.text != '2' &&
          studentLevelController.text != '3') {
        displayErrorMotionToast(context,
            mes: 'You must add exist level 1 or 2 or 3');
      } else {
        Navigator.of(context).pop();
        LayoutCubit.get(context).insertStudentToParent(
            parentId: id,
            name: studentNameController.text,
            level: studentLevelController.text);
        displaySuccessMotionToast(context, mes: 'You Add it successfully');
      }
      function();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Row(
      children: [
        Icon(
          Icons.warning,
          color: Colors.orange[400],
        ),
        const SizedBox(
          width: 4,
        ),
        const Text('New Student'),
      ],
    ),
    content: SizedBox(
      height: 120,
      child: Column(
        children: [
          TextFormField(
            controller: studentNameController,
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
          ),
          TextFormField(
            controller: studentLevelController,
            decoration: const InputDecoration(
              label: Text('Level [1-2-3]'),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget AssimentStudent(context, {required AssignmentModelFromStudent model}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      //padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green[200],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                  child: Text(
                '${model.fileName}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
            ),
            const SizedBox(
              width: 10.0,
            ),
            InkWell(
              onTap: () {
                LayoutCubit.get(context).downLoadFile(
                    context: context,
                    url: model.filePath.toString(),
                    fileName: model.fileName.toString());
              },
              child: Icon(
                Icons.download_for_offline,
                color: color1,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                sendAlartGrade(context: context, model: model);
              },
              child: Icon(
                Icons.send_and_archive_outlined,
                color: color1,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

sendAlartGrade({context, required AssignmentModelFromStudent model}) {
  var assignmentNoteController = TextEditingController();
  var assignmentGradeController = TextEditingController();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: color1),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("send"),
    onPressed: () {
      print(assignmentNoteController.text);
      print(assignmentGradeController.text);
      LayoutCubit.get(context).insertGradeToStudent(
          context: context,
          model: model,
          grade: assignmentGradeController.text,
          note: assignmentNoteController.text);
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Row(
      children: [
        Text('Add Grade'),
      ],
    ),
    content: SizedBox(
      height: 120,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: assignmentNoteController,
              decoration: const InputDecoration(
                label: Text('Assignment Note'),
              ),
              maxLines: 4,
              minLines: 1,
            ),
            TextFormField(
              controller: assignmentGradeController,
              decoration: const InputDecoration(
                label: Text('Grade'),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget showStudentAssignment({context, required AssignmentModel model}) {
  return Center(
    child: Container(
      padding: const EdgeInsets.only(left: 20.0, right: 8.0),
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '${model.fileName}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.download),
            onPressed: () {
              LayoutCubit.get(context).downLoadFile(
                  context: context,
                  url: model.filePath.toString(),
                  fileName: model.fileName.toString());
            },
          )
        ],
      ),
    ),
  );
}

Widget showTeatcherToSendAssignment({
  context,
  required AddNewUserModel model,
  required String teacherId,
  required String studentId,
}) {
  return Center(
    child: Container(
      padding: const EdgeInsets.only(left: 20.0, right: 8.0),
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '${model.name}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          IconButton(
            color: color1,
            icon: const Icon(Icons.send),
            onPressed: () {
              LayoutCubit.get(context).selectFileToSendAssignmentToTeatcher(
                teacherId: teacherId,
                studentId: studentId,
                context: context,
              );
            },
          )
        ],
      ),
    ),
  );
}

Widget showGradeStudent({required StudentGradeModel model}) {
  return Container(
    margin: const EdgeInsets.only(left: 8.0, right: 8.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.grey[500]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Teacher Name : ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Expanded(
              child: Text(
                '${model.teacherName}',
                style: TextStyle(fontSize: 20, color: color1),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              'Assignment Name : ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Expanded(
              child: Text(
                '${model.assignmentName}',
                style: TextStyle(fontSize: 20, color: color1),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              'Your Grade : ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Expanded(
              child: Text(
                '${model.grade}',
                style: TextStyle(fontSize: 20, color: color1),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              'Teacher Note : ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Expanded(
              child: Text(
                '${model.note}',
                style: TextStyle(fontSize: 20, color: color1),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget showListOfTable({
  context,
  required TableModel model,
  required int index,
}) {
  return Slidable(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            '${model.time}',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
            height: 80,
            width: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: color1,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ${model.subjectName}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 15),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  '${model.teacherName}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          if (LayoutCubit.get(context).userModel.kind == 'admin')
            GestureDetector(
                onTap: () {
                  LayoutCubit.get(context).deleteItemTable(
                      iD: LayoutCubit.get(context).tableListId[index],
                      date: LayoutCubit.get(context)
                          .dateTime
                          .toString()
                          .substring(0, 10));
                  LayoutCubit.get(context).getTableList(
                      dateTime: LayoutCubit.get(context)
                          .dateTime
                          .toString()
                          .substring(0, 10),
                      level: '1');
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
        ],
      ),
    ),
  );
}

showAnalysisDialog({context, required String image}) {
  // set up the buttons

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: SizedBox(
      height: 250,
      child: MyAssetImage(image: image)
    ),
    actions: [],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
