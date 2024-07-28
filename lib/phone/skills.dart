import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
import 'package:portfolio/const.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    // String time = DateFormat.jm().format(DateTime.now());
    return Container(
      padding: const EdgeInsets.all(10),
      height: 510,
      width: 250,
      decoration: BoxDecoration(
        color: klavenderColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.barsStaggered,
                      size: 16,
                    ),
                    SizedBox(width: 50),
                    Text(
                      "Portfolio",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Skills",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
