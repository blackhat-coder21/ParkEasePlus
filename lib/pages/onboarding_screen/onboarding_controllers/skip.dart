import 'package:flutter/material.dart';
import '../../../../utils/devices_utils/device_util.dart';
import 'onboarding_controller.dart';

class skip extends StatelessWidget {
  const skip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: kToolbarHeight,right: Device_util.get_width(context)*0.05,
        child: TextButton(onPressed: () => Onboarding_controller.instance.skip_page(),child:
        Text('Skip',style: Theme.of(context).textTheme.bodyMedium,),));
  }
}