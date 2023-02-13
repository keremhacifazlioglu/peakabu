import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/platform_tab_menu.dart';
import 'package:platform/ui/organisms/applicant/job_request/job_request_list.dart';
import 'package:platform/ui/tokens/colors.dart';

class JobRequestPage extends StatelessWidget {
  const JobRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("İş Başvurularım"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              width: double.infinity,
              height: 80,
              color: PlatformColor.offWhiteColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(27, 20, 27, 20),
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: PlatformColor.primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: PlatformTabMenu(
                          width: (MediaQuery.of(context).size.width - 64) / 2,
                          color: PlatformColor.primaryColor,
                          borderColor: PlatformColor.primaryColor,
                          text: "İş Başvuruları",
                          textColor: PlatformColor.offWhiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: PlatformTabMenu(
                          width: (MediaQuery.of(context).size.width - 64) / 2,
                          color: PlatformColor.offWhiteColor,
                          borderColor: PlatformColor.offWhiteColor,
                          text: "İletişim Talepleri",
                          textColor: PlatformColor.grayLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: PlatformColorFoundation.dividerColor,
          ),
          const Expanded(
            flex: 4,
            child: JobRequestList(),
          ),
        ],
      ),
    );
  }
}
