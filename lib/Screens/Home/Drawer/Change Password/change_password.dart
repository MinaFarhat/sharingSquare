import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sharing_square/Const/const.dart';
import 'package:sharing_square/Screens/Auth/login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          PhosphorIcons.bold.caretLeft,
                          color: mainColor,
                          size: 30,
                        ),
                      );
                    }),
                    Text(
                      "Change Password",
                      style: title,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Center(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/forgetPassword.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Password",
                      style: titleField,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.065,
                      child: TextFormField(
                        controller: _newPasswordController,
                        onEditingComplete: () {
                          // Perform actions when "Done" is pressed
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          FocusScope.of(context).unfocus();
                        },
                        style: GoogleFonts.sourceSerifPro(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        cursorColor: mainColor,
                        cursorHeight: 25,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: shadowColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Enter your new password ",
                          hintStyle: GoogleFonts.sourceSerifPro(
                            color: const Color.fromRGBO(92, 91, 91, 0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordVisible == true
                                ? Icon(
                                    Icons.visibility_rounded,
                                    color: mainColor,
                                  )
                                : Icon(
                                    Icons.visibility_off_rounded,
                                    color: mainColor,
                                  ),
                            onPressed: () {
                              if (isPasswordVisible == true) {
                                setState(() {
                                  isPasswordVisible = false;
                                });
                              } else {
                                setState(() {
                                  isPasswordVisible = true;
                                });
                              }
                            },
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPasswordVisible == true ? false : true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Password",
                      style: titleField,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.065,
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        onEditingComplete: () {
                          // Perform actions when "Done" is pressed
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          FocusScope.of(context).unfocus();
                        },
                        style: GoogleFonts.sourceSerifPro(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        cursorColor: mainColor,
                        cursorHeight: 25,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: shadowColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Enter your password again ",
                          hintStyle: GoogleFonts.sourceSerifPro(
                            color: const Color.fromRGBO(92, 91, 91, 0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          suffixIcon: IconButton(
                            icon: isConfirmPasswordVisible == true
                                ? Icon(
                                    Icons.visibility_rounded,
                                    color: mainColor,
                                  )
                                : Icon(
                                    Icons.visibility_off_rounded,
                                    color: mainColor,
                                  ),
                            onPressed: () {
                              if (isConfirmPasswordVisible == true) {
                                setState(() {
                                  isConfirmPasswordVisible = false;
                                });
                              } else {
                                setState(() {
                                  isConfirmPasswordVisible = true;
                                });
                              }
                            },
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText:
                            isConfirmPasswordVisible == true ? false : true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const LogIn();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.075,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: mainColor),
                      child: Center(
                        child: Text(
                          "Change",
                          style: GoogleFonts.sourceSerifPro(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
