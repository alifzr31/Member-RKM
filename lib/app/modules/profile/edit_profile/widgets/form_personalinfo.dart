import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_formgroupdropdown.dart';
import 'package:member_rkm/app/components/base_formgroupfield.dart';
import 'package:member_rkm/app/components/base_formgrouptextarea.dart';
import 'package:member_rkm/app/components/base_listtile.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/components/item_field.dart';
import 'package:group_radio_button/group_radio_button.dart';

class FormPersonalInfoView extends StatelessWidget {
  FormPersonalInfoView({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemField(
              label: 'Nama Lengkap',
              value: controller.namaController.value.text !=
                      userController.profile.value?.name
                  ? controller.namaController.value.text
                  : userController.profile.value?.name ?? '-',
              valueColor: controller.namaController.value.text !=
                      userController.profile.value?.name
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Tempat Lahir',
              value: controller.tempatLahirController.value.text.isNotEmpty &&
                      controller.tempatLahirController.value.text !=
                          userController.profile.value?.birthPlace
                  ? controller.tempatLahirController.value.text
                  : userController.profile.value?.birthPlace ?? '-',
              valueColor:
                  controller.tempatLahirController.value.text.isNotEmpty &&
                          controller.tempatLahirController.value.text !=
                              userController.profile.value?.birthPlace
                      ? orangeColor
                      : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Tanggal Lahir',
              value: controller.selectedTglLahir.value != null &&
                      controller.selectedTglLahir.value !=
                          userController.profile.value?.birthDate
                  ? AppHelpers.dateFormat(
                      controller.selectedTglLahir.value ?? DateTime(0000))
                  : userController.profile.value?.birthDate == null
                      ? '-'
                      : AppHelpers.dateFormat(
                          userController.profile.value!.birthDate!),
              valueColor: controller.tglLahirController.value.text.isNotEmpty &&
                      controller.tglLahirController.value.text !=
                          userController.profile.value?.birthPlace
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Jenis Kelamin',
              value: controller.selectedJk.value != null &&
                      controller.selectedJk.value !=
                          userController.profile.value?.gender
                  ? controller.selectedJk.value ?? '-'
                  : userController.profile.value?.gender ?? '-',
              valueColor: controller.selectedJk.value != null &&
                      controller.selectedJk.value !=
                          userController.profile.value?.gender
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Alamat',
              value: controller.alamatController.value.text.isNotEmpty &&
                      controller.alamatController.value.text !=
                          userController.profile.value?.street
                  ? controller.alamatController.value.text
                  : userController.profile.value?.street ?? '-',
              valueColor: controller.alamatController.value.text.isNotEmpty &&
                      controller.alamatController.value.text !=
                          userController.profile.value?.street
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Kelurahan/Desa',
              value: controller.kelurahanController.value.text.isNotEmpty &&
                      controller.kelurahanController.value.text !=
                          userController.profile.value?.village
                  ? controller.kelurahanController.value.text
                  : userController.profile.value?.village ?? '-',
              valueColor:
                  controller.kelurahanController.value.text.isNotEmpty &&
                          controller.kelurahanController.value.text !=
                              userController.profile.value?.village
                      ? orangeColor
                      : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Agama',
              value: controller.selectedAgama.value != null &&
                      controller.selectedAgama.value !=
                          userController.profile.value?.religion
                  ? controller.selectedAgama.value ?? '-'
                  : userController.profile.value?.religion ?? '-',
              valueColor: controller.selectedAgama.value != null &&
                      controller.selectedAgama.value !=
                          userController.profile.value?.religion
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Jenis Identitas',
              value: controller.selectedIdType.value != null &&
                      controller.selectedIdType.value !=
                          userController.profile.value?.idType
                  ? controller.selectedIdType.value ?? '-'
                  : userController.profile.value?.idType ?? '-',
              valueColor: controller.selectedIdType.value != null &&
                      controller.selectedIdType.value !=
                          userController.profile.value?.idType
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'No. Identitas',
              value: controller.noIdentitasController.value.text.isNotEmpty &&
                      controller.noIdentitasController.value.text !=
                          userController.profile.value?.idNumber
                  ? controller.noIdentitasController.value.text
                  : userController.profile.value?.idNumber ?? '-',
              valueColor:
                  controller.noIdentitasController.value.text.isNotEmpty &&
                          controller.noIdentitasController.value.text !=
                              userController.profile.value?.idNumber
                      ? orangeColor
                      : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Pendidikan Terakhir',
              value: controller.selectedPendidikan.value != null &&
                      controller.selectedPendidikan.value !=
                          userController.profile.value?.lastEducation
                  ? controller.selectedPendidikan.value ?? '-'
                  : userController.profile.value?.lastEducation ?? '-',
              valueColor: controller.selectedPendidikan.value != null &&
                      controller.selectedPendidikan.value !=
                          userController.profile.value?.lastEducation
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Jenis Pekerjaan',
              value: controller.selectedPekerjaan.value != null &&
                      controller.selectedPekerjaan.value !=
                          userController.profile.value?.job
                  ? controller.selectedPekerjaan.value ?? '-'
                  : userController.profile.value?.job ?? '-',
              valueColor: controller.selectedPekerjaan.value != null &&
                      controller.selectedPekerjaan.value !=
                          userController.profile.value?.job
                  ? orangeColor
                  : null,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Status Pernikahan',
              value: controller.selectedMarital.value != null &&
                      controller.selectedMarital.value !=
                          userController.profile.value?.maritalStatus
                  ? controller.selectedMarital.value ?? '-'
                  : userController.profile.value?.maritalStatus ?? '-',
              valueColor: controller.selectedMarital.value != null &&
                      controller.selectedMarital.value !=
                          userController.profile.value?.maritalStatus
                  ? orangeColor
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class FormPersonalInfoEdit extends StatelessWidget {
  FormPersonalInfoEdit({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            BaseFormGroupField(
              label: 'Nama Lengkap',
              hint: 'Nama Lengkap',
              controller: controller.namaController.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan nama lengkap anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupField(
              label: 'Tempat Lahir',
              hint: 'Tempat Lahir',
              controller: controller.tempatLahirController.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan tempat lahir anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupField(
              label: 'Tanggal Lahir',
              hint: 'Tanggal Lahir',
              controller: controller.tglLahirController.value,
              readOnly: true,
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  locale: LocaleType.id,
                  currentTime:
                      controller.selectedTglLahir.value ?? DateTime.now(),
                  onChanged: (time) {
                    controller.tglLahirController.value.text =
                        AppHelpers.dateFormat(time);
                    controller.selectedTglLahir.value = time;
                  },
                );
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan tanggal lahir anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupDropdown(
              label: 'Jenis Kelamin',
              hint: 'Jenis Kelamin',
              value: controller.selectedJk.value,
              items: controller.jenisKelamin
                  .map((e) =>
                      DropdownMenuItem(value: e, child: BaseText(text: e)))
                  .toList(),
              onChanged: (value) =>
                  controller.selectedJk.value = value.toString(),
              validator: (value) {
                if (controller.selectedJk.value == null) {
                  return 'Silahkan pilih jenis kelamin anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupTextArea(
              label: 'Alamat',
              hint: 'Alamat',
              controller: controller.alamatController.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan alamat anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: BaseText(
                text: 'Kelurahan/Desa',
                bold: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            TypeAheadFormField(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                controller: controller.kelurahanController.value,
                decoration: InputDecoration(
                  hintText: 'Kelurahan/Desa',
                  hintStyle: const TextStyle(color: Color(0xFF777777)),
                  helperText:
                      '*Silahkan ketik nama kelurahan/desa atau nama kecamatan untuk mencari',
                  helperMaxLines: 2,
                  helperStyle: const TextStyle(
                    color: orangeColor,
                    fontStyle: FontStyle.italic,
                  ),
                  errorStyle: const TextStyle(
                    color: redColor,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: bgSectionColor,
                ),
              ),
              hideOnLoading: false,
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                color: bgSectionColor,
                borderRadius: BorderRadius.circular(10),
              ),
              onSuggestionSelected: (suggestion) {
                controller.kelurahanController.value.text =
                    suggestion.namaKelurahan?.capitalize ?? '';
                controller.selectedKelurahan.value =
                    suggestion.kdKelurahan.toString();
              },
              itemBuilder: (context, itemData) {
                return BaseListTile(
                  title: itemData.namaKelurahan ?? '',
                  subtitle: itemData.namaKecamatan ?? '',
                );
              },
              suggestionsCallback: (pattern) {
                if (pattern.length > 2) {
                  controller.fetchVillage(pattern);
                }

                return controller.village
                    .where((e) =>
                        e.namaKelurahan
                            .toString()
                            .toLowerCase()
                            .contains(pattern.toLowerCase()) ||
                        e.namaKecamatan
                            .toString()
                            .toLowerCase()
                            .contains(pattern.toLowerCase()))
                    .toList();
              },
              loadingBuilder: (context) =>
                  const Center(child: CircularProgressIndicator()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan pilih kelurahan anda';
                }

                return null;
              },
              debounceDuration: const Duration(milliseconds: 500),
            ),
            const SizedBox(height: 15),
            BaseFormGroupDropdown(
              label: 'Agama',
              hint: 'Agama',
              value: controller.selectedAgama.value,
              items: controller.agama
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: BaseText(text: e),
                      ))
                  .toList(),
              onChanged: (value) =>
                  controller.selectedAgama.value = value.toString(),
              validator: (value) {
                if (controller.selectedAgama.value == null) {
                  return 'Silahkan pilih agama anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupDropdown(
              label: 'Jenis Identitas',
              hint: 'Jenis Identitas',
              value: controller.selectedIdType.value,
              items: controller.idType
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: BaseText(text: e),
                      ))
                  .toList(),
              onChanged: (value) =>
                  controller.selectedIdType.value = value.toString(),
              validator: (value) {
                if (controller.selectedIdType.value == null) {
                  return 'Silahkan pilih jenis identitas anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupField(
              label: 'No. Identitas',
              hint: 'No. Identitas',
              controller: controller.noIdentitasController.value,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan masukkan no. identitas anda';
                } else {
                  if (controller.selectedIdType.value == 'SIM') {
                    if (value.length < 10 || value.length > 10) {
                      return 'Identitas SIM tidak boleh kurang atau lebih dari 10 digit';
                    }
                  } else {
                    if (value.length < 16 || value.length > 16) {
                      return 'Identitas KTP tidak boleh kurang atau lebih dari 16 digit';
                    }
                  }
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupDropdown(
              label: 'Pendidikan Terakhir',
              hint: 'Pendidikan Terakhir',
              value: controller.selectedPendidikan.value,
              items: controller.pendidikan
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: BaseText(text: e),
                      ))
                  .toList(),
              onChanged: (value) =>
                  controller.selectedPendidikan.value = value.toString(),
              validator: (value) {
                if (controller.selectedPendidikan.value == null) {
                  return 'Silahkan pilih pendidikan terakhir anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            BaseFormGroupDropdown(
              label: 'Jenis Pekerjaan',
              hint: 'Jenis Pekerjaan',
              value: controller.selectedPekerjaan.value,
              items: controller.pekerjaan
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: BaseText(text: e),
                      ))
                  .toList(),
              onChanged: (value) =>
                  controller.selectedPekerjaan.value = value.toString(),
              validator: (value) {
                if (controller.selectedPekerjaan.value == null) {
                  return 'Silahkan pilih jenis pekerjaan anda';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: BaseText(
                text: 'Status Pernikahan',
                bold: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            RadioGroup.builder(
              direction: Axis.horizontal,
              groupValue: controller.selectedMarital.value,
              textStyle: const TextStyle(fontSize: 16),
              activeColor: orangeColor,
              horizontalAlignment: MainAxisAlignment.spaceBetween,
              onChanged: (value) => controller.selectedMarital.value = value,
              items: controller.marital,
              itemBuilder: (value) {
                return RadioButtonBuilder(
                  value.toString(),
                );
              },
            ),
            Visibility(
              visible: controller.errorMarital.value,
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BaseText(
                    text: 'Silahkan pilih status pernikahan anda',
                    size: 12,
                    color: redColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
