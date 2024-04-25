import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/devices_utils/device_util.dart';


class signup_form extends StatefulWidget {
  final firstname_controller;
  final secondname_controller;
  final address_controller;
  final  phonenumber_controller;
  final email_controller;
  final password_controller;
// Form key for validation
  final signup_formkey;

  const signup_form({
    super.key,
    required this.firstname_controller,
    required this.secondname_controller,
    required this.address_controller,
    required this.phonenumber_controller,
    required this.email_controller,
    required this.password_controller,
    required this.signup_formkey,

  });

  @override
  State<signup_form> createState() => _signup_formState();
}

class _signup_formState extends State<signup_form> {

  // Key for validating the elements in the signup form

  String? validator(String val,labelText){
    if(val.isEmpty){ return "Enter your $labelText"; }
    else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    // bool dark = Device_util.is_dark_mode(context);
    return Form(
        key: widget.signup_formkey ,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField(expands: false,decoration: const InputDecoration(labelText: "First Name",prefixIcon: Icon(Iconsax.user)),
                  controller: widget.firstname_controller,
                  validator: (stringText) => validator(stringText!,"First Name") ,
                )),
                const SizedBox(width: 16),
                Expanded(child: TextFormField(expands: false,decoration: const InputDecoration(labelText: "Last Name",prefixIcon: Icon(Iconsax.user)),
                  controller: widget.secondname_controller,
                  validator: (stringText) => validator(stringText!,"Last Name") ,
                )),
              ],) ,


            const SizedBox(height: 12),

            TextFormField(expands: false,decoration: const InputDecoration(labelText: "Phone Number",prefixIcon: Icon(Iconsax.call)),
              controller: widget.phonenumber_controller,
              validator: (stringText) => validator(stringText!,"Phone number") ,
            ),


            const SizedBox(height: 12),

            TextFormField(expands: false,decoration: const InputDecoration(labelText: "Address",prefixIcon: Icon(Iconsax.user_edit)),
              controller: widget.address_controller,
              validator: (stringText) => validator(stringText!,"Address") ,
            ),

            const SizedBox(height: 12),

            TextFormField(expands: false,decoration: const InputDecoration(labelText: "E-Mail",prefixIcon: Icon(Iconsax.direct4)),
              controller: widget.email_controller,
              validator: (stringText) => validator(stringText!,"E-Mail") ,
            ),

            const SizedBox(height: 12),

            TextFormField(expands: false,decoration: const InputDecoration(labelText: "Password",prefixIcon: Icon(Iconsax.key),suffixIcon: Icon(Iconsax.eye_slash)),
              controller: widget.password_controller,
              validator: (stringText) => validator(stringText!,"Password") ,
            ),
          ],
        ));
  }
}
