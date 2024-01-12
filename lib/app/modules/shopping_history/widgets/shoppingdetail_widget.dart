import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class ShoppingDetailWidget extends StatefulWidget {
  const ShoppingDetailWidget({super.key});

  @override
  State<ShoppingDetailWidget> createState() => _ShoppingDetailWidgetState();
}

class _ShoppingDetailWidgetState extends State<ShoppingDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/shopping_fill.svg',
                width: 40,
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: 'Detail Belanja',
                    bold: FontWeight.w500,
                  ),
                  BaseText(
                    text: '02 Januari 2024 10:30',
                    size: 12,
                    color: greyTextColor,
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return const Row(
                            children: [
                              Expanded(
                                child: BaseText(
                                    text: 'MAXEE COAT WALL PAINT BASE 101'),
                              ),
                              BaseText(text: 'Rp 500.000,-'),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BaseText(
                            text: 'Total Harga',
                            size: 12,
                            color: greyTextColor,
                          ),
                          BaseText(
                            text: 'Rp 1.360.500,-',
                            bold: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const BaseText(
                text:
                    'Berbagai macam hadiah menarik untuk setiap pembelian produk di RKM',
                size: 12,
                textAlign: TextAlign.center,
                color: greyTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
