import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/applicant/profile/applicant_profile_body.dart';
import 'package:platform/ui/organisms/applicant/profile/applicant_profile_header.dart';

class ApplicantDetailPage extends StatelessWidget {
  const ApplicantDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yardımcı detay"),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 1200,
            child: Stack(
              children: const [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: ApplicantDetailHeader(),
                ),
                Positioned(
                  top: 590,
                  left: 27,
                  right: 27,
                  child: ApplicantProfileBody(),
                ),
              ],
            ),
          ),
        ],
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
            buttonText: "Düzenle",
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed("/applicant_profile");
            },
          ),
        ),
      ),
    );
  }
}
