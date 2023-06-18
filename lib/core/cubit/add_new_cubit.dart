import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/add_new_user_model.dart';
import '../widgets/show_toast.dart';
part 'add_new_state.dart';

class AddNewCubit extends Cubit<AddNewState> {
  AddNewCubit() : super(AddNewInitial());

  static AddNewCubit get(context) => BlocProvider.of(context);

  void emitState() {
    emit(AddNewEmit());
  }

  int indexNavBarAdmin = 0;

  void changeIndexNavBarAdmin({
    required int index
  }) {
    indexNavBarAdmin = index;
    emit(AddNewChangeIndexNavBarAdmin());
  }


  void registerNewUser(context,
      {
        required String name,
        required String email,
        required String birth,
        required String nID,
        required String phone,
        required String password,
        required String address,
        required String kind
      }) {
    emit(RegisterNewUserLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
          context,
          nID: nID,
          address: address,
          name: name,
          phone: phone,
          email: email,
          kind: kind,
          birth: birth,
          password: password,
          uId: value.user!.uid
      );
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      displayErrorMotionToast(context, mes: 'Invalid Data',);
      emit(RegisterNewUserErrorState());
    });
  }


  void createUser(context, {
    required String name,
    required String email,
    required String birth,
    required String nID,
    required String phone,
    required String password,
    required String address,
    required String kind,
    required String uId

  }) {
    AddNewUserModel model = AddNewUserModel.name(
        nID: nID,
        address: address,
        name: name,
        phone: phone,
        email: email,
        kind: kind,
        birthDate: birth,
        password: password
    );
    emit(CreateUserLodingState());
    FirebaseFirestore.instance.collection(kind)
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
      displaySuccessMotionToast(context, mes: 'You have Add successfully');
    }).catchError((error) {
      emit(CreateUserErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


}
