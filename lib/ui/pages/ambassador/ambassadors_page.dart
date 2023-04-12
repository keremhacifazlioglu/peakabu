import 'package:flutter/material.dart';
import 'package:peakabu/ui/organisms/ambassador/ambassador_list.dart';

class AmbassadorsPage extends StatelessWidget {
  const AmbassadorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yönettiğim Profiller"),
      ),
      body:  const AmbassadorList(),
    );
  }
}
