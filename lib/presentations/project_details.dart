import 'package:flutter/material.dart';
import 'package:portofolio/model/project.dart';
import 'package:portofolio/presentations/widgets/image_cover_profile.dart';
import 'package:url_launcher/url_launcher.dart';

void openInNewWindow(String uri, String name) async {
  final url = Uri.parse(uri);
  if (!await launchUrl(url)) {
    throw Exception("Could Not Launch $name");
  }
}

class ProjectDetails extends StatelessWidget {
  final Project project;
  const ProjectDetails({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          project.name,
          style: const TextStyle(fontSize: 35),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.close),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width <= 850 ? 30 : 100),
          child: Column(
            children: [
              ImageWidget(project: project),
              const SizedBox(
                height: 30,
              ),
              ContextProject(project: project),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final Project project;
  const ImageWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: project.name,
              child: Image.asset(
                project.assetPreviewImage!,
                width: 150,
                opacity: const AlwaysStoppedAnimation(0.3),
              ),
            ),
          ),
          if (project.toolsCover != null) ...[
            ...project.toolsCover!.map(
              (e) => Align(
                alignment: Alignment.topLeft,
                child: ImageCover(
                  asset: e,
                  filterQuality: FilterQuality.low,
                  width: MediaQuery.sizeOf(context).width <= 600 ? 50 : 150,
                  opacity: const AlwaysStoppedAnimation(0.3),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ContextProject extends StatelessWidget {
  final Project project;
  const ContextProject({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width <= 850) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Project Overview",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      project.desc,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "It has ${project.parts.length} features : ",
                      style: const TextStyle(fontSize: 16),
                    ),
                    ...project.parts.map(
                      (e) => Text(
                        "- $e",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  project.assetImage![index],
                  filterQuality: FilterQuality.high,
                ),
              ),
              itemCount: project.assetImage?.length ?? 0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(
            spacing: 80,
            runSpacing: 25,
            direction: Axis.horizontal,
            children: [
              DetailsWidget(
                name: "Tools & Technologies",
                project: project.tools,
              ),
              DetailsWidget(
                name: "Available Platforms",
                project: project.availablePlatforms,
              ),
              DetailsWidget(
                name: "Tags",
                project: project.tags,
              ),
              DetailsWidget(
                name: "Project Links",
                project: project.links,
              ),
            ],
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Project Overview",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  project.desc,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "It has ${project.parts.length} features : ",
                  style: const TextStyle(fontSize: 16),
                ),
                ...project.parts.map(
                  (e) => Text(
                    "- $e",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Expanded(
              child: SizedBox(
                height: 450,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      project.assetImage![index],
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  itemCount: project.assetImage?.length ?? 0,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Wrap(
          spacing: 80,
          runSpacing: 25,
          direction: Axis.horizontal,
          children: [
            DetailsWidget(
              name: "Tools & Technologies",
              project: project.tools,
            ),
            DetailsWidget(
              name: "Available Platforms",
              project: project.availablePlatforms,
            ),
            DetailsWidget(
              name: "Tags",
              project: project.tags,
            ),
            DetailsWidget(
              name: "Project Links",
              project: project.links,
            ),
          ],
        ),
      ],
    );
  }
}

class DetailsWidget extends StatelessWidget {
  final String name;
  final List<String> project;
  const DetailsWidget({super.key, required this.name, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        if (name == "Tags") ...[
          ...project.map(
            (e) => Text(
              "# $e",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ] else if (name == "Project Links") ...[
          ...project.map(
            (e) => MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => openInNewWindow(e, name),
                child: Text(
                  "- $e",
                  style: const TextStyle(
                      fontSize: 16, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ] else ...[
          ...project.map(
            (e) => Text(
              "- $e",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ],
    );
  }
}
