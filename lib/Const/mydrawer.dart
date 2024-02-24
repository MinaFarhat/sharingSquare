import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharing_square/Const/const.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sharing_square/Screens/Home/Drawer/Change%20Password/change_password.dart';
import 'package:sharing_square/Screens/Home/Drawer/The%20Info/the_info.dart';

import '../Screens/Auth/login.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool lang = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      backgroundColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: secondColor,
              backgroundImage: const AssetImage("assets/man.jpg"),
              radius: 70,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            Text(
              "Mina Farhat",
              style: GoogleFonts.sourceSerifPro(
                color: mainColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            Text(
              "Mina.farhat@gmail.com",
              style: GoogleFonts.sourceSerifPro(
                color: secondColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Divider(
              color: mainColor,
              thickness: 4,
            ),
            rowIconAAndName(
              data: PhosphorIcons.regular.user,
              name: "The Info",
              ontap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const TheInfo();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.016,
            ),
            rowIconAAndName(
              data: PhosphorIcons.regular.googlePhotosLogo,
              name: "Change Profile Photo",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.016,
            ),
            rowIconAAndName(
              data: PhosphorIcons.regular.password,
              name: "Change password",
              ontap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangePassword();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.016,
            ),
            rowIconAAndName(
              data: PhosphorIcons.regular.globeStand,
              name: "The Language",
              ontap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Select Language",
                              style: GoogleFonts.sourceSerifPro(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      lang = true;
                                    });
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "English",
                                    style: GoogleFonts.sourceSerifPro(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: lang == true
                                            ? mainColor
                                            : const Color(0xFF959EAE),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      lang = false;
                                    });
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Arabic",
                                    style: GoogleFonts.sourceSerifPro(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: lang == false
                                            ? mainColor
                                            : const Color(0xFF959EAE),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.016,
            ),
            rowIconAAndName(
              data: PhosphorIcons.regular.userSwitch,
              name: "Logout",
              ontap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Logout",
                              style: GoogleFonts.sourceSerifPro(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              "Are you sure you want to logout?",
                              style: GoogleFonts.sourceSerifPro(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.sourceSerifPro(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const LogIn();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Logout',
                                    style: GoogleFonts.sourceSerifPro(
                                      color: mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.016,
            ),
            rowIconAAndName(
              data: PhosphorIcons.regular.trashSimple,
              name: "Delete Account",
              ontap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Delete Account",
                              style: GoogleFonts.sourceSerifPro(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              "Are you sure you want to delete your Account?",
                              style: GoogleFonts.sourceSerifPro(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.sourceSerifPro(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Delete',
                                    style: GoogleFonts.sourceSerifPro(
                                      color: Colors.red.shade700,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.016,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowIconAAndName(
      {required PhosphorIconData data,
      required String name,
      Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Icon(
                data,
                color: mainColor,
                size: 30,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.005,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                name,
                style: GoogleFonts.sourceSerifPro(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
