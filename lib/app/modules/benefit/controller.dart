import 'package:get/get.dart';
import 'package:member_rkm/app/modules/benefit/widgets/gold_benefit.dart';
import 'package:member_rkm/app/modules/benefit/widgets/platinum_benefit.dart';
import 'package:member_rkm/app/modules/benefit/widgets/silver_benefit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BenefitController extends GetxController {
  final token = Rx<String?>(null);
  final loyaltyLevel = Rx<String?>(null);
  final total = 0.obs;
  final spendingTotal = Rx<String?>(null);
  final currentTab = 0.obs;

  final tabViewItem = const [
    SilverBenefit(),
    GoldBenefit(),
    PlatinumBenefit(),
  ].obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token.value = sharedPreferences.getString('token');
    
    super.onInit();
  }
}
