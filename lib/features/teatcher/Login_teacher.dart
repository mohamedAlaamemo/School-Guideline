import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/cubit/login_cubit.dart';
import '../../core/constant.dart';
import 'CurvedBar_teacher.dart';

class Loginteacher extends StatelessWidget {
  @override
  var emailController = TextEditingController();
  var passController = TextEditingController();

  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white70,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                         Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold,color: color1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                          child: Text(
                            "Easily connect and communication with all of your families",
                            style:
                                TextStyle(fontSize: 15, color: Colors.grey[700]),
                          ),
                        ),
                        const SizedBox(height: 15.0,),
                        Text(
                          "Build an amazing classroom community",
                          style: TextStyle(
                              fontSize: 15,
                              color: color1,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          inputFile(
                              label: "Email", controller: emailController),
                          inputFile(
                              label: "Password",
                              obscureText: true,
                              controller: passController)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                      child: MaterialButton(
                        minWidth: 400,
                        height: 60,
                        onPressed: () {
                          LoginCubit.get(context).UserLogin(context,
                              email: emailController.text,
                              password: passController.text,
                              kind: 'Teacher');
                        },
                        color: const Color(0xFF083663),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
