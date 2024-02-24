// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../Const/const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 8),
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
                      child: Icon(
                        PhosphorIcons.bold.caretLeft,
                        color: mainColor,
                        size: 30,
                      ),
                    );
                  }),
                  Text(
                    "Search",
                    style: title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: const Center(),
                  ),
                ],
              ),
            ),
            field(controller: _searchController, hintText: "Search for people"),
          ],
        ),
      ),
    );
  }

  Widget field({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
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
