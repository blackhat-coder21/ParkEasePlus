import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class login_googlefacebook extends StatelessWidget {
  const login_googlefacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Custom_colors.grey),borderRadius: BorderRadius.circular(70)),
          // google icon
          child: IconButton(
              onPressed:() {} ,
              icon: Image.asset("assets/icons/google.png",height: 40,width: 40,)
          ),
        ),

        const SizedBox(width: 16,),

        // Container(
        //   decoration: BoxDecoration(border: Border.all(color: Custom_colors.grey),borderRadius: BorderRadius.circular(70)),
        //   // google icon
        //   child: IconButton(
        //       onPressed:() {} ,
        //       icon: Image.asset("assets/icons/facebook2.png",height: 40,width: 40,)
        //   ),
        // ),
      ],
    );
  }
}