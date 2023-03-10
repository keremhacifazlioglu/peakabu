import 'package:flutter/material.dart';
import 'package:platform/ui/molecules/redirect/redirect_header_text.dart';
import 'package:platform/ui/organisms/redirect/choose_redirect_row.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            RedirectHeaderText(),
            ChooseRedirectRow(),
          ],
        ),
      ),
    );
  }
}
