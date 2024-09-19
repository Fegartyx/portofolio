class Project {
  final int id;
  final String name;
  final String? assetPreviewImage;
  final List<String>? assetImage;
  final List<String> availablePlatforms;
  final List<String> parts;
  final String desc;
  final List<String> tags;
  final List<String> tools;
  final List<String>? toolsCover;
  final List<String> links;

  Project({
    required this.id,
    required this.name,
    required this.availablePlatforms,
    required this.parts,
    this.assetImage,
    this.assetPreviewImage,
    required this.desc,
    required this.tags,
    required this.tools,
    required this.links,
    this.toolsCover,
  });
}

final List<Project> projects = [
  Project(
    id: 1,
    name: "To Do App",
    assetPreviewImage: "assets/projects/to_do.png",
    parts: ["To Do List", "Completed Task", "Uncompleted Task", "Details Task"],
    availablePlatforms: ["Android", "iOS"],
    assetImage: [
      "assets/projects/others/to_do.gif",
    ],
    desc: "To Do App is a personal management app for to do list",
    tags: ["Flutter", "Dart", "SQL", "Riverpod"],
    tools: ["Flutter", "Dart", "SQLite"],
    links: ["https://github.com/Fegartyx/to_do_list_riverpod"],
  ),
  Project(
    id: 2,
    name: "Weather App",
    assetPreviewImage: "assets/projects/cloudy.png",
    parts: [
      "Show Weather From Location",
      "Show Weather From List Country",
      "Show Weather From Search City",
      "Riverpod State"
    ],
    availablePlatforms: ["Android", "iOS"],
    assetImage: [
      "assets/projects/others/weather.png",
    ],
    desc: "Weather App for checking weather condition",
    tags: ["Flutter", "Dart", "API", "Riverpod"],
    tools: ["Flutter", "Dart"],
    links: ["https://github.com/Fegartyx/weather_app"],
  ),
  Project(
    id: 3,
    name: "DMB Merchant",
    assetPreviewImage: "assets/projects/dmb.png",
    desc:
        "This app is designed for restaurant staff to efficiently take customer orders and manage food and beverage sales.",
    parts: ["POS", "Payment Service", "Many Outlets"],
    availablePlatforms: ["Android", "iOS"],
    tags: ["Flutter", "Dart", "SQL", "Provider"],
    tools: ["Flutter", "Dart", "SQLite", "Sentry"],
    links: [
      "https://play.google.com/store/apps/details?id=com.merchant.dna&pcampaignid=web_share"
    ],
  ),
  Project(
    id: 4,
    name: "DMB App",
    assetPreviewImage: "assets/projects/dmb.png",
    desc:
        "This app is a one-stop solution for all your needs, including hotel bookings, flight tickets, mobile top-ups, and internet packages. It's making everything easily accessible in one place",
    parts: ["Payment Service", "POS", "Many Outlets"],
    availablePlatforms: ["Android", "iOS"],
    tags: ["Flutter", "Dart", "SQL", "Provider"],
    tools: ["Flutter", "Dart", "SQLite", "Sentry"],
    links: [
      "https://play.google.com/store/apps/details?id=com.app.dna&pcampaignid=web_share"
    ],
  ),
  Project(
    id: 5,
    name: "Kada",
    assetPreviewImage: "assets/projects/kada.png",
    desc:
        "Kada is platform for connecting customer and business in single mobile application",
    parts: ["CV", "MRI", "ENAK"],
    availablePlatforms: ["Android", "iOS"],
    assetImage: [
      "assets/projects/others/mri/mri.jpg",
      "assets/projects/others/mri/canvas.jpg",
    ],
    tags: [
      "Flutter",
      "Dart",
      "NOSQL",
      "Bloc",
      "GetX",
      "Firebase",
      "Socket",
      "Notification"
    ],
    tools: ["Flutter", "Dart", "Hive", "Firebase", "Socket.io"],
    links: [
      "https://play.google.com/store/apps/details?id=id.kada.mobileapp&pcampaignid=web_share"
    ],
  ),
  Project(
    id: 6,
    name: "Drugstore",
    desc: "Drugstore is a drug store application for sale drug for apotek",
    parts: ["POS", "CRUD", "Many User Role", "Landing Page"],
    availablePlatforms: ["Web"],
    tags: ["Laravel", "Blade", "Bootstrap", "MySql", "Jquery"],
    assetPreviewImage: "assets/projects/drugstore.jpg",
    assetImage: [
      "assets/projects/others/drugstore/landing_page.PNG",
      "assets/projects/others/drugstore/product_index.PNG",
      "assets/projects/others/drugstore/index_user.PNG",
      "assets/projects/others/drugstore/index_category.PNG",
      "assets/projects/others/drugstore/history_transaction.PNG",
      "assets/projects/others/drugstore/edit_user.PNG",
      "assets/projects/others/drugstore/edit_products.PNG",
      "assets/projects/others/drugstore/edit_category.PNG",
      "assets/projects/others/drugstore/cart.PNG",
      "assets/projects/others/drugstore/add_user.PNG",
      "assets/projects/others/drugstore/add_product.PNG",
      "assets/projects/others/drugstore/add_category.PNG",
    ],
    tools: ["Laravel", "SQL"],
    links: ["https://github.com/Fegartyx/Drugstore"],
  ),
];
