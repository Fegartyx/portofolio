import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:portofolio/model/project.dart';
import 'package:portofolio/presentations/project_details.dart';
import 'package:portofolio/presentations/widgets/profile_icon_url.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(
          Icons.keyboard_command_key,
          size: 40,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 80, vertical: kToolbarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstPage(),
              SecondPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 50, bottom: MediaQuery.sizeOf(context).height / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Muhammad Ferary",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width <= 600 ? 35 : 70),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Mobile App Developer",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width <= 600 ? 25 : 40),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 1.5,
            child: Wrap(
              children: [
                Image.asset(
                  "assets/images/flutter.png",
                  width: MediaQuery.sizeOf(context).width <= 600 ? 100 : 260,
                  filterQuality: FilterQuality.low,
                ),
                Image.asset(
                  "assets/images/cpp.png",
                  width: MediaQuery.sizeOf(context).width <= 600 ? 100 : 260,
                  filterQuality: FilterQuality.low,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.sizeOf(context).width <= 600 ? 10 : 20,
                    vertical: MediaQuery.sizeOf(context).width <= 600 ? 5 : 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: Text(
                  "See My Work",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.sizeOf(context).width <= 600 ? 15 : 20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Row(
            children: [
              ProfileIconUrl(
                assetUrl:
                    "https://www.linkedin.com/in/muhammad-ferary-04a0b6219/",
                imageAsset: "assets/icons/linkedin.png",
                tag: "linkedin",
                childTag: "image",
              ),
              SizedBox(
                width: 25,
              ),
              ProfileIconUrl(
                assetUrl: "https://discordapp.com/users/313979995448147971",
                imageAsset: "assets/icons/discord.png",
                tag: "discord",
                childTag: "image",
              ),
              SizedBox(
                width: 25,
              ),
              ProfileIconUrl(
                assetUrl: "https://github.com/Fegartyx",
                imageAsset: "assets/icons/github.png",
                tag: "github",
                childTag: "image",
              ),
              SizedBox(
                width: 25,
              ),
              ProfileIconUrl(
                assetUrl: "mailto:antartyx@gmail.com",
                tag: "mail",
                childTag: "icon",
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: MediaQuery.sizeOf(context).width <= 750 ? 1 : 3,
      children: projects.map(
        (data) {
          return Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 12),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectDetails(
                        project: data,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFC7D3B6),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        // left: 65,
                        // top: 90,
                        child: Hero(
                          tag: data.name,
                          child: Image.asset(
                            data.assetPreviewImage!,
                            width: 70,
                            opacity: const AlwaysStoppedAnimation(0.5),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            data.desc,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
