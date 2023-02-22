import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/providers/applicant_provider.dart';
import 'package:platform/ui/atoms/platform_cancel_button.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_label.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_profile_img_upload.dart';
import 'package:platform/ui/organisms/redirect/choose_gender_row.dart';
import 'package:platform/ui/organisms/search_caretaker_criteria_form.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class CreateApplicantProfilePage extends StatelessWidget {
  const CreateApplicantProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformColor.offWhiteColor3,
      appBar: AppBar(
        title: const Text("Profil Oluştur"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<ApplicantProvider>(
        create: (context) => ApplicantProvider(applicantRepository,otherService),
        builder: (context, child) {
          var provider = Provider.of<ApplicantProvider>(context);
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 8, 28, 0),
                  child: PlatformHeadText(
                    color: PlatformColorFoundation.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: PlatformTypographyFoundation.titleLarge,
                    headText:
                        "Seçtiğiniz iş ilanına başvurmak için ücretsiz hesap oluşturun.",
                  ),
                ),
                PlatformProfileImgUpload(
                  isFirst: true,
                  onTap: () async {
                    showUpdateProfileImage( context,  provider);
                  },
                ),
                const PlatformLabel(
                  text: "Adınız",
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Adınız',
                      contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                const PlatformLabel(
                  text: "Cinsiyet",
                ),
                ChooseGenderRow(
                  onSelected: false,
                  onTap: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Şehir",
                  data: const {
                    "0": "İstanbul",
                    "1": "Ankara",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Yardımcı türü",
                  data: const {
                    "0": "Bebek Bakıcısı",
                    "1": "Yaşlı Bakıcısı",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Çalışma şekli",
                  data: const {
                    "0": "Gündüzlü",
                    "1": "Akşamcı",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Deneyim",
                  data: const {
                    "0": "1-3 Yıl",
                    "1": "3-5 Yıl",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Uyruk",
                  data: const {
                    "0": "Türk",
                    "1": "Rus",
                  },
                  onChange: (p0) {},
                ),
                SearchCaretakerCriteriaForm(
                  text: "Yaş",
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
                    decoration: const InputDecoration(
                      hintText: '',
                      contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                    ),
                  ),
                ),
              ],
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
            buttonText: "Profil Oluştur",
            onPressed: () {
              Navigator.of(context).pushNamed("/job_posting_detail");
            },
          ),
        ),
      ),
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
