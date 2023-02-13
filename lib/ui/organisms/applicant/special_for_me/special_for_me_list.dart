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
              Navigator.of(context,rootNavigator: true).pushNamed("/applicant_detail");
            },
            child: const SpecialForMeItem(svgPath: "assets/icons/user.svg", title: "Aday Profilim"),
          ),
          const SpecialForMeItem(svgPath: "assets/icons/iconMegaphone.svg", title: "İletişim Talepleri"),
          const SpecialForMeItem(svgPath: "assets/icons/iconSend.svg", title: "İş Başvurularım"),
          const SpecialForMeItem(svgPath: "assets/icons/star.svg", title: "Favori İş İlanlarım"),
          const SpecialForMeItem(svgPath: "assets/icons/iconSettings.svg", title: "Ayarlar"),
        ],
      ),
    );
  }
}
