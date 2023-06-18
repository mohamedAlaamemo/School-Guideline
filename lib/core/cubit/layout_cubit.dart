import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:trypro/core/widgets/show_toast.dart';
import '../../../core/model/add_new_user_model.dart';
import '../../../core/model/message_model.dart';
import '../../../core/model/student_model.dart';
import '../../../core/network/local/cache_helper.dart';
import '../model/assignment_from_student.dart';
import '../model/assignment_model.dart';
import '../model/student_grade.dart';
import '../model/table_model.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  AddNewUserModel userModel = AddNewUserModel.name();

  void gitUserData({required String coll}) {
    emit(LayoutGitUserDataLodingState());
    FirebaseFirestore.instance
        .collection(coll)
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
      if (kDebugMode) {
        print(value.data());
      }
      userModel = AddNewUserModel.fromJson(value.data()!);
      emit(LayoutGitUserDataSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(LayoutGitUserDataErrorState());
    });
  }

  void emitState() {
    emit(LayoutEmitState());
  }

  void sendMessage({
    required String senderId,
    required String? receiverId,
    required String date,
    required String textMessage,
  }) {
    emit(LayoutSendMessageLodingState());
    SendMessageModel model = SendMessageModel.name(
        date: date,
        textMessage: textMessage,
        senderId: senderId,
        receiverId: receiverId);
    FirebaseFirestore.instance
        .collection('users chats')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(LayoutSendMessageSuccessState());
    }).catchError((error) {
      emit(LayoutSendMessageErrorState());
      if (kDebugMode) {
        print(error);
      }
    });
    FirebaseFirestore.instance
        .collection('users chats')
        .doc(receiverId)
        .collection('chats')
        .doc(senderId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(LayoutSendMessageSuccessState());
    }).catchError((error) {
      emit(LayoutSendMessageErrorState());
      if (kDebugMode) {
        print(error);
      }
    });
  }

  List<SendMessageModel> messageInChat = [];

  void getMessageInChat({
    required String senderId,
    required String? receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users chats')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      messageInChat = [];
      event.docs.forEach((element) {
        messageInChat.add(SendMessageModel.fromJson(element.data()));
        if (kDebugMode) {
          print(element.data().toString());
        }
      });
      if (kDebugMode) {
        print(messageInChat.length);
      }
      emit(LayoutGetMessageInChatState());
    });
  }


  List<AddNewUserModel> allAdminList = [];
  List<String> allAdminListId = [];
  void gitAllAdmin(context) {
    emit(LayoutGetAllAdminLodingState());
    FirebaseFirestore.instance.collection('admin').get().then((value) {
      allAdminList = [];
      allAdminListId = [];
      value.docs.forEach((element) {
        allAdminList.add(AddNewUserModel.fromJson(element.data()));
        allAdminListId.add(element.id);
      });
      emit(LayoutGetAllAdminSuccessState());
      if (userModel.kind.toString() == 'Teacher') {
        LayoutCubit.get(context).getAllParent();
        LayoutCubit.get(context).allParentList.forEach((element) {
          allAdminList.add(element);
        });
        LayoutCubit.get(context).allParentListId.forEach((element) {
          allAdminListId.add(element);
        });
      }
      if (userModel.kind.toString() == 'Parent') {
        LayoutCubit.get(context).getAllTeacher();
        LayoutCubit.get(context).allTeacherList.forEach((element) {
          allAdminList.add(element);
        });
        LayoutCubit.get(context).allTeacherListId.forEach((element) {
          allAdminListId.add(element);
        });
      }
      emit(LayoutEmitState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(LayoutGetAllAdminErrorState());
    });
  }

  void insertStudentToParent(
      {required String parentId, required String name, required String level}) {
    emit(LayoutInsertStudentToParentLodingState());
    FirebaseFirestore.instance
        .collection('Parent')
        .doc(parentId)
        .collection('students')
        .add({'name': name, 'level': level}).then((value) {
      emit(LayoutInsertStudentToParentSuccessState());
      addStudentToLevel(
          level: level, sId: value.id, value: {'name': name, 'level': level});
    }).catchError((error) {
      emit(LayoutInsertStudentToParentErrorState());
      if (kDebugMode) {
        print(error);
      }
    });
  }

  void addStudentToLevel(
      {required String sId, required String level, required var value}) {
    emit(LayoutAddStudentToLevelLodingState());
    FirebaseFirestore.instance
        .collection('level$level')
        .doc(sId)
        .set(value)
        .then((value) {
      emit(LayoutAddStudentToLevelSuccessState());
    }).catchError((error) {
      emit(LayoutAddStudentToLevelErrorState());
      if (kDebugMode) {
        print(error);
      }
    });
  }

  List<StudentModel> studentList = [];
  List<String> studentListId = [];

  void getAllStudentParent() {
    emit(LayoutGetAllStudentParentLodingState());
    FirebaseFirestore.instance
        .collection('Parent')
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('students')
        .get()
        .then((value) {
      studentListId = [];
      studentList = [];
      value.docs.forEach((element) {
        studentList.add(StudentModel.fromJson(element.data()));
        studentListId.add(element.id);
      });
      emit(LayoutGetAllStudentParentSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  List<StudentModel> studentLevel1 = [];
  List<String> studentLevel1Id = [];
  List<bool>attendanceStudent=[];
  void getAllStudentLevel({required String level}) {
    emit(LayoutGetAllStudentLevelLodingState());
    FirebaseFirestore.instance.collection('level${level}').get().then((value) {
      studentLevel1 = [];
      studentLevel1Id = [];
      attendanceStudent=[];
      value.docs.forEach((element) {
        if (element.id != 'assignment' && element.id != 'table') {
          studentLevel1.add(StudentModel.fromJson(element.data()));
          studentLevel1Id.add(element.id);
          attendanceStudent.add(false);
        }
      });
      if (kDebugMode) {
        print(studentLevel1.length);
      }
      emit(LayoutGetAllStudentLevelSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(LayoutGetAllStudentLevelErrorState());
    });
  }

  void attendStudent({
  required int index
}){
    int i=0;
    emit(LayoutInitial());
    attendanceStudent.forEach((element) {
      if(i==index) {
        attendanceStudent[index]=!attendanceStudent[index];
      } else {
        attendanceStudent[index]=false;
      }
    });
    emit(LayoutEmitState());
  }
  File? assignmentFile;
  Future<void> selectFile({context, required String level}) async {
    emit(LayoutSelectFileLodingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      emit(LayoutSelectFileSuccessState());
      File assignmentFile = File(result.files.single.path ?? '');
      PlatformFile file = result.files.first;
      FirebaseStorage.instance
          .ref()
          .child('assignments/${file.name}')
          .putFile(assignmentFile)
          .then((value) {
        emit(LayoutUploadFileSuccessState());
        value.ref.getDownloadURL().then((value) {
          if (kDebugMode) {
            print(value.toString());
          }
          emit(LayoutGetDownloadURLSuccessState());
          addFileAssignment(
              context: context,
              fileName: file.name,
              filePath: value.toString(),
              level: level);
        }).catchError((error) {
          if (kDebugMode) {
            print(error.toString());
          }
          emit(LayoutGetDownloadURLErrorState());
        });
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
        emit(LayoutUploadFileErrorState());
      });
    } else {
      // User canceled the picker
      emit(LayoutSelectFileErrorState());
    }
  }

  void addFileAssignment(
      {context,
      required String? fileName,
      required String? filePath,
      required String level}) {
    emit(LayoutAddFileAssignmentLodingState());
    Map<String, dynamic> data = {'fileName': fileName, 'filePath': filePath};
    FirebaseFirestore.instance
        .collection('Teacher')
        .doc('${CacheHelper.getData(key: 'uId')}')
        .collection('assignment')
        .add(data)
        .then((value) {
      emit(LayoutAddFileAssignmentSuccess1State());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LayoutAddFileAssignmentError1State());
    });
    FirebaseFirestore.instance
        .collection('level$level')
        .doc('assignment')
        .collection('all')
        .add(data)
        .then((value) {
      emit(LayoutAddFileAssignmentSuccess2State());
      displaySuccessMotionToast(context,
          mes: 'Your Assignment Added Successfully');
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LayoutAddFileAssignmentError2State());
    });
  }

  List<bool> assignmentLevel = [true, false, false];

  void chooseAssignmentLevel({required int index}) {
    if (index == 0) {
      assignmentLevel[0] = true;

      assignmentLevel[1] = false;
      assignmentLevel[2] = false;
    } else if (index == 1) {
      assignmentLevel[1] = true;

      assignmentLevel[0] = false;
      assignmentLevel[2] = false;
    } else if (index == 2) {
      assignmentLevel[2] = true;

      assignmentLevel[0] = false;
      assignmentLevel[1] = false;
    }
    emit(LayoutChooseAssignmentLeveSuccessState());
  }

  List<AssignmentModel> allStudentAssignmentLevelList = [];

  void getAllAssignmentStudent({required String level}) {
    emit(LayoutGetAllAssignmentStudentLodingState());
    FirebaseFirestore.instance
        .collection('level$level')
        .doc('assignment')
        .collection('all')
        .get()
        .then((value) {
      allStudentAssignmentLevelList = [];
      value.docs.forEach((element) {
        allStudentAssignmentLevelList
            .add(AssignmentModel.fromJson(element.data()));
      });
      if (kDebugMode) {
        print(allStudentAssignmentLevelList.length);
      }

      emit(LayoutGetAllAssignmentStudentSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LayoutGetAllAssignmentStudentErrorState());
    });
  }

  File? sendAssignmentFile;

  Future<void> selectFileToSendAssignmentToTeatcher(
      {context, required String teacherId, required String studentId}) async {
    emit(LayoutSelectFileToSendAssignmentToTeatcherLodingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      emit(LayoutSelectFileToSendAssignmentToTeatcherSuccessState());

      File sendAssignmentFile = File(result.files.single.path ?? '');
      PlatformFile file = result.files.first;
      if (kDebugMode) {
        print(file.name);
      }
      if (kDebugMode) {
        print(file.path);
      }
      FirebaseStorage.instance
          .ref()
          .child('assignmentsFromStudent/${file.name}')
          .putFile(sendAssignmentFile)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          if (kDebugMode) {
            print(value.toString());
          }
          addFileAssignmentToTeacher(
              context: context,
              fileName: file.name,
              filePath: value.toString(),
              studentId: studentId,
              teacherId: teacherId);
        }).catchError((error) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
        emit(LayoutSelectFileToSendAssignmentToTeatcherErrorState());
      });
    }
  }

  void addFileAssignmentToTeacher({
    context,
    required String teacherId,
    required String studentId,
    required String fileName,
    required String filePath,
  }) {
    emit(LayoutAddFileAssignmentToTeacherLodingState());
    Map<String, dynamic> data = {
      'studentId': studentId,
      'fileName': fileName,
      'filePath': filePath,
      'parentId': CacheHelper.getData(key: 'uId')
    };
    FirebaseFirestore.instance
        .collection('Teacher')
        .doc(teacherId)
        .collection('assignmentFromStudent')
        .add(data)
        .then((value) {
      emit(LayoutAddFileAssignmentToTeacherSuccessState());
      displaySuccessMotionToast(context, mes: 'Submitted SuccessFully');
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(LayoutAddFileAssignmentToTeacherErrorState());
    });
  }

  List<AddNewUserModel> allTeacherList = [];
  List<String> allTeacherListId = [];

  void getAllTeacher() {
    emit(GetAllTeacherLodingState());
    FirebaseFirestore.instance.collection('Teacher').get().then((value) {
      allTeacherList = [];
      allTeacherListId = [];
      value.docs.forEach((element) {
        allTeacherListId.add(element.id);
        allTeacherList.add(AddNewUserModel.fromJson(element.data()));
      });
      emit(GetAllTeacherSuccessState());
    }).catchError((error) {
      emit(GetAllTeacherErrorState());
    });
  }

  List<AddNewUserModel> allParentList = [];
  List<String> allParentListId = [];

  void getAllParent() {
    FirebaseFirestore.instance.collection('Parent').get().then((value) {
      emit(GetAllParentSuccessState());
      allParentList = [];
      allParentListId = [];
      value.docs.forEach((element) {
        allParentListId.add(element.id);
        allParentList.add(AddNewUserModel.fromJson(element.data()));
      });
      emit(GetAllParentLodingState());
    }).catchError((error) {
      emit(GetAllParentErrorState());
    });
  }

  int studentIndex = 0;

  void changeStudentIndex({required int index}) {
    studentIndex = index;
    emit(LayoutEmitState());
  }

  void deleteUser({
    required String kind,
    required String id,
  }) {
    emit(DeleteUserLodingState());
    FirebaseFirestore.instance.collection(kind).doc(id).delete();
    emit(DeleteUserState());
    getAllParent();
    getAllTeacher();
  }

  List<AssignmentModelFromStudent> allAssignmentFromStudentList = [];

  void getAllAssignmentFromStudentToTeacher() {
    emit(LayoutGetAllAssignmentFromStudentToTeacherLodingState());
    if (kDebugMode) {
      print(CacheHelper.getData(key: 'uId'));
    }
    FirebaseFirestore.instance
        .collection('Teacher')
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('assignmentFromStudent')
        .get()
        .then((value) {
      allAssignmentFromStudentList = [];
      value.docs.forEach((element) {
        allAssignmentFromStudentList
            .add(AssignmentModelFromStudent.fromJson(element.data()));
      });
      if (kDebugMode) {
        print(allAssignmentFromStudentList.length);
      }
      emit(LayoutGetAllAssignmentFromStudentToTeacherSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LayoutGetAllAssignmentFromStudentToTeacherErrorState());
    });
  }

  void insertGradeToStudent(
      {context,
      required AssignmentModelFromStudent model,
      required String grade,
      required String note}) {
    emit(LayoutInsertGradeToStudentLodingState());
    Map<String, dynamic> data = {
      'grade': grade,
      'note': note,
      'teacherName': LayoutCubit.get(context).userModel.name,
      'assignmentName': model.fileName
    };
    FirebaseFirestore.instance
        .collection('Parent')
        .doc(model.parentId)
        .collection('students')
        .doc(model.studentId)
        .collection('grade')
        .add(data)
        .then((value) {
      emit(LayoutInsertGradeToStudentSuccessState());
      displaySuccessMotionToast(context, mes: 'Grade Added Successfully');
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LayoutInsertGradeToStudentErrorState());
    });
  }

  List<StudentGradeModel> studentGradeList = [];

  void getAllGradeForStudent({
    context,
  }) {
    emit(LayoutGetAllGradeForStudentLodingState());
    FirebaseFirestore.instance
        .collection('Parent')
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('students')
        .doc(LayoutCubit.get(context)
            .studentListId[LayoutCubit.get(context).studentIndex])
        .collection('grade')
        .get()
        .then((value) {
      studentGradeList = [];
      value.docs.forEach((element) {
        studentGradeList.add(StudentGradeModel.fromJson(element.data()));
      });
      if (kDebugMode) {
        print(studentGradeList.length);
      }
      emit(LayoutGetAllGradeForStudentSuccessState());
    }).catchError((error) {
      emit(LayoutGetAllGradeForStudentErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void downLoadFile ({
    context,
    required String url,
    required String fileName
  }) async{
    emit(LayoutDownLoadFileLodingState());

    FileDownloader.downloadFile(
        url: url,
        name: fileName,
        onDownloadCompleted: (String path) {
          if (kDebugMode) {
            print('FILE DOWNLOADED TO PATH: $path');
          }
          displaySuccessMotionToast(context, mes: 'Go To $path');
          emit(LayoutDownLoadFileSuccessState());
        },
        onDownloadError: (String error) {
          if (kDebugMode) {
            print('DOWNLOAD ERROR: $error');
          }
          emit(LayoutDownLoadFileErrorState());
        });

  }
  
  
  
  
  void insertTable({
  context,
    required String date,
    required String subjectName,
    required String teacherName,
    required String time
}){
    
    emit(LayoutInsertTableLodingState());
    Map<String,dynamic>data={
      'subjectName':subjectName,
      'teacherName':teacherName,
      'time':time
    };
    FirebaseFirestore.instance
    .collection('level1')
    .doc('table')
    .collection(date)
    .add(data)
    .then((value){
      Navigator.pop(context);
      emit(LayoutInsertTableSuccessState());
      displaySuccessMotionToast(context, mes: 'Added Successfully');
    })
    .catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LayoutInsertTableErrorState());
    });
  }



  List<TableModel>tableList=[];
  List<String>tableListId=[];
  void getTableList({
  required String dateTime,
    required String level
}){
    emit(LayoutGetTableListLodingState());

    FirebaseFirestore.instance
    .collection('level$level')
    .doc('table')
    .collection(dateTime)
    .get()
    .then((value) {
      tableList=[];tableListId=[];
      value.docs.forEach((element) {
        tableList.add(TableModel.fromJson(element.data()));
        tableListId.add(element.id);
      });
      if (kDebugMode) {
        print(tableList.length);
      }
      emit(LayoutGetTableListSuccessState());
    })
    .catchError((error){
      if (kDebugMode) {
        print(error);
      }
      emit(LayoutGetTableListErrorState());
    });

  }
  


  var dateTime=DateTime.now();

  void changeDate({
  required var date
})
{
  dateTime=date;
  emit(LayoutEmitState());
}


  void deleteItemTable({
  required String iD,
  required String date,
}){
    emit(LayoutDeleteItemTableLodingState());
    FirebaseFirestore.instance
        .collection('level1')
        .doc('table')
        .collection(date)
        .doc(iD)
        .delete().then((value) {
          emit(LayoutDeleteItemTableSuccessState());
    });
  }

}

