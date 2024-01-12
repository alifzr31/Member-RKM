import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_bottomsheet.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/components/home/menu_bottomsheet.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                tooltip: 'Gratis Ongkir',
                onPressed: () {
                  baseBottomSheet(
                    200,
                    const MenuBottomSheet(
                      image: 'assets/images/ongkir.svg',
                      title: 'Gratis Ongkir',
                      subtitle:
                          'Gratis ongkos kirim dengan ketentuan jarak pengiriman maksimal sesuai kebijakan manajemen RKM',
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/ongkir.svg',
                  width: 40,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                padding: EdgeInsets.zero,
                tooltip: 'Gratis Konsultasi',
                onPressed: () {
                  baseBottomSheet(
                    200,
                    const MenuBottomSheet(
                      image: 'assets/images/consult.svg',
                      title: 'Gratis Konsultasi',
                      subtitle:
                          'Gratis konsultasi dengan konsultan RKM mengenai pemilihan bahan bangunan sesuai kebutuhan pelanggan',
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/consult.svg',
                  width: 40,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                padding: EdgeInsets.zero,
                tooltip: 'Hadiah Menarik',
                onPressed: () {
                  baseBottomSheet(
                    200,
                    const MenuBottomSheet(
                      image: 'assets/images/prize.svg',
                      title: 'Hadiah Menarik',
                      subtitle:
                          'Dapatkan berbagai macam hadiah menarik untuk setiap pembelian produk di RKM',
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/prize.svg',
                  width: 40,
                ),
              ),
            ],
          ),
        ),
        BaseButtonIcon(
          bgColor: bgSectionColor,
          fgColor: whiteColor,
          ovColor: whiteColor.withOpacity(0.2),
          icon: Boxicons.bxs_info_circle,
          label: 'Benefit Member',
          onPressed: () => Get.toNamed('/benefit'),
        ),
      ],
    );
  }
}
