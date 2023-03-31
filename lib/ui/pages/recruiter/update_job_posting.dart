import 'package:flutter/material.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/cons/page_type.dart';
import 'package:peakabu/network/network_status.dart';
import 'package:peakabu/providers/job_posting_provider.dart';
import 'package:peakabu/ui/atoms/platform_head_text.dart';
import 'package:peakabu/ui/atoms/platform_label.dart';
import 'package:peakabu/ui/atoms/platform_submit_button.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/foundations/sizes.dart';
import 'package:peakabu/ui/foundations/typography.dart';
import 'package:peakabu/ui/organisms/custom_show_dialog.dart';
import 'package:peakabu/ui/organisms/nationality_search_criteria_form.dart';
import 'package:peakabu/ui/organisms/redirect/choose_gender_row.dart';
import 'package:peakabu/ui/organisms/search_criteria_form.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class UpdateJobPostingPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  UpdateJobPostingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JobPostingProvider>(
      create: (context) =>
          JobPostingProvider(jobPostingRepository, secureLocalRepository, otherService, PageType.update),
      builder: (context, child) {
        var jobPostingProvider = Provider.of<JobPostingProvider>(context);
        return Scaffold(
          backgroundColor: PlatformColor.offWhiteColor3,
          appBar: AppBar(
            title: const Text("İş ilanı düzenle"),
            centerTitle: true,
          ),
          body: Consumer<JobPostingProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success && provider.otherService.selectedDistrict != null) {
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
                            headText: "Seçtiğiniz adayla iletişime geçmek için ücretsiz hesap oluşturun.",
                          ),
                        ),
                        const PlatformLabel(
                          text: "İlan Başlığı",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                          child: TextFormField(
                            controller: TextEditingController()..text = provider.jobDetail!.title!,
                            decoration: const InputDecoration(
                              hintText: 'Kısa bir başlık giriniz',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            onChanged: (value) {
                              provider.title = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen başlık bilgisi giriniz.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const PlatformLabel(
                          text: "Cinsiyet",
                        ),
                        ChooseGenderRow(
                          onSelected: provider.jobDetail!.gender == "female",
                          onTap: (p0) {
                            provider.jobDetail!.gender = p0 ? "female" : "male";
                            provider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Şehir",
                          selectedValue: provider.jobDetail!.city,
                          data: provider.otherService.cities,
                          onChange: (p0) async {
                            provider.jobDetail!.city = p0;
                            await provider.updateDistrictByCity(p0);
                            provider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "İlçe",
                          selectedValue: provider.jobDetail!.district,
                          data: provider.otherService.districts,
                          onChange: (p0) {
                            provider.jobDetail!.district = p0;
                            provider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Yardımcı türü",
                          selectedValue: provider.jobDetail!.caretakerType,
                          data: provider.otherService.caretakerTypes,
                          onChange: (p0) {
                            provider.jobDetail!.caretakerType = p0;
                            provider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Çalışma şekli",
                          selectedValue: provider.jobDetail!.shiftSystem,
                          data: provider.otherService.shiftSystems,
                          onChange: (p0) {
                            provider.jobDetail!.shiftSystem = p0;
                            provider.refresh();
                          },
                        ),
                        SearchCriteriaForm(
                          text: "Deneyim",
                          selectedValue: provider.jobDetail!.experience,
                          data: provider.otherService.experiences,
                          onChange: (p0) {
                            provider.jobDetail!.experience = p0;
                            provider.refresh();
                          },
                        ),
                        NationalitySearchCriteriaForm(
                          data: provider.otherService.nationalities,
                          text:  "Uyruk",
                        ),
                        SearchCriteriaForm(
                          text: "Yaş",
                          selectedValue: provider.jobDetail!.age,
                          data: provider.otherService.ages,
                          onChange: (p0) {
                            provider.jobDetail!.age = p0;
                            provider.refresh();
                          },
                        ),
                        const PlatformLabel(
                          text: "Açıklama",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: TextFormField(
                            maxLines: 4,
                            controller: TextEditingController()..text = provider.jobDetail!.desc!,
                            decoration: const InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                            ),
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              provider.description = value;
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
                    jobPostingProvider.updateJobPosting().then(
                          (value) => {
                            if (value.isSuccess!)
                              {
                                Navigator.of(context).pushReplacementNamed("/my_job_posting_detail"),
                              }
                            else
                              {
                                const CustomShowDialog().showDialog(context, "Uyarı", value.message!),
                              }
                          },
                        );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
