import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/widgets/show_toast.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';

import '../../../core/constant.dart';
import '../CurvedBar_admin.dart';
import '../../teatcher/Login_teacher.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var dateController = TextEditingController();
  var nIDController = TextEditingController();
  var phoneController = TextEditingController();
  var passController = TextEditingController();
  var addressController = TextEditingController();
  var kindController = TextEditingController();
  bool isTeacher = false;
  bool isParent = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewCubit, AddNewState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AddNewCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Add New User',
                    style: TextStyle(
                        color: color1,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "Build an amazing school community ",
                    style: TextStyle(fontSize: 15, color: color1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                    controller: nameController,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: color1,
                      ),
                      labelText: 'name',
                      labelStyle: TextStyle(color: Color(0xFF1a237e)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: color1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFF1a237e)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: color1,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: TextFormField(
                    controller: dateController,
                    cursorColor: color1,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: color1,
                      ),
                      labelText: 'birth-date',
                      labelStyle: const TextStyle(color: Color(0xFF1a237e)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: TextFormField(
                    controller: nIDController,
                    cursorColor: color1,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_card_rounded,
                        color: color1,
                      ),
                      labelText: 'National-ID',
                      labelStyle: TextStyle(color: Color(0xFF1a237e)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: TextFormField(
                    controller: phoneController,
                    cursorColor: color1,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: color1,
                      ),
                      labelText: 'phone-number',
                      labelStyle: TextStyle(color: Color(0xFF1a237e)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: TextFormField(
                    controller: passController,
                    obscureText: true,
                    cursorColor: color1,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: color1,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xFF1a237e)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                  //   padding: EdgeInsets.all(15.0),

                  child: TextFormField(
                    controller: addressController,
                    obscureText: false,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.domain_add_rounded,
                        color: color1,
                      ),
                      labelText: 'Address',
                      labelStyle: TextStyle(color: Color(0xFF1a237e)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Teacher'),
                          Checkbox(
                              value: isTeacher,
                              onChanged: (bool? value) {
                                isTeacher = value!;
                                if (isTeacher == true) {
                                  kindController.text = 'Teacher';
                                  isParent = false;
                                }
                                cubit.emitState();
                              }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Parent'),
                          Checkbox(
                              value: isParent,
                              onChanged: (bool? value) {
                                isParent = value!;
                                if (isParent == true) {
                                  kindController.text = 'Parent';
                                  isTeacher = false;
                                }
                                cubit.emitState();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        dateController.text.isEmpty ||
                        nIDController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        passController.text.isEmpty ||
                        addressController.text.isEmpty ||
                        kindController.text.isEmpty ||
                        (isParent == false && isTeacher == false)) {
                      displayErrorMotionToast(context,
                          mes: 'You must complete form');
                      print(nameController.text);
                      print(emailController.text);
                      print(dateController.text);
                      print(nIDController.text);
                      print(phoneController.text);
                      print(passController.text);
                      print(addressController.text);
                      print(isTeacher);
                      print(isParent);
                    } else {
                      cubit.registerNewUser(context,
                          name: nameController.text,
                          email: emailController.text,
                          birth: dateController.text,
                          nID: nIDController.text,
                          phone: phoneController.text,
                          password: passController.text,
                          address: addressController.text,
                          kind: kindController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: color1, // Background color
                  ),
                  child: const Text('Submit'),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
