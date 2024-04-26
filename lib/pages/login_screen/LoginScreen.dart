import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../bottom_nav.dart';
import '../../utils/devices_utils/device_util.dart';
import '../signup_screen/SignUpScreen.dart';
import 'login_widgets/divider.dart';
import 'login_widgets/form.dart';
import 'login_widgets/google.dart';
import 'login_widgets/logo_title_subtitle.dart';


class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {

  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();

  // form key for validation
  final GlobalKey<FormState> _login_formkey = GlobalKey<FormState>();

  void loginUser() async {
    // Check if email field is empty
    if (_email_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email address.")),
      );
      return;
    }

    // Check if email contains @ symbol
    if (!_email_controller.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid email address.")),
      );
      return;
    }

    // Check if password field is empty
    if (_password_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your password.")),
      );
      return;
    }

    try {
      // Show progress indicator
      showDialog(
        context: context,
        barrierDismissible: false, // prevent user from dismissing the dialog
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(), // Show CircularProgressIndicator
          );
        },
      );

      // Sign in user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email_controller.text,
        password: _password_controller.text,
      );

      // Close the progress indicator dialog
      Navigator.pop(context);

      // Navigate to the next screen upon successful login
      print("User logged in successfully!");
      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav())); // Navigate to the next screen
    } catch (e) {
      // Close the progress indicator dialog
      Navigator.pop(context);

      // Handle login errors
      print("Error logging in: $e");
      // Display error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Error"),
            content: Text("Incorrect email or password. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  void dispose() {
    super.dispose();
    _email_controller.dispose();
    _password_controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    bool dark = Device_util.is_dark_mode(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: Custom_pad.pad_with_appbar_height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              // Logo,title and subtitle
              const login_logotitlesubtitle(),

              const SizedBox(height: 32,),

              // Form containing email , password
              form_signincreateaccount(email_controller: _email_controller, password_controller: _password_controller, form_key: _login_formkey),

              const SizedBox(height: 32,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    loginUser();
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16), // Button padding
                  ),
                  child: const Text(
                    "Sign-In",
                    style: TextStyle(fontSize: 16), // Button text style
                  ),
                ),
              ),


              const SizedBox(height: 16,),

              SizedBox(width: double.infinity,child: OutlinedButton(onPressed: (){
                // Navigator.pushNamed(context,SignUp_screen.route_name);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp_screen()));
              },
                  style: Theme.of(context).outlinedButtonTheme.style,
                  child: const Text("Create Account")),
              ),

              // Divider
              // login_divider(dark: dark, divider_text: "or sign in with",),

              const SizedBox(height: 16,),

              // Google signin option
              // const login_googlefacebook()

            ],
          ),
        ),
      ),
    );
  }
}

class Custom_pad{
  static const EdgeInsetsGeometry pad_with_appbar_height = EdgeInsets.only(
    top: kToolbarHeight,
    bottom: 10,
    left: 16,
    right: 16,
  );
}