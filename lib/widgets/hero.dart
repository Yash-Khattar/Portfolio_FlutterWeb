import 'package:flutter/material.dart';
import 'package:portfolio/const.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double radius = 24;
    return Container(
      height: 300,
      width: 350,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kgreenColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(radius),
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kgreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kgreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(radius)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kgreenColor,
                      borderRadius: BorderRadius.all(Radius.circular(radius)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
              child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: klavenderColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
