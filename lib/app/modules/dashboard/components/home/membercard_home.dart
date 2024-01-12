import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_membercard.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/components/pointvoucher_box.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/gradient_color.dart';
import 'package:member_rkm/app/modules/dashboard/components/show_qr.dart';

class MemberCardHomeNoLogin extends StatelessWidget {
  const MemberCardHomeNoLogin({
    Key? key,
    this.gradient,
    this.color,
  }) : super(key: key);

  final Gradient? gradient;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BaseMemberCard(
      gradient: gradient,
      color: color,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const [
                TextSpan(text: 'Daftar sebagai membership '),
                TextSpan(
                  text: 'GRATIS!',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseButton(
                        bgColor: whiteColor,
                        fgColor: blackColor,
                        label: 'Daftar Membership',
                        onPressed: () => Get.toNamed('/register'),
                      ),
                      Row(
                        children: [
                          const BaseText(
                            text: 'Sudah punya akun? ',
                            size: 12,
                            color: greyTextColor,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed('/login'),
                            child: const BaseText(
                              text: 'Masuk disini',
                              size: 12,
                              color: orangeColor,
                              bold: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/all_medal.svg',
                  width: 130,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MemberCardHomeLogin extends StatelessWidget {
  const MemberCardHomeLogin({
    Key? key,
    required this.category,
    required this.noMember,
    required this.email,
    required this.phoneNumber,
    required this.totalPoint,
    required this.totalVoucher,
  }) : super(key: key);

  final String category;
  final String noMember;
  final String email;
  final String phoneNumber;
  final String totalPoint;
  final String totalVoucher;

  @override
  Widget build(BuildContext context) {
    return BaseMemberCard(
      gradient: category == 'silver'
          ? GradientColor.silver
          : category == 'gold'
              ? GradientColor.gold
              : GradientColor.platinum,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelpers.addSpaces(noMember),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OCR-A',
                          letterSpacing: 1.5,
                        ),
                      ),
                      BaseText(
                        text: email,
                        color: category == 'platinum'
                            ? Colors.grey.shade500
                            : Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
                if (noMember != '')
                  InkResponse(
                    onTap: () {
                      showQR(noMember);
                    },
                    child: SvgPicture.network(
                      '${ApiUrl.baseStorageUrl}${StorageUrl.qr}/$noMember.svg',
                      width: 100,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          PointVoucherBox(
            totalPoint: totalPoint,
            totalVoucher: totalVoucher,
          ),
        ],
      ),
    );
  }
}
