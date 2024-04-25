import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:park_ease/config/db.dart';
import 'package:park_ease/pages/signup_screen/signup_widgets/form.dart';
import 'package:park_ease/pages/signup_screen/signup_widgets/terms_and_conditions.dart';
import '../../bottom_nav.dart';
import '../../utils/devices_utils/device_util.dart';
import '../login_screen/login_widgets/divider.dart';
import '../login_screen/login_widgets/google.dart';
import 'package:http/http.dart' as http;
import '../onboarding_screen/onboarding.dart';


class SignUp_screen extends StatefulWidget {
  // static const String route_name = "/signup";

  const SignUp_screen({super.key});

  @override
  State<SignUp_screen> createState() => _SignUp_screenState();
}

class _SignUp_screenState extends State<SignUp_screen> {

  // controllers
  final TextEditingController _firstname_controller = TextEditingController();
  final TextEditingController _secondname_controller = TextEditingController();
  final TextEditingController _address_controller = TextEditingController();
  final TextEditingController _phonenumber_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _signup_formkey = GlobalKey<FormState>();

  // for api post request
  // final Auth_service auth_service = Auth_service();
  void registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email_controller.text,
        password: _password_controller.text,
      );

      // User successfully registered, you can now proceed with any additional data handling
      User? user = userCredential.user;
      if (user != null) {
        print("mlo "+_firstname_controller.text);
        // Save additional user data to Realtime Database
        final reference = FirebaseDatabase.instance.reference().child('userNew').child(user.uid);
        reference.set({
          'first_name': _firstname_controller.text,
          'last_name': _secondname_controller.text,
          'phone': _phonenumber_controller.text,
          'address': _address_controller.text,
        });

        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
      } else {
        // Handle error
        print("User registration failed");
      }
    } catch (e) {
      // Handle any errors that occur during registration
      print("Error registering user: $e");
    }
  }



  @override
  void dispose() {
    super.dispose();
    _firstname_controller.dispose();
    _secondname_controller.dispose();
    _address_controller.dispose();
    _phonenumber_controller.dispose();
    _email_controller.dispose();
    _password_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool dark = Device_util.is_dark_mode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(
                height: 24,
              ),

              signup_form(firstname_controller: _firstname_controller, secondname_controller: _secondname_controller, address_controller: _address_controller, phonenumber_controller: _phonenumber_controller, email_controller: _email_controller, password_controller: _password_controller, signup_formkey: _signup_formkey),

              // Terms and conditions
              const signup_t_and_c(),

              const SizedBox(height: 24),

              // create account button
              // SizedBox(width : double.infinity, child: ElevatedButton(onPressed: (){
              //
              //   // if(_signup_formkey.currentState!.validate()){
              //   //   Auth_service.signup_user(context: context, first_name: _firstname_controller.text, last_name: _secondname_controller.text, phone_number: _phonenumber_controller.text, address: _address_controller.text, email: _email_controller.text, password: _password_controller.text);
              //   //   Navigator.pushNamed(context, Onboarding_screen.route_name);
              //   // }
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding_screen()));
              // },
              //   child: const Text("Create Account"),),),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    registerUser();
                     //Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16), // Button padding
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 16), // Button text style
                  ),
                ),
              ),


              const SizedBox(height: 24,),

              // login_divider(dark: dark, divider_text: "or signup using"),

              const SizedBox(height: 16,),

              // const login_googlefacebook()
            ],
          ),
        ),
      ),
    );
  }
}
