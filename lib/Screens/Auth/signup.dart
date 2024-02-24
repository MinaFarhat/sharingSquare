// ignore_for_file: sized_box_for_whitespace, unused_field, avoid_print, unnecessary_null_comparison

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharing_square/Const/const.dart';
import 'package:sharing_square/Screens/Auth/login.dart';

import '../Home/HomeScreen/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  File? _image;
  final picker = ImagePicker();
  String _selectedImage = '';
  UserCredential? credential;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: NeverScrollableScrollPhysics(),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Creating Account",
                  style: title,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: secondColor,
                      backgroundImage: _selectedImage.isEmpty
                          ? const AssetImage("assets/user.webp")
                          : FileImage(
                              File(_selectedImage),
                            ) as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _showImagePickerModal();
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: shadowColor,
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: mainColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
                field(
                  controller: _fullName,
                  nameField: "Full Name",
                  hintText: "Enter your full name",
                  keyboardType: TextInputType.name,
                  showObscureButton: false,
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
                field(
                  controller: _phoneNumber,
                  nameField: "Phone Number",
                  hintText: "Enter your phone number",
                  keyboardType: TextInputType.phone,
                  showObscureButton: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                              return const LogIn();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.sourceSerifPro(
                          color: mainColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
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
                        "Signup",
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
          ),
        ),
      ),
    );
  }

  void _showImagePickerModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.photo_library,
                size: 28,
                color: mainColor,
              ),
              title: Text(
                'Pick from Gallery',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_camera,
                size: 28,
                color: mainColor,
              ),
              title: Text(
                'Take a Photo',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _selectedImage = pickedImage.path;
        print('_selectedImage: $_selectedImage');
      });
    }
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
      padding: const EdgeInsets.only(top: 12),
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
