import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
import 'package:portfolio/const.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    // String time = DateFormat.jm().format(DateTime.now());
    return Container(
      padding: const EdgeInsets.all(10),
      height: 510,
      width: 250,
      decoration: BoxDecoration(
        color: kyellowColor,
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
                    "Experiences",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
                Text(
                  "Footprints is an Activity Tracking App, that converts user's physical activity to coins that can be donated by the user to his choice of NGO. The project tackles the serious issue of short funding and lack of awareness about NGOs, leading them to stop functioning.",
                  style: TextStyle(fontSize: 12),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: divider,
                ),
                ExperienceTile(
                  title: "Software Development Cell",
                  subtitle: "Flutter Developer",
                  desc:
                      '''◦ Development : Used Flutter and Firebase to develop and maintain LinkUSS, an app with over 500+ userbase. ◦ UI/UX : Worked closely with senior designers to implement UI/UX designs, create interactive user interfaces, and
ensure seamless functionality.''',
                  image: '',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: divider,
                ),
                ExperienceTile(
                  title: "Google Developer Student Club",
                  subtitle: "Web Team",
                  desc:
                      '''Management: Mentored 200+ students across the campus about web development and have experience in managing the
GDSC’s platform website.''',
                  image: '',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: divider,
                ),
                ExperienceTile(
                  title: "Techspace",
                  subtitle: "Graphic Designer",
                  desc:
                      "Designing : Created 20+ posts for the club Techspace which has around 700 members.",
                  image: "",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: divider,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String desc;
  final String image;
  const ExperienceTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.desc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      subtitle: Text(subtitle),
      shape: RoundedRectangleBorder(),
      children: [
        Text(
          desc,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
