// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class AppBottomNavigationBar extends StatelessWidget {
//   final BaseController _baseController = BaseController.to;
//   final Color _colorSelected = Color(0xFF00755F);
//   final Color _colorUnSelected = Color(0xFF9EAFA2);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined, color: _colorUnSelected),
//             activeIcon: Icon(Icons.home, color: _colorSelected),
//             label: LocaleKeys.pages_home.tr,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.explore_outlined, color: _colorUnSelected),
//             activeIcon: Icon(Icons.explore, color: _colorSelected),
//             label: LocaleKeys.pages_explore.tr,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_outlined, color: _colorUnSelected),
//             activeIcon: Icon(Icons.favorite, color: _colorSelected),
//             label: LocaleKeys.pages_favourites.tr,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_outlined, color: _colorUnSelected),
//             activeIcon: Icon(Icons.account_circle, color: _colorSelected),
//             label: LocaleKeys.pages_profile.tr,
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//         iconSize: 25,
//         unselectedFontSize: 12,
//         selectedFontSize: 12,
//         showUnselectedLabels: true,
//         showSelectedLabels: true,
//         currentIndex: _baseController.currentPageIndex,
//         unselectedItemColor: _colorUnSelected,
//         selectedItemColor: _colorSelected,
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//         onTap: _baseController.onCurrentTabChanged,
//       ),
//     );
//   }
// }
