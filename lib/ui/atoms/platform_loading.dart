import 'package:flutter/material.dart';
import 'package:platform/ui/tokens/colors.dart';

class LoadingBody extends StatelessWidget {
  final Widget? child;
  final bool? isLoading;
  final Color? color;

  const LoadingBody({
    Key? key,
    this.child = const Text(""),
    this.isLoading = false,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child!,
        Visibility(
          visible: isLoading!,
          child: Container(
            color: color != null
                ? color!.withOpacity(0.5)
                : Colors.white.withOpacity(0.5),
            alignment: Alignment.center,
            child: Card(
              color: PlatformColor.offWhiteColor,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: PlatformColor.primaryColor,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Yükleniyor...",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
