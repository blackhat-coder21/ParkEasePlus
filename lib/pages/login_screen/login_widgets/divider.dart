import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class login_divider extends StatelessWidget {
  final String divider_text;
  const login_divider({
    super.key,
    required this.dark,
    required this.divider_text
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? Custom_colors.dark_grey : Custom_colors.grey, thickness: 0.7,indent: 50,endIndent: 5,)),
        Text(divider_text,style: Theme.of(context).textTheme.bodySmall,),
        Flexible(child: Divider(color: dark ? Custom_colors.dark_grey : Custom_colors.grey, thickness: 0.7,indent: 5,endIndent: 50,)),

      ],
    );
  }
}