
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

void displaySuccessMotionToast(context, {required String mes}) {
  MotionToast.success(
    title:  const Text(
      'Success',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description:  Text(
      mes,
      style: TextStyle(fontSize: 12),
    ),
    layoutOrientation: ToastOrientation.rtl,
    animationType: AnimationType.fromRight,
    dismissable: true,
  ).show(context);
}

void displayErrorMotionToast(context, {required String mes}) {
  MotionToast.error(
    title: const Text(
      'Error',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description:  Text(mes),
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: false,
  ).show(context);
}
