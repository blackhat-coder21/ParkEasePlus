import 'package:get/get.dart';
import '../pages/MapPage.dart';
import '../pages/about_us/about_us.dart';
import '../pages/homepage/homepage.dart';


var pages = [
  GetPage(
    name: '/homepage',
    page: () => HomePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/about-us',
    page: () => AboutUs(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/map-page',
    page: () => MapPage(),
    transition: Transition.fade,
  ),
];