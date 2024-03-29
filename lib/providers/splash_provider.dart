import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/register_status.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/auth_repository.dart';
import 'package:platform/storage/secure_local_repository.dart';
import 'package:platform/storage/storage_item.dart';


@injectable
class SplashProvider with ChangeNotifier {
  final SecureLocalRepository _secureLocalRepository;
  final AuthRepository _authRepository;
  NetworkStatus? networkStatus = NetworkStatus.none;

  SplashProvider(this._secureLocalRepository, this._authRepository) {
    autoLogin();
  }

  Future autoLogin() async {
    _secureLocalRepository.deleteAllSecureData();
    String phoneNumber = await _secureLocalRepository.readSecureData("phoneNumber") ?? "";
    String uuid = await _secureLocalRepository.readSecureData("uuid") ?? "";
    Token? token = await _authRepository.token(TokenRequest(phone: phoneNumber,uuid: uuid));

    if(token != null && token.isSuccess!){
      if(token.isUserRegistered!){
        _secureLocalRepository.writeSecureData(StorageItem("isRegisterStatus",RegisterStatus.isRegister.toShortUpperString()));
        _secureLocalRepository.writeSecureData(StorageItem("token",token.token!));
      }else{
        _secureLocalRepository.writeSecureData(StorageItem("isRegisterStatus",RegisterStatus.unRegister.toShortUpperString()));
      }
      networkStatus = NetworkStatus.success;
    }else{
      networkStatus = NetworkStatus.error;
    }
    notifyListeners();
  }

  Future<String> getUserType() async {
    String? userType = await _secureLocalRepository.readSecureData("userType");
    return userType??"";
  }
}
