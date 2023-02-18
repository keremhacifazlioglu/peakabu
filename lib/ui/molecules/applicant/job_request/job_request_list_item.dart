import 'package:flutter/material.dart';
import 'package:platform/cons/request_job_status.dart';
import 'package:platform/domain/response/job/job_request.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';

class JobRequestListItem extends StatelessWidget {
  final JobRequest? jobRequest;

  const JobRequestListItem({
    Key? key,
    this.jobRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 64,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: PlatformDefaultText(
                    text: jobRequest!.title!,
                    color: PlatformColorFoundation.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: PlatformTypographyFoundation.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: PlatformIconLabel(
                        labelIconPath: "assets/icons/group.svg",
                        labelText: "${jobRequest!.caretakerType!}/${jobRequest!.workType!}",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: PlatformIconLabel(
                        labelIconPath: "assets/icons/location.svg",
                        labelText: jobRequest!.district!,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 125,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color:  getColor(jobRequest!.status!)!.withOpacity(0.15),
                ),
                child: Center(
                  child: PlatformDefaultText(
                    text: requestJobStatus[jobRequest!.status],
                    color: getColor(jobRequest!.status!),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color? getColor(String status)  {
    Color? jobRequestTextColor;
    switch (status) {
      case "sent_job":
        {
          jobRequestTextColor = const Color.fromRGBO(54, 120, 253, 1);
          break;
        }
      case "accept_job":
        {
          jobRequestTextColor = const Color.fromRGBO(14, 191, 119, 1);
          break;
        }
      case "reject_job":
        {
          jobRequestTextColor = const Color.fromRGBO(248, 86, 86, 1);
          break;
        }
      case "wait_request":
        {
          jobRequestTextColor = const Color.fromRGBO(153 ,153, 153, 1);
          break;
        }
      case "accept_request":
        {
          jobRequestTextColor = const Color.fromRGBO(14, 191, 119, 1);
          break;
        }
      case "reject_request":
        {
          jobRequestTextColor = const Color.fromRGBO(248, 86, 86, 1);
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
