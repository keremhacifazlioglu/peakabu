import 'package:flutter/material.dart';
import 'package:peakabu/ui/organisms/ambassador/notify_list.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yönettiğim Profiller"),
      ),
      body:  const NotifyList(),
    );
  }
}
