import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:park_ease/utils/constants/colors.dart';
import 'controller/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Navigation_controller());

    return Scaffold(
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.selected_index.value,
          onTap: (index) => controller.selected_index.value = index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.save_2),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.book),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
              selectedItemColor: Custom_colors.primary,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
        ),
      ),
      body: Obx(() => controller.screens[controller.selected_index.value]),
    );
  }
} 
