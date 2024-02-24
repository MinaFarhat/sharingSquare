// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharing_square/Const/const.dart';

import 'friend_details.dart';

class TheInfoComponent extends StatefulWidget {
  String image;
  String name;
  TheInfoComponent({required this.image, required this.name, super.key});

  @override
  State<TheInfoComponent> createState() => _TheInfoComponentState();
}

class _TheInfoComponentState extends State<TheInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return FriendDetails(
                image: widget.image,
                name: widget.name,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: secondColor,
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.006,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              widget.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSerifPro(
                color: mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
