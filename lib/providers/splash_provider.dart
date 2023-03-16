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
    String phoneNumber = await _secureLocalRepository.readSecureData("phoneNumber") ?? "+905434774173";
    String uuid = await _secureLocalRepository.readSecureData("uuid") ?? "b472efc2-c105-4b95-964a-f0547db20903";
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
}
