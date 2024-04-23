import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/devices_utils/device_util.dart';
import 'onboarding_controller.dart';

class onboard_pageindicator_next extends StatelessWidget {
  const onboard_pageindicator_next({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Onboarding_controller.instance;
    return Positioned(bottom: Device_util.get_bottomNavigationBarHeight(context)+30,left:25,child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: controller.page_controller,
          // again the index is passed automatically for the dotnavigation
          onDotClicked: controller.dotnavigation_click,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Custom_colors.dark ?? Colors.red, // Manually set color when dark is not defined
            dotHeight: 5,
          ),
        ),
        SizedBox(width:Device_util.get_width(context)*0.5,),
        ElevatedButton(onPressed:() => controller.next_page() ,style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: Device_util.is_dark_mode(context) ? Custom_colors.primary : Custom_colors.dark,), child:const Icon(Icons.keyboard_arrow_right_outlined,color: Colors.white,size: 25,))
      ],
    ));
  }
}