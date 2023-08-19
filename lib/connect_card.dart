import 'package:flutter/material.dart';
import 'package:portfolio/const.dart';

class ConnectCard extends StatelessWidget {
  const ConnectCard(
      {super.key, this.text = 'discord', this.link = '', this.icon = ''});

  final String text;
  final String link;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              color: kglassColor,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Positioned(
            left: 2.5,
            child: CircleAvatar(
              radius: 20,
            ),
          ),
          Positioned(
            left: 70,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
