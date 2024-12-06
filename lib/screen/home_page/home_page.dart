// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/home_controller.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   var controller = Get.put(HomeController());
//   var navBody = [
//     Container(color: Colors.blue),
//     Container(color: Colors.amber),
//     Container(color: Colors.purple),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       Column(
//        children: [
//          Obx(()
//            => Expanded(child: navBody.elementAt(controller.currentNavIndex.value),
//          ),
//          )
//        ],
//      ),
//
//       bottomNavigationBar:Obx(() =>
//       BottomNavigationBar(
//         currentIndex: controller.currentNavIndex.value,
//         selectedItemColor: Colors.red,
//         type: BottomNavigationBarType.fixed,
//         onTap: (value){
//           controller.currentNavIndex.value = value;
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.density_small_sharp),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meesho/cart/cart_screen.dart';
import 'package:meesho/categories/categories_screen.dart';
import 'package:meesho/profile/profile_screen.dart';

import '../../controller/home_controller.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());

  final navBody = [

    HomeScreen(),
    // const CategoriesScreen(),
    const CartScreen(),
    ProfileScreen(username: '', email: '', mobile: '',)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.density_small_sharp),
            //   label: 'Categories',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
