import 'package:flutter/material.dart';
import 'package:platform/ui/pages/recruiter/applicant_filter_form_page.dart';
import 'package:platform/ui/pages/recruiter/applicant_filter_page.dart';
import 'package:platform/ui/pages/recruiter/applicant_follow_page.dart';
import 'package:platform/ui/pages/recruiter/applicant_hired_page.dart';
import 'package:platform/ui/pages/recruiter/applicants_page.dart';
import 'package:platform/ui/pages/recruiter/create_job_posting.dart';
import 'package:platform/ui/pages/recruiter/my_job_posting_page.dart';
import 'package:platform/ui/pages/recruiter/special_for_me_page.dart' as ambassador;
import 'package:platform/ui/pages/applicant/applicant_detail_page.dart';
import 'package:platform/ui/pages/applicant/applicant_profile_page.dart';
import 'package:platform/ui/pages/applicant/create_applicant_profile_page.dart';
import 'package:platform/ui/pages/applicant/job_filter_form_page.dart';
import 'package:platform/ui/pages/applicant/job_filter_page.dart';
import 'package:platform/ui/pages/applicant/job_follow_page.dart';
import 'package:platform/ui/pages/applicant/job_request_page.dart';
import 'package:platform/ui/pages/applicant/special_for_me_page.dart';
import 'package:platform/ui/pages/confirm_sms_page.dart';
import 'package:platform/ui/pages/create_account_page.dart';
import 'package:platform/ui/pages/redirect_page.dart';
import 'package:platform/ui/pages/root_recruiter_page.dart';
import 'package:platform/ui/pages/root_applicant_page.dart';
import 'package:platform/ui/pages/splash_page.dart';

import 'ui/pages/recruiter/acceptable_applicant_detail_page.dart';
import 'ui/pages/recruiter/update_job_posting.dart';
import 'ui/pages/applicant/job_posting_detail_page.dart';
import 'ui/pages/applicant/job_posting_page.dart';

// todo GoRoute a taşınmasında fayda var.

extension RouteSettingsEx on RouteSettings {
  T? routeArgs<T>() => arguments as T?;
}

class RouteGenerator {
  static GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => mainNavigatorKey.currentState;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case '/applicant':
        return MaterialPageRoute(
          builder: (_) => const RootApplicantPage(),
        );
      case '/recruiter':
        return MaterialPageRoute(
          builder: (_) => const RootRecruiterPage(),
        );
      case 'redirect':
        return MaterialPageRoute(
          builder: (_) => const RedirectPage(),
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
          builder: (_) => JobRequestPage(
            selectedTab: settings.routeArgs(),
          ),
        );
      case 'special_for_me':
        return MaterialPageRoute(
          builder: (_) => const SpecialForMePage(),
        );
      case 'recruiter_special_for_me':
        return MaterialPageRoute(
          builder: (_) => const ambassador.SpecialForMePage(),
        );
      case 'applicants':
        return MaterialPageRoute(
          builder: (_) => ApplicantsPage(),
        );
      case 'applicant_follow':
        return MaterialPageRoute(
          builder: (_) => const ApplicantFollowPage(),
        );
      case 'applicant_request':
        return MaterialPageRoute(
          builder: (_) => ApplicantRequestPage(
            selectedTab: settings.routeArgs(),
          ),
        );
      case '/job_posting_detail':
        return MaterialPageRoute(
          builder: (_) => JobPostingDetailPage(
            jobPosting: settings.routeArgs(),
            isAccepted: false,
          ),
        );
      case '/acceptable_job_posting_detail':
        return MaterialPageRoute(
          builder: (_) => JobPostingDetailPage(
            jobPosting: settings.routeArgs(),
            isAccepted: true,
          ),
        );
      case '/my_job_posting_detail':
        return MaterialPageRoute(
          builder: (_) => MyJobPostingPage(
            jobPosting: settings.routeArgs(),
          ),
        );
      case '/create_my_job_posting':
        return MaterialPageRoute(
          builder: (_) => CreateJobPostingPage(),
        );
      case '/update_my_job_posting':
        return MaterialPageRoute(
          builder: (_) => UpdateJobPostingPage(),
        );
      case '/applicant_profile':
        return MaterialPageRoute(
          builder: (_) => ApplicantProfilePage(),
        );
      case '/create_applicant_profile':
        return MaterialPageRoute(
          builder: (_) => CreateApplicantProfilePage(),
        );
      case '/applicant_detail':
        return MaterialPageRoute(
          builder: (_) => const ApplicantDetailPage(),
        );
      case '/acceptable_applicant_detail':
        return MaterialPageRoute(
          builder: (_) => const AcceptableApplicantDetailPage(),
        );
      case '/create_account':
        return MaterialPageRoute(
          builder: (_) => CreateAccountPage(),
        );
      case '/confirm_sms':
        return MaterialPageRoute(
          builder: (_) => const ConfirmSmsPage(),
        );
      case '/job_filter':
        return MaterialPageRoute(
          builder: (_) => const JobFilterFormPage(),
        );
      case '/job_filters':
        return MaterialPageRoute(
          builder: (_) => const JobFilterPage(),
        );
      case '/applicant_filter_form':
        return MaterialPageRoute(
          builder: (_) => const ApplicantFilterFormPage(),
        );
      case '/applicant_filters':
        return MaterialPageRoute(
          builder: (_) => const ApplicantFilterPage(),
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
