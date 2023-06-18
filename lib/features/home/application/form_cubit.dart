import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/model/application_model.dart';
import '../../../core/widgets/show_toast.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormStates> {
  FormCubit() : super(FormInitial());

  static FormCubit get(context) => BlocProvider.of(context);

  void addNewForm(
    context, {
    required String name,
    required String birth,
    required String address,
    required String nID,
    required String email,
    required String phone,
    required String gender,
    required String school,
  }) {
    ApplicationModel model = ApplicationModel.name(
      email: email,
      phone: phone,
      name: name,
      address: address,
      birthDate: birth,
      gender: gender,
      nID: nID,
      school: school,
    );
    emit(AddNewFormLodingStates());
    FirebaseFirestore.instance
        .collection('forms')
        .add(model.toMap())
        .then((value) {
      emit(AddNewFormSuccessStates());
      displaySuccessMotionToast(context, mes: 'You have apply successfully');
    }).catchError((error) {
      emit(AddNewFormErrorStates());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  List<ApplicationModel> allFormList = [];
  List<String> allFormListID = [];

  void getAllForm(context) {
    emit(GetAllFormLodingStates());
    FirebaseFirestore.instance.collection('forms').get().then((value) {
      emit(GetAllFormASuccessStates());
      allFormList = [];
      allFormListID = [];
      value.docs.forEach((element) {
        allFormListID.add(element.id);
        allFormList.add(ApplicationModel.fromJson(element.data()));
      });
    }).catchError((error) {
      emit(GetAllFormErrorStates());
      displayErrorMotionToast(context, mes: 'Invalid Data');
      print(error);
    });
  }

  void deleteForm({context, required var formID}) {
    emit(DeleteFormLodingStates());
    FirebaseFirestore.instance.collection('forms').doc(formID).delete();
    emit(DeleteFormASuccessStates());
    getAllForm(context);
  }
}
