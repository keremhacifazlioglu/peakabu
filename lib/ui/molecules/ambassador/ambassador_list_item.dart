import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/atoms/platform_icon.dart';

class AmbassadorListItem extends StatelessWidget {
  const AmbassadorListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, bottom: 16),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image.network(
                  "https://i.mdel.net/i/db/2018/12/1034512/1034512-800w.jpg",
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 18, left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PlatformDefaultText(
                    text: "Fatma",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: PlatformDefaultText(
                      text: "Ev Yardımcısı/Yatılı",
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 16, 4, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      color: Color.fromRGBO(14, 191, 119, 0.15),
                    ),
                    child: const Icon(
                      Icons.refresh,
                      color: Color.fromRGBO(14, 191, 119, 1),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      color: Color.fromRGBO(248, 86, 86, 0.15),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Color.fromRGBO(248, 86, 86, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
