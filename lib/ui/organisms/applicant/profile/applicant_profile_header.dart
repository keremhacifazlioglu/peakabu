import 'package:flutter/material.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/ui/molecules/applicant/profile/applicant_profile_header_card.dart';
import 'package:platform/ui/tokens/sizes.dart';

class ApplicantDetailHeader extends StatelessWidget {
  final ApplicantProfile? applicantProfile;

  const ApplicantDetailHeader({Key? key, this.applicantProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(PlatformDimension.sizeXL),
                    bottomRight: Radius.circular(PlatformDimension.sizeXL),
                  ),
                  color: Colors.black),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(PlatformDimension.sizeXL),
                  bottomRight: Radius.circular(PlatformDimension.sizeXL),
                ),
                child: Image.network(
                  applicantProfile!.image!,
                  //"https://i.mdel.net/i/db/2018/12/1034512/1034512-800w.jpg",
                  fit: BoxFit.cover,
                  height: 500,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 27,
            right: 27,
            child: ApplicantProfileHeaderCard(
              applicantProfile: applicantProfile!,
            ),
          ),
        ],
      ),
    );
  }
}
