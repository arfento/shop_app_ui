import 'package:shop_app_ui/data/models/product.dart';

class Const {
  // base URL for assets

  // default user id/key
  static const String userId = "user";

  // default profile picture path
  static const String profilePath = "assets/img/user_pict.png";

  // banner URLs
  static const List<String> imgBannerUrls = <String>[
    "assets/images/bags.jpg",
    "assets/images/blazer.jpg",
    "assets/images/hat.jpg",
    "assets/images/shoes.jpg",
    "assets/images/shirt.jpg",
    "assets/images/t-shirt.jpg",
  ];

  // list of products
  static const List<Product> products = [
    Product(
      name: "Nike Air Max",
      alias: "Alocasia",
      price: 65,
      about:
          "Alocasia are stunning tropical products with arrowhead-shaped leaves. Find a warm, bright area in your home for these beauties.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "60 x 100 cm",
        "20-25°c",
      ],
      imgUrls: <String>[
        "assets/images/nike1.png",
        "assets/images/nike2.png",
      ],
    ),
    Product(
      name: "Nike Zoom",
      alias: "Lidah Buaya",
      price: 50,
      about:
          "The aloe vera plant is an easy, attractive succulent that makes for a great indoor companion. Aloe vera products are also useful, as the juice from their leaves can be used to relieve pain from scrapes and burns when applied topically.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "30 x 50 cm",
        "13-27°c",
      ],
      imgUrls: <String>[
        "assets/images/nike2.png",
        "assets/images/nike4.png",
      ],
    ),
    Product(
      name: "Nike Air Force",
      alias: "Palem Kuning",
      price: 48,
      about:
          "Areca palm (Chrysalidocarpus lutescens) is one of the most widely used palms for bright interiors. It features feathery, arching fronds, each with up to 100 leaflets. These big, bold products command attention.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "80 x 120 cm",
        "18-25°c",
      ],
      imgUrls: <String>[
        "assets/images/nike3.png",
        "assets/images/nike4.png",
      ],
    ),
    Product(
      name: "Nike Zoom",
      alias: "Asparagus Hias",
      price: 35,
      about:
          "The asparagus fern plant (Asparagus aethiopicus) is normally found in a hanging basket, decorating the deck or patio in summer and helping to clean indoor air in winter.",
      characteristics: <String>[
        "Moistened",
        "Low Light",
        "40 x 80 cm",
        "10-18°c",
      ],
      imgUrls: <String>[
        "assets/images/nike4.png",
        "assets/images/nike2.png",
      ],
    ),
    Product(
      name: "Nike Air Jordan Low",
      alias: "Pohon Pisang Hias",
      price: 25,
      about:
          "Banana trees generally have a fast growth rate and should be planted in the spring. Plus, they can make good houseproducts with enough light, though they typically don't bear fruit indoors.",
      characteristics: <String>[
        "Moistened",
        "Normal Light",
        "68 x 124 cm",
        "23-32°c",
      ],
      imgUrls: <String>[
        "assets/images/nike5.png",
        "assets/images/nike6.png",
      ],
    ),
    Product(
      name: "Nike Air Jordan Low",
      alias: "Kaktus Hias",
      price: 68,
      about:
          "Cactus are some of the most unusual and elegant products in the world, with bold shapes of all kinds and beautiful green colour variations. They fit into many different home decor styles.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "30 x 60 cm",
        "18-40°c",
      ],
      imgUrls: <String>[
        "assets/images/nike6.png",
        "assets/images/nike5.png",
      ],
    ),
    Product(
      name: "Nike Air Jordan Low",
      alias: "Pilea Peperomioides",
      price: 42,
      about:
          "The Chinese money is a popular houseplant thanks to its attractive coin-shaped foliage and ease of care.",
      characteristics: <String>[
        "Weted",
        "Low Light",
        "25 x 50 cm",
        "11-18°c",
      ],
      imgUrls: <String>[
        "assets/images/nike7.png",
        "assets/images/nike5.png",
      ],
    ),
    Product(
      name: "Nike Air Jordan Mid",
      alias: "Dracaena Trifasciata",
      price: 32,
      about:
          "Dracaena trifasciata, or snake plant, is an evergreen ornamental houseplant with long sword-like variegated green and yellow leaves.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "30 x 60 cm",
        "13-25°c",
      ],
      imgUrls: <String>[
        "assets/images/nike8.png",
        "assets/images/nike6.png",
      ],
    ),
    Product(
      name: "Glass",
      alias: "Kimunding",
      price: 40,
      about:
          "Also called Ficus lyrata, gives off a simplistic & modern plant design that pairs nicely with neutral colors and trendy interior decorations.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "45 x 75 cm",
        "18-27°c",
      ],
      imgUrls: <String>[
        "assets/images/glass.jpg",
        "assets/images/women.jpg",
      ],
    ),
    Product(
      name: "Necklaces",
      alias: "Disocactus Anguliger",
      price: 75,
      about:
          "This tropical, epiphytic cactus is native to Mexico, and is perfect for those cactus lovers that don't have the right conditions to keep the typical desert cacti alive.",
      characteristics: <String>[
        "Moistened",
        "Low Light",
        "30 x 60 cm",
        "13-32°c",
      ],
      imgUrls: <String>[
        "assets/images/necklaces.jpg",
        "assets/images/women.jpg",
      ],
    ),
    Product(
      name: "Leyland Cypress Product",
      alias: "Pohon Cemara Leyland",
      price: 65,
      about:
          "Flat stems of feathery, blue-green foliage and ornamental combine to make Leyland cypress an appealing choice for medium to large landscapes.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "80 x 200 cm",
        "10-20°c",
      ],
      imgUrls: <String>[
        "assets/images/blazer.jpg",
        "assets/images/mens.jpg",
      ],
    ),
    Product(
      name: "Sweater",
      alias: "Ceriman",
      price: 56,
      about:
          "Monstera deliciosa are species of evergreen tropical vines and shrubs that are native to Central America. They are famous for their natural leaf-holes, which has led to the rise of their nickname, Swiss Cheese Product.",
      characteristics: <String>[
        "Weted",
        "Low Light",
        "40 x 60 cm",
        "15-24°c",
      ],
      imgUrls: <String>[
        "assets/images/sw.jpg",
        "assets/images/mens.jpg",
      ],
    ),
    Product(
      name: "Bags",
      alias: "Kalanchoe Thyrsiflora",
      price: 25,
      about:
          "Flapjack paddle plant (Kalanchoe thyrsiflora), this succulent kalanchoe plant has with thick, rounded, paddle-shaped leaves.",
      characteristics: <String>[
        "Moistened",
        "Normal Light",
        "28 x 40 cm",
        "18-27°c",
      ],
      imgUrls: <String>[
        "assets/images/bags.jpg",
        "assets/images/womens.jpg",
      ],
    ),
    Product(
      name: "Jacket",
      alias: "Chlorophytum Comosum",
      price: 39,
      about:
          "The spider plant is considered one of the most adaptable of houseproducts and the easiest to grow. This plant can grow in a wide range of conditions and suffers from few problems.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "60 x 90 cm",
        "18-25°c",
      ],
      imgUrls: <String>[
        "assets/images/jacjket.jpg",
        "assets/images/womens.jpg",
      ],
    ),
    Product(
      name: "Shirt",
      alias: "Opuntia Microdasys",
      price: 99,
      about:
          "The bunny ear cactus (Opuntia microdasys) is a popular houseplant that is not only attractive but is also low-maintenance.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "30 x 60 cm",
        "18-40°c",
      ],
      imgUrls: <String>[
        "assets/images/shirt.jpg",
        "assets/images/t-shirt.jpg",
      ],
    ),
    Product(
      name: "Jacket",
      alias: "Opuntia Microdasys",
      price: 99,
      about:
          "The most tactile of houseproducts, the leaves do really feel like the softest velvet. Not as bright as a lot of this family the leaves are a rich green on the top and a dark burgundy underneath for the purple varietal.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "50 x 75 cm",
        "18-37°c",
      ],
      imgUrls: <String>[
        "assets/images/mens.jpg",
        "assets/images/mens.jpg",
      ],
    ),
  ];
}
