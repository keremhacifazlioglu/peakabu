import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/atoms/platform_label.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_list.dart';
import 'package:platform/ui/organisms/redirect/choose_gender_row.dart';
import 'package:platform/ui/organisms/search_caretaker_criteria_form.dart';
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
              Navigator.of(context,rootNavigator: true).pushNamed("/job_filter");
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
