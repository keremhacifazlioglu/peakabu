import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peakabu/config/injection.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/firebase_options.dart';
import 'package:peakabu/providers/other_provider.dart';
import 'package:peakabu/providers/root_recruiter_provider.dart';
import 'package:peakabu/providers/root_provider.dart';
import 'package:peakabu/route_generator.dart';
import 'package:peakabu/ui/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RootProvider>(
          create: (_) => RootProvider(secureLocalRepository),
        ),
        ChangeNotifierProvider<RootRecruiterProvider>(
          create: (_) => RootRecruiterProvider(secureLocalRepository),
        ),
        ChangeNotifierProvider<OtherProvider>(
          create: (_) => OtherProvider(otherRepository),
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
      initialRoute: "splash",
      navigatorKey: RouteGenerator.mainNavigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

