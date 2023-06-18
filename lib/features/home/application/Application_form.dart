import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/widgets/show_toast.dart';
import 'package:trypro/features/home/application/form_cubit.dart';

import '../../../core/constant.dart';

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var selected;
  var Selected2;
  String? selectedValue;
  var nameController = TextEditingController();
  var birthController = TextEditingController();
  var addressController = TextEditingController();
  var nIDController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var genderController = TextEditingController();
  var schoolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormCubit, FormStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=FormCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              child: Column(children: [
                const SizedBox(
                  height: 40.0,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'School Application',
                        style: TextStyle(color: color1, fontSize: 40),
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextFormField(
                    controller: nameController,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: const TextStyle(color: Color(0xFF1a237e)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextFormField(
                    controller: birthController,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Birth-Date',
                      labelStyle: const TextStyle(color: Color(0xFF1a237e)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextFormField(
                    controller: addressController,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: const TextStyle(color: Color(0xFF1a237e)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextFormField(
                    controller: nIDController,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'ID-Number',
                      labelStyle: const TextStyle(color: Color(0xFF1a237e)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Color(0xFF1a237e)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextFormField(
                    controller: phoneController,
                    cursorColor: color1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Number',
                      labelStyle: const TextStyle(color: Color(0xFF1a237e)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color1, width: 2)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 8),
                  width: 450,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: color1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    hint: Text(
                      'Gender',
                      style: TextStyle(color: color1),
                    ),
                    items: ['Female', 'Male']
                        .map((e) =>
                        DropdownMenuItem(
                            value: e,
                            child: Text(
                              '$e',
                              style: TextStyle(color: color1),
                            )))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selected = val;
                        genderController.text = val.toString();
                        print(genderController.text);
                      });
                    },
                    value: selected,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 8),
                  width: 450,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: color1,
                    ),
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    hint: Text(
                      'School',
                      style: TextStyle(color: color1),
                    ),
                    items: [
                      'Nile School',
                      'BIS',
                      'STEM',
                      'IG',
                    ]
                        .map((e) =>
                        DropdownMenuItem(
                            value: e,
                            child: Text(
                              '$e',
                              style: TextStyle(color: color1),
                            )))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                        schoolController.text = value.toString();
                        print(schoolController.text);
                      });
                    },
                    value: selectedValue,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                MaterialButton(
                  minWidth: 400,
                  height: 60,
                  onPressed: () {
                    if(
                    nameController.text.isEmpty||
                    birthController.text.isEmpty||
                    addressController.text.isEmpty||
                    nIDController.text.isEmpty||
                    emailController.text.isEmpty||
                    phoneController.text.isEmpty||
                    genderController.text.isEmpty||
                    schoolController.text.isEmpty
                    )
                      {
                        displayErrorMotionToast(context, mes: 'You must complete the form');
                      }
                    else {
                      cubit.addNewForm(
                          context, name: nameController.text,
                          birth: birthController.text,
                          address: addressController.text,
                          nID: nIDController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          gender: genderController.text,
                          school: schoolController.text
                      );
                    }


                  },
                  //color: Color(0xff0095FF),
                  color: const Color(0xFF083663),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Apply Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
