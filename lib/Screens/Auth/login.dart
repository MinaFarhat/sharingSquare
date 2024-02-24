// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharing_square/Screens/Auth/signup.dart';

import '../../Const/const.dart';
import '../Home/HomeScreen/home_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: NeverScrollableScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: title,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Text(
                      "Welcome Back",
                      style: GoogleFonts.sourceSerifPro(
                        color: secondColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
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
                    image: AssetImage("assets/login.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              field(
                controller: _emailController,
                nameField: "Email",
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                showObscureButton: false,
              ),
              field(
                controller: _passwordController,
                nameField: "Password",
                hintText: "Enter your password",
                keyboardType: TextInputType.visiblePassword,
                showObscureButton: true,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forget Password?",
                        style: GoogleFonts.sourceSerifPro(
                          color: secondColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                       Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
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
                          "Login",
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have Account?",
                    style: GoogleFonts.sourceSerifPro(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUp();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Signup",
                      style: GoogleFonts.sourceSerifPro(
                        color: mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
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

  Widget field({
    required TextEditingController controller,
    required String hintText,
    String? nameField,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    bool showObscureButton = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameField!,
            style: titleField,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.002,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.065,
            child: TextFormField(
              onEditingComplete: () {
                // Perform actions when "Done" is pressed
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
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
                hintText: hintText,
                hintStyle: GoogleFonts.sourceSerifPro(
                  color: const Color.fromRGBO(92, 91, 91, 0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: showObscureButton
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            if (controller == _passwordController) {
                              isPasswordVisible = !isPasswordVisible;
                            }
                          });
                        },
                        icon: Icon(
                          controller == _passwordController
                              ? isPasswordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded
                              : null,
                          color: mainColor,
                          size: 25,
                        ),
                      )
                    : null,
              ),
              keyboardType: keyboardType,
              onTap: onTap,
              textInputAction: textInputAction,
              validator: validator,
              obscureText: showObscureButton
                  ? (controller == _passwordController
                      ? !isPasswordVisible
                      : !isConfirmPasswordVisible)
                  : false,
            ),
          ),
        ],
      ),
    );
  }
}
