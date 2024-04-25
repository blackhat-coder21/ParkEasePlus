import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../utils/devices_utils/device_util.dart';

class signup_t_and_c extends StatelessWidget {
  const signup_t_and_c({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    bool dark = Device_util.is_dark_mode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        Text.rich(TextSpan(
            children: [

              TextSpan(text: "I agree to ",style: Theme.of(context).textTheme.bodySmall!.apply(
                  fontSizeFactor: 0.8
              )),
              TextSpan(text: "Privacy Policy",style: Theme.of(context).textTheme.bodySmall!.apply(
                  fontSizeFactor: 0.8,
                  color: dark ? Custom_colors.white : Custom_colors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? Custom_colors.white : Custom_colors.primary
              )),
              TextSpan(text: " and ",style: Theme.of(context).textTheme.bodySmall!.apply(
                  fontSizeFactor: 0.8
              )),
              TextSpan(text: "Terms of use",style: Theme.of(context).textTheme.bodySmall!.apply(
                  fontSizeFactor: 0.8,
                  color: dark ? Custom_colors.white : Custom_colors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? Custom_colors.white : Custom_colors.primary
              )),
            ]
        ))
      ],
    );
  }
}