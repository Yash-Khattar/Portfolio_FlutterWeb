import 'package:flutter/material.dart';
import 'package:portfolio/connect_card.dart';

import 'package:portfolio/const.dart';
import 'package:portfolio/phone/experience.dart';
import 'package:portfolio/phone/phone.dart';
import 'package:portfolio/phone/projects.dart';
import 'package:portfolio/phone/skills.dart';
import 'package:portfolio/utils.dart';
import 'package:portfolio/widgets/hero.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset pointer = Offset(100, 100);
  bool isVisible = false;
  void changeCursor() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  // List<Phone> phones = [
  //   Phone(color: kgreyColor),
  //   Phone(color: kgreenColor),
  //   Phone(color: kyellowColor),
  // ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: kbgColor,
      body: MouseRegion(
        cursor: SystemMouseCursors.basic,
        onHover: (eve) {
          setState(() {
            pointer = eve.position;
          });
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Custom dot in Cursor
              AnimatedPositioned(
                duration: const Duration(milliseconds: 10),
                left: pointer.dx,
                top: pointer.dy,
                child: Container(
                  width: 3,
                  height: 3,
                  color: Colors.white,
                ),
              ),
              AnimatedPositioned(
                // Cursor Ring
                duration: Duration(milliseconds: 300),
                left: pointer.dx - 75,
                top: pointer.dy - 75,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(
                          width: 2,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height - 20,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Yash Khattar", style: heading1),
                            SizedBox(height: 20),
                            Text(
                              "noun :/ Hola! I’m a Flutter App developer. Potterhead and 5SOS",
                              style: TextStyle(color: kgreyTextColor),
                            ),
                          ],
                        ),
                        HeroWidget(),
                      ],
                    ),
                  ),
                  // partition line
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.white,
                      width: width / 1.8,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 100),
                  // isMobileView(context)
                  //     ? SizedBox(
                  //         height: 520,
                  //         child: PageView.builder(
                  //             controller: PageController(
                  //                 viewportFraction:
                  //                     (isMobileView(context)) ? 0.8 : 0.26,
                  //                 initialPage: 1),
                  //             scrollDirection: Axis.horizontal,
                  //             itemCount: phones.length,
                  //             itemBuilder: (context, index) {
                  //               return Padding(
                  //                 padding: const EdgeInsets.all(20),
                  //                 child: Transform.scale(
                  //                   scale: index == 1 ? 1 : 0.85,
                  //                   child: phones[index],
                  //                 ),
                  //               );
                  //             }),
                  //       )
                  // :

                  const SizedBox(
                    height: 580,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                            alignment: Alignment.bottomCenter, child: Skills()),
                        ProjectScreen(),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Experience()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.white,
                      width: width / 2,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 100),

                  const Padding(
                    padding: const EdgeInsets.only(left: 60, bottom: 60),
                    child: Text(
                      "Connect with me :)",
                      style: heading1,
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 60, bottom: 120),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ConnectCard(),
                            ConnectCard(),
                            ConnectCard(),
                            ConnectCard(),
                            ConnectCard(),
                          ],
                        ),
                        Row(
                          children: [
                            ConnectCard(),
                            ConnectCard(),
                            ConnectCard(),
                            ConnectCard(),
                            ConnectCard(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
