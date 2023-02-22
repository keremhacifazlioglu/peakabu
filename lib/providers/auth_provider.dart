import 'package:flutter/material.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
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
  FocusScopeNode? node = FocusScopeNode();
  String smsPin = "";
  bool isKvkkCheck = false,resend = false,privacyPolicy=false,termOfUse=false;
  int second = 10;
  List<TextEditingController> textEditingControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

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

  Future<SuccessResponse> resendSms() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    String? phoneNumber =
        await _secureLocalRepository.readSecureData("phoneNumber");
    SuccessResponse successResponse = await _authRepository.sendSms(
      SendSmsRequest(phoneNumber: phoneNumber!),
    );
    if (successResponse.success!) {
      smsPin = "";
      resend = false;
      networkStatus = NetworkStatus.success;
    } else {
      networkStatus = NetworkStatus.error;
    }
    notifyListeners();
    return successResponse;
  }

  Future<SuccessResponse> confirmSms() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = SuccessResponse();
    if (smsPin.isNotEmpty) {
      String? phoneNumber =
          await _secureLocalRepository.readSecureData("phoneNumber");
      successResponse = await _authRepository.confirmSms(
        ConfirmSmsRequest(phone: phoneNumber, code: smsPin),
      );
      if (successResponse.isSuccess!) {
        _secureLocalRepository.writeSecureData(StorageItem("uuid", smsPin));
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.error;
      successResponse.isSuccess = false;
      successResponse.message = "Lütfen sms ile gelen kodu giriniz";
    }
    notifyListeners();
    return successResponse;
  }

  Future prepareSmsPin() async {
    for (TextEditingController textEditingController
        in textEditingControllerList) {
      smsPin += textEditingController.text.toString();
    }
  }

  Future activateResendMessage() async {
    resend = true;
    notifyListeners();
  }

  Future enablePrivacyPolicy() async {
    privacyPolicy = true;
    termOfUse = false;
    notifyListeners();
  }

  Future enableTermOfUse() async {
    privacyPolicy = false;
    termOfUse = true;
    notifyListeners();
  }

  Future enableKvkk() async {
    isKvkkCheck = !isKvkkCheck!;
    notifyListeners();
  }
}
