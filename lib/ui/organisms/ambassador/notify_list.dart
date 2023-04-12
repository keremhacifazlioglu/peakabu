import 'package:flutter/material.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/molecules/ambassador/notify_list_item.dart';
import 'package:peakabu/ui/tokens/colors.dart';

class NotifyList extends StatelessWidget {
  const NotifyList({Key? key}) : super(key: key);

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
              child: const NotifyListItem()
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