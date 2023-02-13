import 'package:flutter/material.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_list.dart';

class JobFollowPage extends StatelessWidget {
  const JobFollowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Takip ettiklerim"),
      ),
      body: const JobPostingList(),
    );
  }
}
