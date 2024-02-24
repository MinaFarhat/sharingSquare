import 'package:flutter/material.dart';
import 'package:sharing_square/Const/const.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../Const/mydrawer.dart';
import 'friend_component.dart';
import '../Search/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> friends = [
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
    {
      "image": "assets/woman.jpg",
      "name": "Linda Farhat",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
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
                        Scaffold.of(context).openDrawer();
                      },
                      child: Icon(
                        PhosphorIcons.bold.list,
                        color: mainColor,
                        size: 30,
                      ),
                    );
                  }),
                  Text(
                    "Sharing Square",
                    style: title,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SearchScreen();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      PhosphorIcons.bold.magnifyingGlass,
                      color: mainColor,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            // Divider(
            //   color: mainColor,
            //   thickness: 4,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.93,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: friends.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6 / 8,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return TheInfoComponent(
                    image: friends[index]["image"],
                    name: friends[index]["name"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Center(
          child: Icon(
            PhosphorIcons.regular.qrCode,
            size: 30,
          ),
        ),
      ),
    );
  }
}
