import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_cancel_button.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/tokens/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? message;
  final Function()? onCancel, onSubmit;

  const CustomAlertDialog({
    Key? key,
    this.message,
    this.onCancel,
    this.onSubmit,
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
            width: 320,
            height: 256,
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
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: PlatformSubmitButton(
                    buttonText: "Kaydet",
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: PlatformCancelButton(
                    buttonText: "Vazgeç",
                    onPressed: () {},
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

extension CustomAlertDialogExtension on CustomAlertDialog {
  Future<T?> showDialog<T>(BuildContext context, String message) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return CustomAlertDialog(
          message: message,
        );
      },
    );
  }
}
