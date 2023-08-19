import 'package:flutter/material.dart';
import 'package:portfolio/const.dart';
import 'package:portfolio/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 510,
      width: 250,
      decoration: BoxDecoration(
        color: kgreenColor,
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
                    "Projects",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
                ProjectCard(
                  image: "assets/footprint_image.jpg",
                  name: "Footprints",
                  url: "https://github.com/Yash-Khattar/Footprint",
                  description:
                      "Footprints is an Activity Tracking App, that converts user's physical activity to coins that can be donated by the user to his choice of NGO. The project tackles the serious issue of short funding and lack of awareness about NGOs, leading them to stop functioning.",
                  tech: ["Flutter", "Dart", "Firebase", "Google Fit Api"],
                ),
                SizedBox(height: 32),
                ProjectCard(
                  image: "assets/linkuss_image.png",
                  name: "LinkUSS",
                  url: "https://github.com/Yash-Khattar/linkuss2.0",
                  description:
                      "Footprints is an Activity Tracking App, that converts user's physical activity to coins that can be donated by the user to his choice of NGO. The project tackles the serious issue of short funding and lack of awareness about NGOs, leading them to stop functioning.",
                  tech: ["Flutter", "Dart", "Firebase"],
                ),
                SizedBox(height: 32),
                ProjectCard(
                  image: "assets/fireplace_image.png",
                  name: "Fireplace",
                  url: "https://github.com/Yash-Khattar",
                  description:
                      "Footprints is an Activity Tracking App, that converts user's physical activity to coins that can be donated by the user to his choice of NGO. The project tackles the serious issue of short funding and lack of awareness about NGOs, leading them to stop functioning.",
                  tech: ["Flutter", "Dart", "NodeJS", "API"],
                ),
                SizedBox(height: 32),
                ProjectCard(
                  image: "assets/ST_image.png",
                  name: "Stranger Things Website",
                  url: "https://github.com/Yash-Khattar/Stranger-Things",
                  description:
                      "Footprints is an Activity Tracking App, that converts user's physical activity to coins that can be donated by the user to his choice of NGO. The project tackles the serious issue of short funding and lack of awareness about NGOs, leading them to stop functioning.",
                  tech: ["HTML", "CSS", "JS"],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {super.key,
      required this.image,
      required this.name,
      required this.url,
      required this.description,
      required this.tech});
  final String image;
  final String name;
  final String url;
  final String description;
  final List<String> tech;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 16,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tech.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      tech[index],
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launchUrlFunc(url, context);
                },
                child: const Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
