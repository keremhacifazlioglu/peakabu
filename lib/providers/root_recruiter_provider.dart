import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/route_generator.dart';
import 'package:platform/storage/secure_local_repository.dart';

@injectable
class RootRecruiterProvider extends ChangeNotifier {
  final Map<String, GlobalKey<NavigatorState>> _routes = {
    "applicants": GlobalKey<NavigatorState>(),
    "applicant_follow": GlobalKey<NavigatorState>(),
    "applicant_request": GlobalKey<NavigatorState>(),
    "recruiter_special_for_me": GlobalKey<NavigatorState>(),
  };
  final SecureLocalRepository _secureLocalRepository;
  GlobalKey<NavigatorState> get navigatorState => _routes.entries.toList()[_currentIndex].value;
  List<Widget> _pages = [];

  List<Widget> get pages => _pages;

  RootRecruiterProvider(this._secureLocalRepository) {
    prepareRootPage();
    notifyListeners();
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void prepareRootPage(){
    _pages = _routes.entries.map((e) => _buildOffstageNavigator(e.key, e.value)).toList();
  }

  void refreshPage(){
    if(_currentIndex != 3){
      _pages[_currentIndex] = _buildOffstageNavigator(_routes.keys.toList()[_currentIndex], GlobalKey<NavigatorState>());
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget _buildOffstageNavigator(String routeName, GlobalKey<NavigatorState> key) {
    return Navigator(
      key: key,
      initialRoute: routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  Future<bool> checkToken() async {
    String? token = await _secureLocalRepository.readSecureData("token");
    return token != null && token.isNotEmpty;
  }

}
