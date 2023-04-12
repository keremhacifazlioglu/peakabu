import 'package:flutter/material.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/molecules/ambassador/ambassador_list_item.dart';
import 'package:peakabu/ui/tokens/colors.dart';

class AmbassadorList extends StatelessWidget {
  const AmbassadorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const PageStorageKey<String>("ApplicantJobPosting"),
      addAutomaticKeepAlives: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 115,
            color: PlatformColor.offWhiteColor,
            child: const AmbassadorListItem()
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 2,
          color: PlatformColorFoundation.dividerColor,
        );
      },
      itemCount: 3,
    );
  }
}
