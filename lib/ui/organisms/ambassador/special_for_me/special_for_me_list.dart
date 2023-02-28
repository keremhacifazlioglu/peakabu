import 'package:flutter/material.dart';
import 'package:platform/ui/molecules/applicant/special_for_me/special_for_me_item.dart';

class SpecialForMeList extends StatelessWidget {
  const SpecialForMeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed("/my_job_posting_detail");
            },
            child: const SpecialForMeItem(
                svgPath: "assets/icons/job_notfy.svg", title: "İş ilanım"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed("applicant_request", arguments: true);
            },
            child: const SpecialForMeItem(
                svgPath: "assets/icons/user_groups.svg",
                title: "İş Başvuruları",),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed("applicant_request", arguments: false);
            },
            child: const SpecialForMeItem(
                svgPath: "assets/icons/iconSend.svg", title: "İletişim talepleri"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed("applicant_follow");
            },
            child: const SpecialForMeItem(
                svgPath: "assets/icons/empty_star.svg", title: "Favori Adaylarım"),
          ),
          const SpecialForMeItem(
              svgPath: "assets/icons/iconSettings.svg", title: "Ayarlar"),
        ],
      ),
    );
  }
}
