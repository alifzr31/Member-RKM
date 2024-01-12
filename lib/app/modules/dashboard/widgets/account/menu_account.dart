import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_listtile.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/components/account/menu_item.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuAccount extends StatelessWidget {
  MenuAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuItem(
            label: 'Profil',
            items: [
              BaseListTile(
                leading: const Icon(
                  Boxicons.bx_edit_alt,
                  color: whiteColor,
                ),
                title: 'Ubah Profil',
                subtitle: 'Mengubah foto dan informasi data diri anda',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: orangeColor,
                ),
                onTap: () => Get.toNamed('/editProfile'),
              ),
              BaseListTile(
                leading: SvgPicture.asset(
                  'assets/images/shopping.svg',
                  width: 24,
                ),
                title: 'Riwayat Belanja',
                subtitle: 'Lihat riwayat belanjaan anda',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: orangeColor,
                ),
                onTap: () {
                  Get.toNamed('/shopping');
                },
              ),
              BaseListTile(
                leading: const Icon(
                  Icons.pin_outlined,
                  color: whiteColor,
                ),
                title: controller.profile.value?.addOn?.hasPin == false
                    ? 'Buat PIN'
                    : 'Ganti PIN',
                subtitle: controller.profile.value?.addOn?.hasPin == false
                    ? 'Buat PIN anda untuk keamanan transaksi'
                    : 'Ganti PIN anda secara berskala agar aman',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: orangeColor,
                ),
                onTap: () => controller.profile.value?.addOn?.hasPin == false
                    ? Get.toNamed('/createPin')
                    : Get.toNamed('/changePin'),
              ),
              BaseListTile(
                leading: const Icon(
                  Icons.password,
                  color: whiteColor,
                ),
                title: 'Ganti Password',
                subtitle: 'Ganti password anda secara berskala agar aman',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: orangeColor,
                ),
                onTap: () => Get.toNamed('/changePassword'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          MenuItem(
            label: 'Lainnya',
            items: [
              BaseListTile(
                leading: const Icon(Boxicons.bx_headphone),
                title: 'Hubungi Kami',
                subtitle: 'Hubungi kami kapanpun, kami siap membantu',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: orangeColor,
                ),
                onTap: () async {
                  final url = Uri.parse(
                    'https://api.whatsapp.com/send/?phone=%2B628112308000&text&type=phone_number&app_absent=0',
                  );

                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
              BaseListTile(
                leading: const Icon(
                  Boxicons.bx_user_x,
                  color: redColor,
                ),
                title: 'Hapus Akun',
                subtitle:
                    'Hapus akun akan membuatmu berhenti menjadi member RKM',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: orangeColor,
                ),
                onTap: () => Get.toNamed('/deleteAccount'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
