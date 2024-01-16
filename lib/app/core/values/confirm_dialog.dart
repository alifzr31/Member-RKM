import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

void confirmDialog(
  BuildContext context, {
  String? title,
  String? desc,
  List<TextSpan>? descChildren,
  void Function()? okPressed,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.scale,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    headerAnimationLoop: false,
    dialogBackgroundColor: baseBgScaffold,
    btnCancel: BaseButton(
      bgColor: blackColor,
      fgColor: whiteColor,
      label: 'Tidak',
      onPressed: () => Get.back(),
    ),
    btnOkColor: orangeColor,
    btnOk: BaseButton(
      bgColor: orangeColor,
      fgColor: whiteColor,
      label: 'Ya',
      onPressed: okPressed,
    ),
    padding: const EdgeInsets.all(15),
    body: Column(
      children: [
        BaseText(
          text: title ?? '',
          size: 16,
          bold: FontWeight.w600,
        ),
        const SizedBox(height: 15),
        descChildren == null
            ? BaseText(
                text: desc ?? '',
                textAlign: TextAlign.center,
              )
            : RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: descChildren,
                ),
              ),
      ],
    ),
  ).show();
}

void successDialog(
  BuildContext context, {
  String? title,
  String? desc,
  List<TextSpan>? descChildren,
  void Function()? okPressed,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    headerAnimationLoop: false,
    dialogBackgroundColor: baseBgScaffold,
    btnOk: BaseButton(
      bgColor: orangeColor,
      fgColor: whiteColor,
      label: 'Ya',
      onPressed: okPressed,
    ),
    padding: const EdgeInsets.all(15),
    body: Column(
      children: [
        BaseText(
          text: title ?? '',
          size: 16,
          bold: FontWeight.w600,
        ),
        const SizedBox(height: 15),
        descChildren == null
            ? BaseText(
                text: desc ?? '',
                textAlign: TextAlign.center,
              )
            : RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: descChildren,
                ),
              ),
      ],
    ),
  ).show();
}
