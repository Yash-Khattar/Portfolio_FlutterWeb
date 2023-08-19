
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool isMobileView(BuildContext context) {
  return getWidth(context) < 700 || getHeight(context) > getWidth(context);
}

void showSnackBar({required BuildContext context}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Could not launch url")));
}

Future<void> launchUrlFunc(String url, BuildContext context) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    showSnackBar(context: context);
  }
}
