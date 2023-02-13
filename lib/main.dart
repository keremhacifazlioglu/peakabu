import 'package:flutter/material.dart';
import 'package:platform/providers/root_provider.dart';
import 'package:platform/route_generator.dart';
import 'package:platform/ui/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RootProvider>(
          create: (_) => RootProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: "/",
      navigatorKey: RouteGenerator.mainNavigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
