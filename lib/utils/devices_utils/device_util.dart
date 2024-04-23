import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Device_util{

  static void hide_keyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static set_status_bar_color(Color color){
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color)
    );
  }

  static double get_Appbar_height(){
    return kToolbarHeight;
  }

  static void set_full_screen(bool enable){
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }


  static Size mq(BuildContext context){
    return MediaQuery.of(context).size;
  }

  static double get_height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double get_bottomNavigationBarHeight(BuildContext context) {
    return kBottomNavigationBarHeight; // This will return the default height of the bottom navigation bar
  }

  static double get_width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }


  static double get_keyboard_height(){
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }


  static void vibrate(Duration duration){
    HapticFeedback.vibrate();
    Future.delayed(duration,() => HapticFeedback.vibrate());
  }


  static Future<bool> has_internet_connection() async{
    try{
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch(_)  { return false; }
  }


  static bool is_ios(){
    return Platform.isIOS;
  }


  static bool is_android(){
    return Platform.isAndroid;
  }

  static Future<void> go_to_url(String url) async{
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }else{
      print("there is error in go_to_url devices_util.dart}");
      throw "Could not launch $url";
    }
  }

  static void showSnackbar(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg,
        textAlign: TextAlign.center,),
        // backgroundColor: Colors.blue.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void show_progress_bar(BuildContext context){
    showDialog(context: context, builder: (context)=>
    const Center(child: CircularProgressIndicator())
    );
  }

  static void show_alert(BuildContext context,String title, String message){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK")
            ),
          ],
        );
      },
    );
  }


  static bool is_dark_mode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }


  // static String get_formated_date(DateTime date, {String the_format = 'dd MM yyyy'}){
  //   return DateFormat(the_format).format(date);
  // }

  // static Future<List<File>> pick_image() async{
  //   List<File> images = [];
  //   try{
  //     var selected_files = await FilePicker.platform.pickFiles(
  //         type: FileType.image,
  //         allowMultiple: true
  //     );
  //     if(selected_files != null && selected_files.files.isNotEmpty){
  //       for(int i = 0;i<selected_files.files.length; i++){
  //         images.add(File(selected_files.files[i].path!));
  //       }
  //     }
  //   }catch(error){
  //     print("error in pick image device util ${error}");
  //   }
  //   return images;
  // }


}