import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../bottom_nav.dart';
import '../../signup_screen/SignUpScreen.dart';


class form_signincreateaccount extends StatefulWidget {
  final TextEditingController email_controller;
  final TextEditingController password_controller;
  final GlobalKey<FormState> form_key;
  const form_signincreateaccount({super.key,
    required this.email_controller,
    required this.password_controller,
    required this.form_key
  });

  @override
  State<form_signincreateaccount> createState() => _form_signincreateaccountState();
}

class _form_signincreateaccountState extends State<form_signincreateaccount> {
  String? validator(String val,labelText){
    if(val.isEmpty){ return "Enter your $labelText"; }
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    bool _isPasswordVisible = false;

    return Form(
        key: widget.form_key,
        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8), // Adjust border radius as needed
              ),
              child:
              TextFormField(
                controller: widget.email_controller,
                validator: (stringText) => validator(stringText!,"E-Mail"),
                decoration: const InputDecoration(
                    prefixIcon:
                    Icon(Iconsax.direct_right),
                    labelText: "E-Mail",
                  border: InputBorder.none,
                ),

              ),
            ),


            const SizedBox(height: 16,),

            // TextFormField(
            //   controller: password_controller,
            //   validator: (stringText) => validator(stringText!,"Password"),
            //   decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check),labelText: "Password",suffixIcon: Icon(Iconsax.eye_slash)),
            // ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8), // Adjust border radius as needed
              ),
              child: TextFormField(
                controller: widget.password_controller,
                validator: (stringText) => validator(stringText!, "Password"),
                obscureText: !_isPasswordVisible,// Hide or show the password based on _isPasswordVisible
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // Toggle the visibility of the password
                      });
                    },
                    icon: Icon(_isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                  ),
                  border: InputBorder.none, // Remove default border
                ),
              ),
            ),

            const SizedBox(height: 4,),

            // Remember me and forget password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me -> checkbox and text
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    Text("Remember me",style: Theme.of(context).textTheme.bodySmall,),
                  ],
                ),

                // Forget password
                TextButton(onPressed: (){}, child: Text("Forget Password",style: Theme.of(context).textTheme.bodySmall))
              ],
            ),

            const SizedBox(height: 32,),

            // SignIn button
            // SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
            //   print("pressed on signin ${email_controller.text}");
            //   // if(form_key.currentState!.validate()){
            //   //   Auth_service.signin_user(context: context, email: email_controller.text, password: password_controller.text);
            //   //   // .then((value) => Navigator.pushNamedAndRemoveUntil(context,Bottom_nav.route_name, (route) => false));
            //   //
            //   // }
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
            // },
            //   child: const Text("Sign-In"),),),
          ],

        ));
  }
}