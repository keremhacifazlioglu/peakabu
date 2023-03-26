import 'package:flutter/material.dart';
import 'package:platform/cons/request_job_status.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';

class ApplicantHiredListItem extends StatelessWidget {
  final ApplicantRequest? applicantRequest;

  const ApplicantHiredListItem({
    Key? key,
    this.applicantRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 16, left: 20, bottom: 15),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image.network(
                  applicantRequest!.image!,
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 64,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: PlatformDefaultText(
                      text: applicantRequest!.title!.split(" ").first,
                      color: PlatformColorFoundation.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: PlatformTypographyFoundation.bodyLarge,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: PlatformIconLabel(
                          labelIconPath: "assets/icons/group.svg",
                          labelText: "${applicantRequest!.caretakerType!}/${applicantRequest!.shiftSystem!}",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: 125,
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: getColor(applicantRequest!.requestStatus!)!.withOpacity(0.15),
                    ),
                    child: Center(
                      child: PlatformDefaultText(
                        text: requestJobStatus[applicantRequest!.requestStatus],
                        color: getColor(applicantRequest!.requestStatus!),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color? getColor(String status) {
    Color? jobRequestTextColor;
    switch (status) {
      case "pending":
        {
          jobRequestTextColor = const Color.fromRGBO(54, 120, 253, 1);
          break;
        }
      case "accepted":
        {
          jobRequestTextColor = const Color.fromRGBO(14, 191, 119, 1);
          break;
        }
      case "rejected":
        {
          jobRequestTextColor = const Color.fromRGBO(248, 86, 86, 1);
          break;
        }
      case "wait_request":
        {
          jobRequestTextColor = const Color.fromRGBO(153, 153, 153, 1);
          break;
        }
      default:
        {
          break;
        }
    }

    return jobRequestTextColor;
  }
}
