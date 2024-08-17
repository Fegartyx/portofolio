import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";

class ProfileIconUrl extends StatelessWidget {
  final String? imageAsset;
  final String assetUrl, tag, childTag;
  const ProfileIconUrl(
      {super.key,
      this.imageAsset,
      required this.assetUrl,
      required this.tag,
      required this.childTag});

  void openInNewWindow(String uri, String name) async {
    final url = Uri.parse(uri);
    if (!await launchUrl(url)) {
      throw Exception("Could Not Launch $name");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          openInNewWindow(
            assetUrl,
            tag,
          );
        },
        child: childTag == "image"
            ? Image.asset(imageAsset!,
                width: MediaQuery.sizeOf(context).width <= 600 ? 25 : 55)
            : Icon(
                Icons.email,
                size: MediaQuery.sizeOf(context).width <= 600 ? 25 : 55,
              ),
      ),
    );
  }
}
