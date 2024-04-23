import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/devices_utils/device_util.dart';
import 'onboarding_controllers/onboarding_controller.dart';
import 'onboarding_controllers/page_indicator.dart';
import 'onboarding_controllers/page_view.dart';
import 'onboarding_controllers/skip.dart';


class Onboarding_screen extends StatelessWidget {
  const Onboarding_screen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Here we register a controller globally using Get.put(controller)
    /// so the controller becomes available for retrieval anywhere in your app using Get.find().
    final Onboarding_controller controllerOnboard = Get.put(Onboarding_controller());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // Page view
            page_view(controller_onboard: controllerOnboard),

            // Skip
            const skip(),

            SizedBox(height: Device_util.mq(context).height*0.1,),

            // Next button and page indicator
            const onboard_pageindicator_next(),
            // Positioned(bottom: Device_util.get_bottomNavigationBarHeight(context)+20,right:25,child: ElevatedButton(onPressed:(){} ,child:Icon(Icons.keyboard_arrow_right_outlined,color: Colors.white,size: 25,),style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Device_util.is_dark_mode(context) ? Custom_colors.primary : Custom_colors.dark,)))
          ],
          // Horizontal scroll pages


          // Skip button



          // Dot navigation Smooth page indicator



          // Circular button
        ),
      ),
    );
  }
}


