import 'package:get/get.dart';
import 'package:park_ease/bottom_nav.dart';
import 'package:park_ease/pages/onboarding_screen/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    pageHander();
  }

  void pageHander() async {

    Future.delayed(
      const Duration(seconds: 6),
          () {
        // Get.offAllNamed("/map-page");
        Get.offAll(Onboarding_screen());
        update();
      },
    );

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', token);
    //
    // if (jwtToken != null) {
    //   // User is logged in, navigate to home page
    //   Get.offAll(BottomNav());
    // } else {
    //   // User is not logged in, navigate to onboarding screen
    //   Future.delayed(
    //     const Duration(seconds: 4),
    //         () {
    //       Get.offAll(Onboarding_screen());
    //     },
    //   );
    // }
  }
}