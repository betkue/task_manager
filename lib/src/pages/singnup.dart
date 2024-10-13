import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/blocs/text-input.dart';
import 'package:task_manager/src/functions/firebase-auth.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController(); //mail
  final passController = TextEditingController(); //password
  RegExp regExp =
      RegExp(r"^[a-zA-Z0-9._\-*ù^&éè#!§]+@[a-z0-9._-]+\.[a-z]{2,6}");
  bool load = false;

  @override
  void dispose() {
    mailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double radius = height / 60;
    double width_message = (width - 32) / 3;
    final serviceProvider = Provider.of<ServiceProvider>(context); // provider

    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                height: media.height * 1,
                width: media.width * 1,
                padding: EdgeInsets.all(32),
                decoration: const BoxDecoration(
                  color: backgroundPage,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(media.width * 0.01),
                      width: media.width * 0.429,
                      height: media.width * 0.429,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      width: width,
                      margin: EdgeInsets.only(bottom: height / 50),
                      child: Text(
                        "Let's sign you in",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: height / 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: width,
                      margin: EdgeInsets.only(bottom: height / 100),
                      child: Text(
                        "Welcome back.",
                        style: TextStyle(
                            color: gray2Color,
                            fontSize: height / 35,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      width: width,
                      margin: EdgeInsets.only(bottom: height / 50),
                      child: Text(
                        "You have been missed.",
                        style: TextStyle(
                            color: gray2Color,
                            fontSize: height / 35,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 10),
                    //   child: Form(
                    //       key: formKey,
                    //       child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Padding(
                    //               padding: EdgeInsets.only(bottom: height / 50),
                    //               child: TextFormField(
                    //                 cursorColor: blackColor,
                    //                 keyboardType: TextInputType.text,
                    //                 controller: mailController,
                    //                 style: TextStyle(
                    //                   color: gray2Color,
                    //                   fontSize: height / 55,
                    //                   fontWeight: FontWeight.w500,
                    //                 ),
                    //                 decoration:
                    //                     textInputDecoration(context).copyWith(
                    //                   hintText: 'Email',
                    //                   contentPadding: EdgeInsets.only(left: 15),
                    //                   hintStyle: TextStyle(
                    //                     color: gray2Color,
                    //                     fontSize: height / 55,
                    //                     fontWeight: FontWeight.w500,
                    //                   ),
                    //                 ),
                    //                 validator: (value) {
                    //                   if (!regExp.hasMatch(value.toString())) {
                    //                     return 'Your email is not correct ';
                    //                   }
                    //                   return null;
                    //                 },
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.only(top: height / 50),
                    //               child: TextFormField(
                    //                 cursorColor: blackColor,
                    //                 controller: passController,
                    //                 obscureText: true,
                    //                 style: TextStyle(
                    //                     color: gray2Color,
                    //                     fontSize: height / 55,
                    //                     fontWeight: FontWeight.w500),
                    //                 decoration: textInputDecoration(context)
                    //                     .copyWith(
                    //                         contentPadding:
                    //                             EdgeInsets.only(left: 15),
                    //                         hintText: 'Password',
                    //                         hintStyle: TextStyle(
                    //                             color: gray2Color,
                    //                             fontSize: height / 55,
                    //                             fontWeight: FontWeight.w500)),
                    //                 validator: (value) {
                    //                   if (value!.isEmpty) {
                    //                     return 'Entrer a good pass';
                    //                   }
                    //                   return null;
                    //                 },
                    //               ),
                    //             ),
                    //           ])),
                    // ),

                    // Container(
                    //   width: width,
                    //   margin: EdgeInsets.only(top: 10, bottom: 10),

                    // ),
                    // GestureDetector(
                    //   onTap: () async {
                    //     if (formKey.currentState!.validate()) {}
                    //   },
                    //   child: Container(
                    //     width: width,
                    //     height: height / 15,
                    //     margin: EdgeInsets.symmetric(horizontal: 30),
                    //     decoration: BoxDecoration(
                    //       color: orangeColor,
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(radius),
                    //       ),
                    //     ),
                    //     child: const Center(
                    //       child: Text(
                    //         "Sign In",
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(color: Colors.white, fontSize: 16),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                        padding: const EdgeInsets.all(0),
                        minWidth: 81,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: height / 15,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              load ? " Load ... " : '   Sign with Google',
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (!load) {
                            setState(() {
                              load = true;
                            });
                            await signInWithGoogle(context, serviceProvider);
                            setState(() {
                              load = false;
                            });
                          }
                        }),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
