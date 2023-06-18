import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trypro/core/widgets/navigation.dart';
import '../../features/admin/CurvedBar_admin.dart';
import 'layout_cubit.dart';
import '../../features/parent/CurvedNavigationBar.dart';
import '../../features/teatcher/CurvedBar_teacher.dart';
import '../network/local/cache_helper.dart';
import '../widgets/show_toast.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);

  void UserLogin(context,
      {
        required String email,
        required String password,
        required String kind,
      }) {
    emit(UserLoginLodingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      print(CacheHelper.getData(key: 'uId'));
      if(kind=='admin')
        {
          CacheHelper.saveData(key: 'kind', value: 'admin');
          Navigation.navigatorAndFinished(context,  NavigationBarAdmin());
        }
      else if(kind=='Parent')
        {
          CacheHelper.saveData(key: 'kind', value: 'Parent');
          LayoutCubit.get(context).getAllStudentParent();
          Navigation.navigatorAndFinished(context, navigationbar());
        }
      else if(kind=='Teacher')
        {
          CacheHelper.saveData(key: 'kind', value: 'Teacher');
          Navigation.navigatorAndFinished(context, navigationbarteacher());
        }
      displaySuccessMotionToast(context,mes: 'You have login successfully');
      emit(UserLoginSuccessState());
      print(value.user!.uid);
      LayoutCubit.get(context).gitUserData(coll: kind);
    }).catchError((error) {
      emit(UserLoginErrorState());
      displayErrorMotionToast(context,mes: 'Invalid Data');
      print(error);
    });
  }

}
