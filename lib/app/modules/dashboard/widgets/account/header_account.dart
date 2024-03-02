import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/components/pointvoucher_box.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/gradient_color.dart';
import 'package:member_rkm/app/modules/dashboard/components/account/membercard_account.dart';
import 'package:member_rkm/app/modules/dashboard/components/account/memberprogress_account.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class HeaderAccount extends StatelessWidget {
  HeaderAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: controller.token.value == null ||
                  controller.profile.value == null
              ? LinearGradient(
                  colors: [
                    const Color(0xFF121A24),
                    const Color(0xFF24292F).withOpacity(0.4),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
              : controller.profile.value?.category?.toLowerCase() == 'silver'
                  ? const LinearGradient(
                      colors: [
                        Color(0xFFC5C5C5),
                        Color(0xFF24292F),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                  : controller.profile.value?.category?.toLowerCase() == 'gold'
                      ? const LinearGradient(
                          colors: [
                            Color(0xFFD09A00),
                            Color(0xFFFFD285),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )
                      : const LinearGradient(
                          colors: [
                            Color(0xFF555555),
                            Color(0xFFA3A3A3),
                            Color(0xFF9E9E9E),
                            Color(0xFFDDDDDD),
                            Color(0xFFB6B6B6),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                controller.token.value == null ||
                        controller.profile.value == null
                    ? 'assets/images/bg_account.svg'
                    : controller.profile.value?.category?.toLowerCase() ==
                            'silver'
                        ? 'assets/images/bg_accountsilver.svg'
                        : controller.profile.value?.category?.toLowerCase() ==
                                'gold'
                            ? 'assets/images/bg_accountgold.svg'
                            : 'assets/images/bg_accountplatinum.svg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  controller.token.value == null
                      ? const MemberCardAccountNoLogin(
                          gradient: GradientColor.noMember,
                        )
                      : controller.profile.value == null
                          ? const BaseShimmer(child: MemberCardAccountNoLogin())
                          : MemberCardAccountLogin(
                              category: controller.profile.value?.category
                                      ?.toLowerCase() ??
                                  '',
                              profileImage:
                                  controller.profile.value?.image ?? '',
                              namaLengkap: controller.profile.value?.name ?? '',
                              email: controller.profile.value?.emailUser ?? '',
                              noMember: controller.profile.value?.code ?? '',
                              phoneNumber:
                                  controller.profile.value?.phoneUser ?? '',
                            ),
                  if (controller.token.value != null)
                    Column(
                      children: [
                        PointVoucherBox(
                          totalPoint: controller.profile.value?.point ?? '',
                          totalVoucher: controller
                                  .profile.value?.addOn?.voucherTotal
                                  ?.toString() ??
                              '',
                          margin: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        MemberProgressAccount(
                          currentTransaction:
                              controller.profile.value?.totalSpending ?? 0,
                          category: controller.profile.value?.category
                                  ?.toLowerCase() ??
                              '',
                        ),
                      ],
                    ),
                  if (controller.token.value == null)
                    BaseCard(
                      color: whiteColor,
                      margin: const EdgeInsets.only(
                        top: 15,
                        bottom: 40,
                        left: 15,
                        right: 15,
                      ),
                      child: InkWell(
                        splashColor: greyTextColor,
                        onTap: () => Get.toNamed('/login'),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: greyTextColor,
                                foregroundColor: blackColor,
                                child: Icon(Boxicons.bxs_user),
                              ),
                              Expanded(
                                child: Center(
                                  child: BaseText(
                                    text:
                                        'Silahkan log in untuk melihat informasi',
                                    color: Colors.black,
                                    bold: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
