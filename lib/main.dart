import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopeasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'ShopEasy Homepage'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> categoryImages = {
      'Electronics': 'assets/electronics.jpg',
      'Clothing': 'assets/clothing.jpg',
      'Shoes': 'assets/shoes.jpg',
      'Books': 'assets/books2.jpg',
      'Home & Kitchen': 'assets/kitchen_appliances2.jpg',
      'Toys': 'assets/toys.jpg',
    };

    List<String> categories = categoryImages.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2.0,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('Category tapped: ${categories[index]}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(
                    category: categories[index],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categoryImages[categories[index]]!,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    categories[index],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  final String category;

  const CategoriesScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [];

    if (category == 'Electronics') {
      products = [
        {'name': 'TV', 'price': '\$10', 'quantity': 5, 'image': 'assets/tv.jpg'},
        {'name': 'Hi-Fi', 'price': '\$20', 'quantity': 3, 'image': 'assets/hifi.jpg'},
        {'name': 'Laptop', 'price': '\$15', 'quantity': 7, 'image': 'assets/laptop.jpg'},
        {'name': 'Mobile Phone', 'price': '\$25', 'quantity': 2, 'image': 'assets/mobile.jpg'},
        {'name': 'Digital Camera', 'price': '\$30', 'quantity': 4, 'image': 'assets/digicam.jpg'},
        ];
     } else if (category == 'Clothing') {
      products = [
         {'name': 'T-Shirt', 'price': '\$15', 'quantity': 10, 'image': 'assets/tshirt.jpg'},
        {'name': 'Jeans', 'price': '\$25', 'quantity': 8, 'image': 'assets/jeans.jpg'},
        {'name': 'Dress', 'price': '\$30', 'quantity': 6, 'image': 'assets/dress.jpg'},
        {'name': 'Jacket', 'price': '\$40', 'quantity': 5, 'image': 'assets/jacket.jpg'},
      ];
    } else if (category == 'Shoes') {
      products = [
        {'name': 'Sneakers', 'price': '\$50', 'quantity': 12, 'image': 'assets/sneakers.jpg'},
        {'name': 'Boots', 'price': '\$60', 'quantity': 7, 'image': 'assets/boots.jpg'},
        {'name': 'Sandals', 'price': '\$35', 'quantity': 9, 'image': 'assets/sandals.jpg'},
        {'name': 'Heels', 'price': '\$45', 'quantity': 6, 'image': 'assets/heels.jpg'},
      ];
    } else if (category == 'Home & Kitchen') {
      products = [
        {'name': 'Fridge', 'price': '\$10', 'quantity': 15, 'image': 'assets/fridge.jpg'},
        {'name': 'Nicrowave', 'price': '\$12', 'quantity': 10, 'image': 'assets/microwave.jpg'},
        {'name': 'Cooker', 'price': '\$8', 'quantity': 20, 'image': 'assets/cooker.jpg'},
        {'name': 'washing Machine', 'price': '\$15', 'quantity': 8, 'image': 'assets/washing_machine.jpg'},
      ];
    } else if (category == 'Books') {
      products = [
        {'name': 'Novel', 'price': '\$10', 'quantity': 15, 'image': 'assets/novel.jpg'},
        {'name': 'Biography', 'price': '\$12', 'quantity': 10, 'image': 'assets/biography.jpg'},
        {'name': 'Self-Help', 'price': '\$8', 'quantity': 20, 'image': 'assets/selfhelp.jpg'},
        {'name': 'Cookbook', 'price': '\$15', 'quantity': 8, 'image': 'assets/cookbook.jpg'},
      ];
    } else if (category == 'Toys') {
      products = [
        {'name': 'Action Figure', 'price': '\$20', 'quantity': 25, 'image': 'assets/action_figure.jpg'},
        {'name': 'Doll', 'price': '\$18', 'quantity': 30, 'image': 'assets/doll.jpg'},
        {'name': 'LEGO Set', 'price': '\$30', 'quantity': 20, 'image': 'assets/lego.jpg'},
        {'name': 'Puzzle', 'price': '\$12', 'quantity': 15, 'image': 'assets/puzzle.jpg'},
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.5,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('Product tapped: ${products[index]['name']}');
            },
            child: Card(
              elevation: 3.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    products[index]['image'],
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index]['name'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Price: ${products[index]['price']}',
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Quantity: ${products[index]['quantity']}',
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}








// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shopeasy',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const MyHomePage(title: 'Shopeasy Home'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;

//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Map<String, String> categoryImages = {
//       'Electronics': 'assets/electronics.jpg',
//       'Clothing': 'assets/clothing.jpg',
//       'Shoes': 'assets/shoes.jpg',
//       'Books': 'assets/books2.jpg',
//       'Home & Kitchen': 'assets/kitchen_appliances2.jpg',
//       'Toys': 'assets/toys.jpg',
//     };

//     List<String> categories = categoryImages.keys.toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text(title)),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.0,
//           mainAxisSpacing: 10.0,
//           childAspectRatio: 2.0,
//         ),
//         itemCount: categories.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               print('Category tapped: ${categories[index]}');
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CategoriesScreen(
//                     category: categories[index],
//                   ),
//                 ),
//               );
//             },
//             child: Card(
//               elevation: 3.0,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     categoryImages[categories[index]]!,
//                     height: 80,
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     categories[index],
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CategoriesScreen extends StatelessWidget {
//   final String category;

//   const CategoriesScreen({Key? key, required this.category}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> products = [
//       {'name': 'TV', 'price': '\$10', 'quantity': 5, 'image': 'assets/tv.jpg'},
//       {'name': 'Hi-Fi', 'price': '\$20', 'quantity': 3, 'image': 'assets/hifi.jpg'},
//       {'name': 'Laptop', 'price': '\$15', 'quantity': 7, 'image': 'assets/laptop.jpg'},
//       {'name': 'Mobile Phone', 'price': '\$25', 'quantity': 2, 'image': 'assets/mobile.jpg'},
//       {'name': 'Digital Camera', 'price': '\$30', 'quantity': 4, 'image': 'assets/digicam.jpg'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(category),
//         centerTitle: true,
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.0,
//           mainAxisSpacing: 10.0,
//           childAspectRatio: 1.5,
//         ),
//         itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               print('Product tapped: ${products[index]['name']}');
//             },
//             child: Card(
//               elevation: 3.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     products[index]['image'],
//                     height: 80,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           products[index]['name'],
//                           style: const TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Price: ${products[index]['price']}',
//                           style: const TextStyle(
//                             fontSize: 14.0,
//                           ),
//                         ),
//                         Text(
//                           'Quantity: ${products[index]['quantity']}',
//                           style: const TextStyle(
//                             fontSize: 14.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


