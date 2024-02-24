// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharing_square/Const/const.dart';

import '../Home/HomeScreen/home_screen.dart';

// ignore: must_be_immutable
class AddAccounts extends StatefulWidget {
  String imageProfile;
  AddAccounts({required this.imageProfile, super.key});

  @override
  State<AddAccounts> createState() => _AddAccountsState();
}

class _AddAccountsState extends State<AddAccounts> {
  final TextEditingController _accountController = TextEditingController();
  List<Map<String, dynamic>> accounts = [
    {
      "name": "Instagram",
      "imageLogo": "assets/instagram.webp",
    },
    {
      "name": "TikTok",
      "imageLogo": "assets/tiktok.png",
    },
    {
      "name": "X",
      "imageLogo": "assets/x.png",
    },
    {
      "name": "Pinterest",
      "imageLogo": "assets/pinterest.png",
    },
    {
      "name": "Reddit",
      "imageLogo": "assets/reddit.png",
    },
    {
      "name": "Linkedin",
      "imageLogo": "assets/linkedin.png",
    },
    {
      "name": "Snapchat",
      "imageLogo": "assets/snapchat.png",
    },
    {
      "name": "WeChat",
      "imageLogo": "assets/wechat.jpg",
    },
    {
      "name": "Line",
      "imageLogo": "assets/line.png",
    },
    {
      "name": "Quora",
      "imageLogo": "assets/quora.webp",
    },
    {
      "name": "Tumblr",
      "imageLogo": "assets/tumblr.png",
    },
    {
      "name": "Hike",
      "imageLogo": "assets/hike.webp",
    },
    {
      "name": "Medium",
      "imageLogo": "assets/medium.webp",
    },
    {
      "name": "PLANOLY",
      "imageLogo": "assets/planoly.jpg",
    },
  ];
  List<String> appAccounts = ["Google", "Facebook", "Telegram"];
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 29,
                      backgroundImage: widget.imageProfile.isEmpty
                          ? const AssetImage("assets/user.webp")
                          : FileImage(
                              File(widget.imageProfile),
                            ) as ImageProvider,
                      backgroundColor: secondColor,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(accounts.length);
                            showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          color: mainColor,
                                          child: Center(
                                            child: Text(
                                              "Choose Account",
                                              style: GoogleFonts.sourceSerifPro(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.53,
                                            child: GridView.builder(
                                              physics:
                                                  const BouncingScrollPhysics(
                                                parent: ClampingScrollPhysics(),
                                              ),
                                              itemCount: accounts.length,
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 6 / 2.5,
                                                crossAxisSpacing: 0,
                                                mainAxisSpacing: 0,
                                              ),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (!appAccounts.contains(
                                                          accounts[index]
                                                              ["name"])) {
                                                        appAccounts.add(
                                                            accounts[index]
                                                                ["name"]);
                                                        Navigator.of(context)
                                                            .pop();
                                                      } else {
                                                        Navigator.of(context)
                                                            .pop();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            duration:
                                                                const Duration(
                                                                    seconds: 2),
                                                            content: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.05,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "This account is already choosen!",
                                                                  style: GoogleFonts
                                                                      .sourceSerifPro(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                              accounts[index]
                                                                  ["imageLogo"],
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.008,
                                                      ),
                                                      Text(
                                                        accounts[index]["name"],
                                                        style: GoogleFonts
                                                            .sourceSerifPro(
                                                          color: mainColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: mainColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.007,
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
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                color: mainColor,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: GoogleFonts.sourceSerifPro(
                                  color: mainColor,
                                  fontSize: 18,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Accounts",
                style: GoogleFonts.sourceSerifPro(
                  color: mainColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "Add 3 or more from your accounts you have and enjoy to share your accounts by scanning your phone QR",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSerifPro(
                    color: secondColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.73,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: appAccounts.length,
                  shrinkWrap: true,
                  itemBuilder: (contex, index) {
                    return field(
                      controller: _accountController,
                      hintText: "Enter your ${appAccounts[index]} name",
                      nameField: appAccounts[index],
                    );
                  },
                ),
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
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
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
          SizedBox(
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
              ),
              keyboardType: keyboardType,
              onTap: onTap,
              textInputAction: textInputAction,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
