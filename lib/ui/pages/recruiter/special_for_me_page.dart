import 'package:flutter/material.dart';
import 'package:platform/ui/organisms/recruiter/special_for_me/special_for_me_list.dart';
import 'package:platform/ui/tokens/colors.dart';

class SpecialForMePage extends StatelessWidget {
  const SpecialForMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformColor.offWhiteColor3,
      appBar: AppBar(
        title: const Text("Bana Özel"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SpecialForMeList(),
      ),
    );
  }
}
