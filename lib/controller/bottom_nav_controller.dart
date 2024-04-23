import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../pages/MapPage.dart';
import '../pages/profile_page/account_settings.dart';


class Navigation_controller extends GetxController{

  final Rx<int> selected_index = 0.obs;

  final screens = [MapPage(), MapPage(), MapPage(), SettingsScreen()];

}