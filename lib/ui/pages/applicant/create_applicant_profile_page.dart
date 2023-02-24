import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/applicant_provider.dart';
import 'package:platform/ui/atoms/platform_cancel_button.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_label.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_profile_img_upload.dart';
import 'package:platform/ui/organisms/custom_show_dialog.dart';
import 'package:platform/ui/organisms/redirect/choose_gender_row.dart';
import 'package:platform/ui/organisms/search_caretaker_criteria_form.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class CreateApplicantProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CreateApplicantProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicantProvider>(
      create: (context) => ApplicantProvider(applicantRepository, otherService),
      builder: (context, child) {
        var applicantProvider = Provider.of<ApplicantProvider>(context);
        return Scaffold(
          backgroundColor: PlatformColor.offWhiteColor3,
          appBar: AppBar(
            title: const Text("Profil Oluştur"),
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(28, 8, 28, 0),
                          child: PlatformHeadText(
                            color: PlatformColorFoundation.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: PlatformTypographyFoundation.titleLarge,
                            headText: "Seçtiğiniz iş ilanına başvurmak için ücretsiz hesap oluşturun.",
                          ),
                        ),
                        PlatformProfileImgUpload(
                          isFirst: true,
                          file: provider.file,
                          imageUrl: applicantProvider.applicantProfile!.image ?? "",
                          onTap: () {
                            showUpdateProfileImage(context, provider);
                          },
                        ),
                        const PlatformLabel(
                          text: "Adınız",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Ad soyad',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            onChanged: (value) {
                              applicantProvider.name = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen adınızı ve soyadınızı giriniz.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const PlatformLabel(
                          text: "Cinsiyet",
                        ),
                        ChooseGenderRow(
                          onSelected: applicantProvider.applicantProfile!.gender! == "Kadın",
                          onTap: (p0) {},
                        ),
                        SearchCaretakerCriteriaForm(
                          text: "Şehir",
                          selectedValue: applicantProvider.applicantProfile!.city,
                          data: applicantProvider.otherService.cities,
                          onChange: (p0) {
                            applicantProvider.applicantProfile!.city = p0;
                            applicantProvider.refresh();
                          },
                        ),
                        SearchCaretakerCriteriaForm(
                          text: "Yardımcı türü",
                          selectedValue: applicantProvider.applicantProfile!.caretakerType,
                          data: applicantProvider.otherService.caretakerTypes,
                          onChange: (p0) {
                            applicantProvider.applicantProfile!.caretakerType = p0;
                            applicantProvider.refresh();
                          },
                        ),
                        SearchCaretakerCriteriaForm(
                          text: "Çalışma şekli",
                          selectedValue: applicantProvider.applicantProfile!.shiftSystems,
                          data: applicantProvider.otherService.shiftSystems,
                          onChange: (p0) {
                            applicantProvider.applicantProfile!.shiftSystems = p0;
                            applicantProvider.refresh();
                          },
                        ),
                        SearchCaretakerCriteriaForm(
                          text: "Deneyim",
                          selectedValue: applicantProvider.applicantProfile!.experience,
                          data: applicantProvider.otherService.experiences,
                          onChange: (p0) {
                            applicantProvider.applicantProfile!.experience = p0;
                            applicantProvider.refresh();
                          },
                        ),
                        SearchCaretakerCriteriaForm(
                          text: "Uyruk",
                          selectedValue: applicantProvider.applicantProfile!.nationality,
                          data: applicantProvider.otherService.nationalities,
                          onChange: (p0) {
                            applicantProvider.applicantProfile!.nationality = p0;
                            applicantProvider.refresh();
                          },
                        ),
                        SearchCaretakerCriteriaForm(
                          text: "Yaş",
                          selectedValue: applicantProvider.applicantProfile!.age,
                          data: applicantProvider.otherService.ages,
                          onChange: (p0) {
                            applicantProvider.applicantProfile!.age = p0;
                            applicantProvider.refresh();
                          },
                        ),
                        const PlatformLabel(
                          text: "Başlık",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Başlık',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            onChanged: (value) {
                              applicantProvider.title = value;
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
                          text: "Kendinizi kısaca tanıtınız",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: TextFormField(
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              applicantProvider.description = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bu alanın doldurulması zorunludur.';
                              }
                              return null;
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
                  child: Text("Uyarı çıkartılacak."),
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
          bottomNavigationBar: Container(
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
                    if (applicantProvider.file != null) {
                      applicantProvider.createApplicantProfile().then((value) => {
                        if(value.isSuccess!){
                          Navigator.of(context).pushReplacementNamed("/applicant_detail")
                        }else{
                          const CustomShowDialog().showDialog(context, "Uyarı", value.message!),
                        }
                      });
                    } else {
                      const CustomShowDialog().showDialog(context, "Uyarı", "Resim eklemek zorunludur");
                    }
                  }
                },
              ),
            ),
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
