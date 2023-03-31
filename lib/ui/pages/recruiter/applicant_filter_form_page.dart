import 'package:flutter/material.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/cons/page_type.dart';
import 'package:peakabu/network/network_status.dart';
import 'package:peakabu/providers/job_posting_provider.dart';
import 'package:peakabu/ui/atoms/platform_label.dart';
import 'package:peakabu/ui/atoms/platform_submit_button.dart';
import 'package:peakabu/ui/foundations/sizes.dart';
import 'package:peakabu/ui/organisms/nationality_search_criteria_form.dart';
import 'package:peakabu/ui/organisms/redirect/choose_gender_row.dart';
import 'package:peakabu/ui/organisms/search_criteria_form.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:peakabu/util/logger.dart';
import 'package:provider/provider.dart';

class ApplicantFilterFormPage extends StatelessWidget {
  const ApplicantFilterFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JobPostingProvider>(
      create: (context) =>
          JobPostingProvider(jobPostingRepository, secureLocalRepository, otherService, PageType.filterForm),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Filtrele"),
            centerTitle: true,
          ),
          body: Consumer<JobPostingProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const PlatformLabel(
                        text: "Cinsiyet",
                      ),
                      ChooseGenderRow(
                        onSelected: provider.otherService.gender,
                        onTap: (p0) {
                          provider.setSelectedGender(p0);
                        },
                      ),
                      SearchCriteriaForm(
                        text: "Şehir",
                        selectedValue: provider.otherService.selectedCity ?? provider.otherService.cities["1"],
                        data: provider.otherService.cities,
                        onChange: (p0) async {
                          await provider.setSelectedCity(p0);
                          await provider.updateDistrictByCity(p0);
                        },
                      ),
                      SearchCriteriaForm(
                        text: "İlçe",
                        selectedValue: provider.otherService.selectedDistrict ?? provider.otherService.districts["1"],
                        data: provider.otherService.districts,
                        onChange: (p0) async {
                          await provider.setSelectedDistrict(p0);
                        },
                      ),
                      SearchCriteriaForm(
                        text: "Yardımcı türü",
                        selectedValue:
                            provider.otherService.selectedCaretakerType ?? provider.otherService.caretakerTypes["1"],
                        data: provider.otherService.caretakerTypes,
                        onChange: (p0) async {
                          Log.w(p0);
                          await provider.setSelectedCaretakerTypes(p0);
                        },
                      ),
                      SearchCriteriaForm(
                        text: "Çalışma şekli",
                        selectedValue:
                            provider.otherService.selectedShiftSystem ?? provider.otherService.shiftSystems["1"],
                        data: provider.otherService.shiftSystems,
                        onChange: (p0) async {
                          await provider.setSelectedShiftSystem(p0);
                        },
                      ),
                      SearchCriteriaForm(
                        text: "Deneyim",
                        selectedValue:
                            provider.otherService.selectedExperience ?? provider.otherService.experiences["1"],
                        data: provider.otherService.experiences,
                        onChange: (p0) async {
                          await provider.setSelectedExperience(p0);
                        },
                      ),
                      NationalitySearchCriteriaForm(
                        data: provider.otherService.nationalities,
                        text: "Uyruk",
                      ),
                      SearchCriteriaForm(
                        text: "Yaş",
                        selectedValue: provider.otherService.selectedAge ?? provider.otherService.ages["1"],
                        data: provider.otherService.ages,
                        onChange: (p0) async {
                          await provider.setSelectedAge(p0);
                        },
                      ),
                    ],
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
          bottomNavigationBar: Consumer<JobPostingProvider>(
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
                    buttonText: "Sonuçları göster",
                    onPressed: () {
                      provider.saveFilterData().then((value) => {
                        Navigator.of(context).pushNamed("/applicant_filters"),
                      });
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
}
