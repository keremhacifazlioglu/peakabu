import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/storage/storage_item.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_list.dart';
import 'package:platform/ui/tokens/colors.dart';

class JobPostingPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  JobPostingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformColor.offWhiteColor2,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("İş ilanları"),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              secureLocalRepository.writeSecureData(
                StorageItem("deneme", "deneme"),
              );
              Navigator.of(context, rootNavigator: true)
                  .pushNamed("/job_filter");
            },
            child: const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16,
                ),
                child: PlatformIcon(
                  width: PlatformDimensionFoundations.sizeXL,
                  height: PlatformDimensionFoundations.sizeXL,
                  color: Colors.black,
                  svgPath: "assets/icons/filter.svg",
                ),
              ),
            ),
          ),
        ],
      ),
      body: const JobPostingList(),
    );
  }
}
