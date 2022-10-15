import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  Rx<int> currentPage = 0.obs;
}
