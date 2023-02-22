import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/job_posting_provider.dart';
import 'package:platform/ui/atoms/platform_label.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/redirect/choose_gender_row.dart';
import 'package:platform/ui/organisms/search_caretaker_criteria_form.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/util/logger.dart';
import 'package:provider/provider.dart';

class JobFilterFormPage extends StatelessWidget {
  const JobFilterFormPage({Key? key}) : super(key: key);

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
                        onTap: (p0) {},
                      ),
                      SearchCaretakerCriteriaForm(
                        text: "Şehir",
                        selectedValue: provider.otherService.selectedCity ?? provider.otherService.cities["1"],
                        data: provider.otherService.cities,
                        onChange: (p0) async {
                          await provider.setSelectedCity(p0);
                        },
                      ),
                      SearchCaretakerCriteriaForm(
                        text: "Yardımcı türü",
                        selectedValue:
                            provider.otherService.selectedCaretakerType ?? provider.otherService.caretakerTypes["1"],
                        data: provider.otherService.caretakerTypes,
                        onChange: (p0) async {
                          Log.w(p0);
                          await provider.setSelectedCaretakerTypes(p0);
                        },
                      ),
                      SearchCaretakerCriteriaForm(
                        text: "Çalışma şekli",
                        selectedValue:
                            provider.otherService.selectedShiftSystem ?? provider.otherService.shiftSystems["1"],
                        data: provider.otherService.shiftSystems,
                        onChange: (p0) async {
                          await provider.setSelectedShiftSystem(p0);
                        },
                      ),
                      SearchCaretakerCriteriaForm(
                        text: "Deneyim",
                        selectedValue:
                            provider.otherService.selectedExperience ?? provider.otherService.experiences["1"],
                        data: provider.otherService.experiences,
                        onChange: (p0) async {
                          await provider.setSelectedExperience(p0);
                        },
                      ),
                      SearchCaretakerCriteriaForm(
                        text: "Uyruk",
                        selectedValue:
                            provider.otherService.selectedNationality ?? provider.otherService.nationalities["1"],
                        data: provider.otherService.nationalities,
                        onChange: (p0) async {
                          await provider.setSelectedNationality(p0);
                        },
                      ),
                      SearchCaretakerCriteriaForm(
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
                      provider.saveFilterData();
                      Navigator.of(context).pushNamed("/job_filters");
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
