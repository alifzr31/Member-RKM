import 'package:get/get.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/binding.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/view.dart';
import 'package:member_rkm/app/modules/auth/login/binding.dart';
import 'package:member_rkm/app/modules/auth/login/view.dart';
import 'package:member_rkm/app/modules/auth/register/binding.dart';
import 'package:member_rkm/app/modules/auth/register/view.dart';
import 'package:member_rkm/app/modules/auth/send_email/binding.dart';
import 'package:member_rkm/app/modules/auth/send_email/view.dart';
import 'package:member_rkm/app/modules/benefit/binding.dart';
import 'package:member_rkm/app/modules/benefit/view.dart';
import 'package:member_rkm/app/modules/content/all_content/binding.dart';
import 'package:member_rkm/app/modules/content/all_content/view.dart';
import 'package:member_rkm/app/modules/content/detail_content/binding.dart';
import 'package:member_rkm/app/modules/content/detail_content/view.dart';
import 'package:member_rkm/app/modules/dashboard/binding.dart';
import 'package:member_rkm/app/modules/dashboard/view.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/binding.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/view.dart';
import 'package:member_rkm/app/modules/onboard/binding.dart';
import 'package:member_rkm/app/modules/onboard/view.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/binding.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/view.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/binding.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/view.dart';
import 'package:member_rkm/app/modules/point/binding.dart';
import 'package:member_rkm/app/modules/point/history_point/view.dart';
import 'package:member_rkm/app/modules/point/my_point/view.dart';
import 'package:member_rkm/app/modules/profile/binding.dart';
import 'package:member_rkm/app/modules/profile/change_password/view.dart';
import 'package:member_rkm/app/modules/profile/delete_account/view.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/view.dart';
import 'package:member_rkm/app/modules/shopping_history/binding.dart';
import 'package:member_rkm/app/modules/shopping_history/view.dart';
import 'package:member_rkm/app/modules/splash/binding.dart';
import 'package:member_rkm/app/modules/splash/view.dart';
import 'package:member_rkm/app/modules/success/binding.dart';
import 'package:member_rkm/app/modules/success/view.dart';
import 'package:member_rkm/app/modules/tracking/binding.dart';
import 'package:member_rkm/app/modules/tracking/view.dart';
import 'package:member_rkm/app/modules/updater/binding.dart';
import 'package:member_rkm/app/modules/updater/view.dart';
import 'package:member_rkm/app/modules/voucher/binding.dart';
import 'package:member_rkm/app/modules/voucher/view.dart';
import 'package:member_rkm/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.updater,
      page: () => const UpdaterPage(),
      binding: UpdaterBinding(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnBoardPage(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.sendEmail,
      page: () => const SendEmailPage(),
      binding: SendEmailBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.benefit,
      page: () => const BenefitPage(),
      binding: BenefitBinding(),
    ),
    GetPage(
      name: Routes.allContent,
      page: () => const AllContentPage(),
      binding: AllContentBinding(),
    ),
    GetPage(
      name: Routes.detailContent,
      page: () => const DetailContentPage(),
      binding: DetailContentBinding(),
    ),
    GetPage(
      name: Routes.point,
      page: () => const MyPointPage(),
      binding: PointBinding(),
    ),
    GetPage(
      name: Routes.pointHistory,
      page: () => const HistoryPointPage(),
      binding: PointBinding(),
    ),
    GetPage(
      name: Routes.voucher,
      page: () => const VoucherPage(),
      binding: VoucherBinding(),
    ),
    GetPage(
      name: Routes.tracking,
      page: () => const TrackingPage(),
      binding: TrackingBinding(),
    ),
    GetPage(
      name: Routes.shopping,
      page: () => const ShoppingPage(),
      binding: ShoppingBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.deleteAccount,
      page: () => const DeleteAccountPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.createPin,
      page: () => const PinPage(),
      binding: PinBinding(),
    ),
    GetPage(
      name: Routes.changePin,
      page: () => const PinPage(),
      binding: PinBinding(),
    ),
    GetPage(
      name: Routes.forgotPin,
      page: () => const ForgotPinPage(),
      binding: ForgotPinBinding(),
    ),
    GetPage(
      name: Routes.resetPin,
      page: () => const ResetPinPage(),
      binding: ResetPinBinding(),
    ),
    GetPage(
      name: Routes.success,
      page: () => const SuccessPage(),
      binding: SuccessBinding(),
      transition: Transition.downToUp
    ),
  ];
}
