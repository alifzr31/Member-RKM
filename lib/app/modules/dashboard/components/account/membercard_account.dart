import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_membercard.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/gradient_color.dart';
import 'package:member_rkm/app/modules/dashboard/components/show_qr.dart';

class MemberCardAccountNoLogin extends StatelessWidget {
  const MemberCardAccountNoLogin({
    Key? key,
    this.gradient,
  }) : super(key: key);

  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      margin: EdgeInsets.zero,
      child: BaseMemberCard(
        gradient: gradient,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const [
                  TextSpan(
                    text: 'Hi, ',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: 'RKM ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'People!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SvgPicture.asset(
                'assets/images/all_medal.svg',
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemberCardAccountLogin extends StatelessWidget {
  const MemberCardAccountLogin({
    Key? key,
    required this.category,
    required this.profileImage,
    required this.namaLengkap,
    required this.email,
    required this.noMember,
    required this.phoneNumber,
  }) : super(key: key);

  final String category;
  final String profileImage;
  final String namaLengkap;
  final String email;
  final String noMember;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      margin: EdgeInsets.zero,
      child: BaseMemberCard(
        gradient: category == 'silver'
            ? GradientColor.silver
            : category == 'gold'
                ? GradientColor.gold
                : GradientColor.platinum,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                profileImage == ''
                                    ? const CircleAvatar(
                                        radius: 35,
                                        backgroundColor: whiteColor,
                                        foregroundColor: blackColor,
                                        child: Icon(
                                          Boxicons.bxs_user,
                                          size: 35,
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 35,
                                        backgroundImage: Image.network(
                                          '${ApiUrl.baseStorageUrl}$profileImage',
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: orangeColor,
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          (loadingProgress
                                                                  .expectedTotalBytes ??
                                                              1)
                                                      : null,
                                                ),
                                              );
                                            }
                                          },
                                        ).image,
                                      ),
                                const SizedBox(width: 5),
                                SvgPicture.asset(
                                  category == 'silver'
                                      ? 'assets/images/silver_medal.svg'
                                      : category == 'gold'
                                          ? 'assets/images/gold_medal.svg'
                                          : 'assets/images/platinum_medal.svg',
                                  width: 35,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          BaseText(
                            text: namaLengkap,
                            size: 16,
                            bold: FontWeight.w600,
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
                    const SizedBox(width: 10),
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
              const SizedBox(height: 15),
              SelectableText(
                AppHelpers.addSpaces(noMember),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OCR-A',
                  letterSpacing: Get.width < 390 ? 4 : 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
