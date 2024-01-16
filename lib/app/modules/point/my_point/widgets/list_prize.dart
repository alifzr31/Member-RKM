import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_bottomsheet.dart';
import 'package:member_rkm/app/components/base_searchfield.dart';
import 'package:member_rkm/app/modules/point/controller.dart';
import 'package:member_rkm/app/modules/point/my_point/components/prize_card.dart';
import 'package:member_rkm/app/modules/point/my_point/widgets/selectcabang_widget.dart';

class ListPrize extends StatelessWidget {
  ListPrize({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BaseSearchField(
                hint: 'Cari Hadiah',
                controller: controller.searchPrizeController.value,
                onChanged: (value) => controller.searchPrize.value = value,
                suffixIcon: controller.searchPrize.value == null ||
                        controller.searchPrize.value == ''
                    ? null
                    : IconButton(
                        onPressed: () {
                          controller.searchPrizeController.value.text = '';
                          controller.searchPrize.value = null;
                        },
                        icon: Icon(
                          Boxicons.bx_x,
                          color: Colors.grey.shade600,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PrizeCard(
                    prizePoint: 1000,
                    prizeImage:
                        'https://member.triwarna.co.id/storage/contents/event/31072023_1%20mobile_edit.png',
                    prizeDesc: 'prizeDesc',
                    onPressed: () {
                      baseBottomSheet(
                        360,
                        SelectCabangWidget(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
