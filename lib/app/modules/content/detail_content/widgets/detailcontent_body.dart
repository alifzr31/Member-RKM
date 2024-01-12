import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_nodata.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/content/detail_content/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailContentBody extends StatelessWidget {
  DetailContentBody({super.key});
  final controller = Get.find<DetailContentController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.detailContent.value == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  height: 400,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.network(
                        '${ApiUrl.baseStorageUrl}contents/${controller.detailContent.value?.featuredImage}',
                      ).image,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BaseText(
                              text: controller.title.value ?? '',
                              size: 16,
                              bold: FontWeight.w600,
                              color: controller.category.value == 'Event'
                                  ? const Color(0xFFFFD285)
                                  : orangeColor,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 10),
                          BaseText(
                            text: controller.date.value ?? '',
                            color: greyTextColor,
                            size: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: BaseText(
                          text: 'Deskripsi',
                          bold: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      HtmlWidget(
                        controller.detailContent.value?.content ?? '',
                        onErrorBuilder: (context, element, error) {
                          return BaseNoData(
                            title: 'Ups sepertinya terjadi kesalahan',
                            subtitle: '$error',
                            labelButton: 'Refresh Konten',
                            onPressed: () {},
                          );
                        },
                        renderMode: RenderMode.column,
                        onTapUrl: (value) async {
                          final url = Uri.parse(value);
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                          return true;
                        },
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const BaseText(
                              text: 'Author',
                              color: greyTextColor,
                            ),
                            const SizedBox(height: 10),
                            BaseText(
                              text:
                                  controller.detailContent.value?.authorId ?? '',
                              color: greyTextColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
