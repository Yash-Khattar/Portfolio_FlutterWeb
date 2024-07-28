import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/connect_card.dart';

import 'package:portfolio/const.dart';
import 'package:portfolio/particle.dart';
import 'package:portfolio/phone/experience.dart';
import 'package:portfolio/phone/projects.dart';
import 'package:portfolio/phone/skills.dart';

import 'package:portfolio/widgets/hero.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTextVisible = false;
  void toggleTextVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  Offset pointer = const Offset(100, 100);
  final GlobalKey _boxkey = GlobalKey();
  Rect boxSize = Rect.zero;
  Random random = Random();
  List<Particle> particles = [];
  late Timer timer;
  final double fps = 1 / 60;
  final double gravity = 9.81, dragCof = 0.47, airDensity = 1.1644;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 500), () => toggleTextVisibility());
    // getting the size of screen
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Size size = _boxkey.currentContext!.size!;
      boxSize = Rect.fromLTRB(0, 0, size.width, size.height);
    });
    timer = Timer.periodic(
        Duration(milliseconds: (fps * 1000).floor()), frameBuilder);
    super.initState();
  }

//burst particles
  burstParticles() {
    particles.clear();
    int count = Random().nextInt(25).clamp(10, 25);
    for (var i = 0; i < count; i++) {
      Particle p = Particle();
      p.position = PVector(boxSize.center.dx, 0);
      double randomX = random.nextDouble() * 4.0;
      double randomY = random.nextDouble() * -7.0;
      if (i % 2 == 0) {
        randomX = -randomX;
      }
      p.velocity = PVector(randomX, randomY);
      p.radius = (random.nextDouble() * 10.0).clamp(7.0, 10.0);
      particles.add(p);
    }
  }

//collide part
  boxCollision(Particle pt) {
    //right
    if (pt.position.x > boxSize.width - pt.radius) {
      pt.position.x = boxSize.width - pt.radius;
      pt.velocity.x *= pt.jumpFactor;
    }
    //left
    if (pt.position.x < pt.radius) {
      pt.position.x = pt.radius;
      pt.velocity.x *= pt.jumpFactor;
    }
    // bottom
    if (pt.position.y > boxSize.height - pt.radius) {
      pt.position.y = boxSize.height - pt.radius;
      pt.velocity.y *= pt.jumpFactor;
    }
  }

  frameBuilder(dynamic timer) {
    particles.forEach((pt) {
      double dragForceX =
          0.5 * airDensity * pow(pt.velocity.x, 2) * dragCof * pt.area;
      double dragForceY =
          0.5 * airDensity * pow(pt.velocity.x, 2) * dragCof * pt.area;
      dragForceX = dragForceX.isInfinite ? 0.0 : dragForceX;
      dragForceY = dragForceY.isInfinite ? 0.0 : dragForceY;
      double accX = dragForceX / pt.mass;
      double accY = dragForceY / pt.mass + gravity;
      pt.velocity.x += accX * fps;
      pt.velocity.y += accY * fps;
      pt.position.x += pt.velocity.x * fps * 100;
      pt.position.y += pt.velocity.y * fps * 100;

      boxCollision(pt);

      if (pt.velocity.y.ceil() == -1 &&
          pt.position.y == boxSize.height - pt.radius) {
        particles.remove(pt);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: kbgColor,
      body: MouseRegion(
        key: _boxkey,
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
                            AnimatedOpacity(
                              opacity: isTextVisible ? 1 : 0,
                              duration: const Duration(milliseconds: 2000),
                              child:
                                  const Text("Yash Khattar", style: heading1),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "noun :/ Hola! I’m a Flutter App developer. Potterhead and 5SOS",
                              style: TextStyle(color: kgreyTextColor),
                            ),
                          ],
                        ),
                        HeroWidget(
                          burstParicles: burstParticles,
                        ),
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
                  const SizedBox(height: 90),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.white,
                      width: width / 2,
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
              ...particles
                  .map((pt) => Positioned(
                        left: pt.position.x,
                        top: pt.position.y,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: pt.radius * 4,
                          backgroundImage: AssetImage("assets/dash.png"),
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
