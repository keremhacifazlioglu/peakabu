import 'package:flutter/material.dart';
import 'package:platform/ui/pages/applicant/applicant_detail_page.dart';
import 'package:platform/ui/pages/applicant/applicant_profile_page.dart';
import 'package:platform/ui/pages/applicant/create_applicant_profile_page.dart';
import 'package:platform/ui/pages/applicant/job_filter_form_page.dart';
import 'package:platform/ui/pages/applicant/job_follow_page.dart';
import 'package:platform/ui/pages/applicant/job_request_page.dart';
import 'package:platform/ui/pages/confirm_sms_page.dart';
import 'package:platform/ui/pages/create_account_page.dart';
import 'package:platform/ui/pages/root_page.dart';
import 'package:platform/ui/pages/applicant/special_for_me_page.dart';

import 'ui/pages/applicant/job_posting_detail_page.dart';
import 'ui/pages/applicant/job_posting_page.dart';

extension RouteSettingsEx on RouteSettings {
  T? routeArgs<T>() => arguments as T?;
}

class RouteGenerator {
  static GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => mainNavigatorKey.currentState;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const RootPage(),
        );
      case 'job_posting':
        return MaterialPageRoute(
          builder: (_) => JobPostingPage(),
        );
      case 'job_follow':
        return MaterialPageRoute(
          builder: (_) => const JobFollowPage(),
        );
      case 'job_request':
        return MaterialPageRoute(
          builder: (_) => const JobRequestPage(),
        );
      case 'special_for_me':
        return MaterialPageRoute(
          builder: (_) => const SpecialForMePage(),
        );
      case '/job_posting_detail':
        return MaterialPageRoute(
          builder: (_) => const JobPostingDetailPage(),
        );
      case '/applicant_profile':
        return MaterialPageRoute(
          builder: (_) => const ApplicantProfilePage(),
        );
      case '/create_applicant_profile':
        return MaterialPageRoute(
          builder: (_) => const CreateApplicantProfilePage(),
        );
      case '/applicant_detail':
        return MaterialPageRoute(
          builder: (_) => const ApplicantDetailPage(),
        );
      case '/create_account':
        return MaterialPageRoute(
          builder: (_) => const CreateAccountPage(),
        );
      case '/confirm_sms':
        return MaterialPageRoute(
          builder: (_) => const ConfirmSmsPage(),
        );
      case '/job_filter':
        return MaterialPageRoute(
          builder: (_) => const JobFilterFormPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Hata'),
          ),
          body: const Center(
            child: Text('Sayfa Bulunamadı'),
          ),
        );
      },
    );
  }
}
