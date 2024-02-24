// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sharing_square/Const/const.dart';

class FriendDetails extends StatelessWidget {
  String image;
  String name;
  FriendDetails({required this.image, required this.name, super.key});
  List<Map<String, dynamic>> accountFriend = [
    {
      "title": "The Phone Number",
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
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          //color: mainColor,
                        ),
                        child: Center(
                          child: Icon(
                            PhosphorIcons.bold.caretLeft,
                            color: mainColor,
                            size: 30,
                          ),
                        ),
                      ),
                    );
                  }),
                  Text(
                    name,
                    style: title,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.13,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: secondColor,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(
              color: mainColor,
              thickness: 3,
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.58,
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
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
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
    );
  }
}
