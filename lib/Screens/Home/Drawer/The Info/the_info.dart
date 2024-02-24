import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sharing_square/Const/const.dart';

import 'edit_info.dart';

class TheInfo extends StatefulWidget {
  const TheInfo({super.key});

  @override
  State<TheInfo> createState() => _TheInfoState();
}

class _TheInfoState extends State<TheInfo> {
  List<Map<String, dynamic>> accountFriend = [
    {
      "title": "Phone Number",
      "content": "0955666222",
      "icon": PhosphorIcons.regular.phone,
    },
    {
      "title": "Google",
      "content": "mina.farhat@gmail.com",
      "icon": PhosphorIcons.regular.googleLogo,
    },
    {
      "title": "Facebook",
      "content": "https//ljhalhflkaflknlkalflamdfnnl",
      "icon": PhosphorIcons.regular.facebookLogo,
    },
    {
      "title": "Telegram",
      "content": "@minafarhat",
      "icon": PhosphorIcons.regular.telegramLogo,
    },
    {
      "title": "Instagram",
      "content": "https/kjdfjhlahflkaj;kfj;aljf;lj;kajf;kjsakdvlnsnl",
      "icon": PhosphorIcons.regular.instagramLogo,
    },
    {
      "title": "Telegram",
      "content": "@minafarhat",
      "icon": PhosphorIcons.regular.telegramLogo,
    },
    {
      "title": "Telegram",
      "content": "@minafarhat",
      "icon": PhosphorIcons.regular.telegramLogo,
    },
    {
      "title": "Telegram",
      "content": "@minafarhat",
      "icon": PhosphorIcons.regular.telegramLogo,
    },
    {
      "title": "Telegram",
      "content": "@minafarhat",
      "icon": PhosphorIcons.regular.telegramLogo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
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
                    "The Info",
                    style: title,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const EditInfo();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      PhosphorIcons.bold.pencilSimple,
                      color: mainColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.88,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: accountFriend.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return accountField(
                    data: accountFriend[index]["icon"],
                    title: accountFriend[index]["title"],
                    content: accountFriend[index]["content"],
                    context: context,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget accountField({
    required PhosphorIconData data,
    required String title,
    required String content,
    required BuildContext context,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        onLongPress: () {
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
                        "Delete your ${accountFriend[index]["title"]}",
                        style: GoogleFonts.sourceSerifPro(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        "Are you sure you want to delete your ${accountFriend[index]["title"]}",
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
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
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
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  data,
                  color: mainColor,
                  size: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.005,
                ),
                Text(
                  title,
                  style: GoogleFonts.sourceSerifPro(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              // width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: shadowColor,
              ),
              child: IntrinsicWidth(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 5, right: 8),
                  child: Text(
                    content,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sourceSerifPro(
                      color: const Color(0xFF1E1E1E),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
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
}
