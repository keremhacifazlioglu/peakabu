import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/providers/applicant_provider.dart';
import 'package:platform/ui/atoms/platform_label.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/molecules/platform_profile_img_upload.dart';
import 'package:platform/ui/organisms/redirect/choose_gender_row.dart';
import 'package:platform/ui/organisms/search_caretaker_criteria_form.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class ApplicantProfilePage extends StatelessWidget {
  const ApplicantProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicantProvider>(
      create: (context) => ApplicantProvider(applicantRepository),
      builder: (context, child) {
        var applicantProvider = Provider.of<ApplicantProvider>(context);
        return Scaffold(
          backgroundColor: PlatformColor.offWhiteColor3,
          appBar: AppBar(
            title: const Text("Profil Düzenle"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 36,
                  ),
                  child: PlatformProfileImgUpload(
                    isFirst: false,
                    imageUrl: applicantProvider.applicantProfile!.image ?? "",
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
                  ),
                ),
                const PlatformLabel(
                  text: "Cinsiyet",
                ),
                ChooseGenderRow(
                  onSelected:applicantProvider.applicantProfile!.gender! == "Kadın" ,
                  onTap: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Şehir",
                  selectedValue: applicantProvider.applicantProfile!.city,
                  data: const {
                    "0": "İstanbul",
                    "1": "Ankara",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Yardımcı türü",
                  selectedValue: applicantProvider.applicantProfile!.caretakerType,
                  data: const {
                    "0": "Bebek Bakıcısı",
                    "1": "Yaşlı Bakıcısı",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Çalışma şekli",
                  selectedValue: applicantProvider.applicantProfile!.shiftSystems,
                  data: const {
                    "0": "Gündüzlü",
                    "1": "Akşamcı",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Deneyim",
                  selectedValue: applicantProvider.applicantProfile!.experience,
                  data: const {
                    "0": "1-3 Yıl",
                    "1": "3-5 Yıl",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Uyruk",
                  selectedValue: applicantProvider.applicantProfile!.nationality,
                  data: const {
                    "0": "Türkmenistan",
                    "1": "Rus",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Yaş",
                  selectedValue: applicantProvider.applicantProfile!.age,
                  data: const {
                    "0": "25-34",
                    "1": "34-45",
                  },
                  onChange: (p0) {},
                ),
                const PlatformLabel(
                  text: "Başlık",
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: TextEditingController()..text = applicantProvider.applicantProfile!.descTitle!,
                    decoration: const InputDecoration(
                      hintText: 'Başlık',
                      contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                    ),
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
                  ),
                ),
              ],
            ),
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
                onPressed: () {},
              ),
            ),
          ),
        );
      },
    );
  }
}
