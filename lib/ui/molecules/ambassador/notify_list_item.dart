import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';

class NotifyListItem extends StatelessWidget {
  const NotifyListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, bottom: 16),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image.network(
                  "https://i.mdel.net/i/db/2018/12/1034512/1034512-800w.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 18,
                left: 12,
                right: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PlatformDefaultText(
                    text:
                        "Fatma isimli adayın 7 aylık bebeğimize bakıcı arıyoruz ilanına yaptığı başvuru kabul edildi.",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    maxLine: 5,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Center(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    color: Color.fromRGBO(14, 191, 119, 0.15),
                  ),
                  child: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
