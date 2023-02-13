import 'package:flutter/material.dart';
import 'package:platform/ui/tokens/colors.dart';

class CustomShowDialog extends StatelessWidget {
  final String? message, description;

  const CustomShowDialog({
    Key? key,
    this.message,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.1),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 16, 5, 16),
                  child: Center(
                    child: Text(
                      "$message",
                      style: const TextStyle(
                        color: PlatformColor.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 16, 5, 16),
                  child: Center(
                    child: Text(
                      "$description",
                      style: const TextStyle(color: Colors.black, fontSize: 15, decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension CustomShowDialogExtension on CustomShowDialog {
  Future<T?> showDialog<T>(BuildContext context, String message, String description) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return CustomShowDialog(
          message: message,
          description: description,
        );
      },
    );
  }
}
