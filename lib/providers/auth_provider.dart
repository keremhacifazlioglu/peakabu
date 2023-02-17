import 'package:flutter/foundation.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/auth_repository.dart';
import 'package:platform/storage/secure_local_repository.dart';
import 'package:platform/storage/storage_item.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository;
  final SecureLocalRepository _secureLocalRepository;
  NetworkStatus networkStatus = NetworkStatus.none;
  String? phoneNumber;
  bool? isKvkkCheck;

  AuthProvider(this._authRepository, this._secureLocalRepository);

  Future<SuccessResponse> sendSms() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = await _authRepository.sendSms(
      SendSmsRequest(phoneNumber: phoneNumber!),
    );

    if (successResponse.success!) {
      _secureLocalRepository
          .writeSecureData(StorageItem("phoneNumber", phoneNumber!));
      networkStatus = NetworkStatus.success;
    } else {
      networkStatus = NetworkStatus.error;
    }
    notifyListeners();
    return successResponse;
  }
}
