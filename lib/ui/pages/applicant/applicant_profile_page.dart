import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/cons/page_type.dart';
import 'package:peakabu/network/network_status.dart';
import 'package:peakabu/providers/applicant_provider.dart';
import 'package:peakabu/ui/atoms/platform_cancel_button.dart';
import 'package:peakabu/ui/atoms/platform_label.dart';
import 'package:peakabu/ui/atoms/platform_submit_button.dart';
import 'package:peakabu/ui/foundations/sizes.dart';
import 'package:peakabu/ui/molecules/platform_profile_img_upload.dart';
import 'package:peakabu/ui/organisms/custom_show_dialog.dart';
import 'package:peakabu/ui/organisms/redirect/choose_gender_row.dart';
import 'package:peakabu/ui/organisms/search_criteria_form.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class ApplicantProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ApplicantProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicantProvider>(
      create: (context) => ApplicantProvider(applicantRepository, secureLocalRepository, otherService, PageType.update),
      builder: (context, child) {
        var applicantProvider = Provider.of<ApplicantProvider>(context);
        return Scaffold(
          backgroundColor: PlatformColor.offWhiteColor3,
          appBar: AppBar(
            title: const Text("Profil Düzenle"),
            centerTitle: true,
          ),
          body: Consumer<ApplicantProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success && applicantProvider.applicantProfile != null) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 36,
                          ),
                          child: PlatformProfileImgUpload(
                            isFirst: false,
                            file: provider.file,
                            imageUrl: applicantProvider.applicantProfile!.image ?? "",
                            onTap: () {
                              showUpdateProfileImage(context, provider);
                            },
                          ),
                        ),
                        const PlatformLabel(
                          text: "Adınız",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: TextFormField(
                            controller: TextEditingController()..text = applicantProvider.applicantProfile!.name!,
                            decoration: const InputDecoration(
                              hintText: 'Adınız',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen adınızı ve soyadınızı giriniz.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              applicantProvider.applicantProfile!.name = value;
                              //applicantProvider.refresh();
                            },
                          ),
                        ),
                        const PlatformLabel(
                          text: "Cinsiyet",
                        ),
                        ChooseGenderRow(
                          onSelected: applicantProvider.applicantProfile!.gender! == "female",
                          onTap: (p0) {
                            applicantProvider.applicantProfile!.gender = p0 ? "female" : "male";
                            applicantProvider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Şehir",
                          selectedValue: applicantProvider.applicantProfile!.city,
                          data: applicantProvider.otherService.cities,
                          onChange: (p0) async {
                            applicantProvider.applicantProfile!.city = p0;
                            await applicantProvider.updateDistrictByCity(p0);
                            await applicantProvider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "İlçe",
                          selectedValue: applicantProvider.applicantProfile!.district,
                          data: applicantProvider.otherService.districts,
                          onChange: (p0) async {
                            applicantProvider.applicantProfile!.district = p0;
                            await applicantProvider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Yardımcı türü",
                          selectedValue: applicantProvider.applicantProfile!.caretakerType,
                          data: applicantProvider.otherService.caretakerTypes,
                          onChange: (p0) async {
                            applicantProvider.applicantProfile!.caretakerType = p0;
                            await applicantProvider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Çalışma şekli",
                          selectedValue: applicantProvider.applicantProfile!.shiftSystem,
                          data: applicantProvider.otherService.shiftSystems,
                          onChange: (p0) async {
                            applicantProvider.applicantProfile!.shiftSystem = p0;
                            await applicantProvider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Deneyim",
                          selectedValue: applicantProvider.applicantProfile!.experience,
                          data: applicantProvider.otherService.experiences,
                          onChange: (p0) async {
                            applicantProvider.applicantProfile!.experience = p0;
                            await applicantProvider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Uyruk",
                          selectedValue: applicantProvider.applicantProfile!.nationality,
                          data: applicantProvider.otherService.nationalities,
                          onChange: (p0) async {
                            applicantProvider.applicantProfile!.nationality = p0;
                            await applicantProvider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Yaş",
                          selectedValue: applicantProvider.applicantProfile!.age,
                          data: applicantProvider.otherService.ages,
                          onChange: (p0) async {
                            applicantProvider.applicantProfile!.age = p0;
                            await applicantProvider.refresh();
                          },
                        ),
                        const PlatformLabel(
                          text: "Başlık",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: TextFormField(
                            controller: TextEditingController()..text = applicantProvider.applicantProfile!.title!,
                            decoration: const InputDecoration(
                              hintText: 'Başlık',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            cursorColor: PlatformColor.offBlackColor,
                            onChanged: (value) {
                              applicantProvider.applicantProfile!.title = value;
                              //applicantProvider.refresh();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen başlık giriniz.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const PlatformLabel(
                          text: "Kendinizi kısace tanıtınız",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: TextFormField(
                            maxLines: 4,
                            controller: TextEditingController()..text = applicantProvider.applicantProfile!.desc!,
                            decoration: const InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            cursorColor: PlatformColor.offBlackColor,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bu alanın doldurulması zorunludur.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              applicantProvider.applicantProfile!.desc = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (provider.networkStatus == NetworkStatus.error) {
                return const Center(
                  child: Text(""),
                );
              }
              return const Center(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    color: PlatformColor.primaryColor,
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: Consumer<ApplicantProvider>(
            builder: (context, provider, child) {
              return Container(
                height: 100,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    PlatformDimensionFoundations.sizeXXL,
                    PlatformDimensionFoundations.sizeXL,
                    PlatformDimensionFoundations.sizeXXL,
                    PlatformDimensionFoundations.sizeXL,
                  ),
                  child: PlatformSubmitButton(
                    buttonText: "Kaydet",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (applicantProvider.file != null || applicantProvider.applicantProfile!.image!.isNotEmpty) {
                          applicantProvider.updateApplicantProfile().then(
                                (value) => {
                                  if (value.isSuccess!)
                                    {Navigator.of(context).pushReplacementNamed("/applicant_detail")}
                                  else
                                    {
                                      const CustomShowDialog().showDialog(context, "Uyarı", value.message!),
                                    }
                                },
                              );
                        } else {
                          const CustomShowDialog().showDialog(context, "Uyarı", "Resim eklemek zorunludur");
                        }
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future showUpdateProfileImage(BuildContext context, ApplicantProvider applicantProvider) async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: PlatformColor.offWhiteColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: PlatformSubmitButton(
                      buttonText: "Kameraya git",
                      onPressed: () async {
                        final image = await ImagePicker().pickImage(source: ImageSource.camera);
                        if (image == null) return;
                        applicantProvider.setProfileImage(image.path).then((value) => Navigator.of(context).pop());
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: PlatformCancelButton(
                      buttonText: "Galeriye git",
                      onPressed: () async {
                        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if (image == null) return;
                        applicantProvider.setProfileImage(image.path).then((value) => Navigator.of(context).pop());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
