import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdaterController extends GetxController {
  final currentVersion = Rx<String?>(null);
  final buildNumber = Rx<String?>(null);
  final storeUrl = Rx<String?>(null);
  final storeVersion = Rx<String?>(null);

  @override
  void onInit() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
    storeUrl.value = Get.arguments['storeUrl'];
    storeVersion.value = Get.arguments['storeVersion'];
    super.onInit();
  }

  @override
  void onClose() {
    currentVersion.value = null;
    buildNumber.value = null;
    storeUrl.value = null;
    storeVersion.value = null;
    super.onClose();
  }

  void updateApps() async {
    final url = Uri.parse(storeUrl.value ?? '');
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  void navigate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final opened = sharedPreferences.getBool('opened');
    
    if (opened == true || opened != null) {
      Get.offAllNamed('/dashboard');
    } else {
      Get.offAllNamed('/onboard');
    }
  }
}
