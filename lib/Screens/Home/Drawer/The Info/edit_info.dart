import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../Const/const.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key});

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final TextEditingController _accountController = TextEditingController();

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: NeverScrollableScrollPhysics(),
        ),
        child: Padding(
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
                      "Edit-Info",
                      style: title,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        PhosphorIcons.bold.check,
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
                height: MediaQuery.of(context).size.height * 0.915,
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
                      controller: _accountController,
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

  Widget accountField({
    required PhosphorIconData data,
    required String title,
    required String content,
    required BuildContext context,
    required TextEditingController controller,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    bool showObscureButton = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        onLongPress: () {},
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.065,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: shadowColor,
              ),
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
                  hintText: content,
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
      ),
    );
  }
}
