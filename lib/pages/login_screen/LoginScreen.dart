import 'package:flutter/material.dart';
import '../../utils/devices_utils/device_util.dart';
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




