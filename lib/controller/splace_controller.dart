import 'package:get/get.dart';
import 'package:park_ease/pages/onboarding_screen/onboarding.dart';



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
  }
}