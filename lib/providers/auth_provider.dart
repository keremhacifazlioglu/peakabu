import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform/cons/register_status.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/response/auth/send_sms.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/auth_repository.dart';
import 'package:platform/storage/secure_local_repository.dart';
import 'package:platform/storage/storage_item.dart';
import 'package:platform_device_id/platform_device_id.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository;
  final SecureLocalRepository _secureLocalRepository;
  NetworkStatus networkStatus = NetworkStatus.none;
  String? phoneNumber;
  FocusScopeNode? node = FocusScopeNode();
  String smsPin = "";
  bool isKvkkCheck = false, resend = false, privacyPolicy = false, termOfUse = false;
  int second = 10;
  List<TextEditingController> textEditingControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  AuthProvider(this._authRepository, this._secureLocalRepository) {
    getDeviceId();
  }

  Future register() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = SuccessResponse();
    if (phoneNumber == null || phoneNumber!.isEmpty) {
      successResponse.success = false;
      successResponse.message = "Lütfen telefon numarası giriniz.";
      networkStatus = NetworkStatus.error;
    } else {
      successResponse = await _authRepository.register(
        RegisterRequest(
          phone: phoneNumber!,
          userType: await _secureLocalRepository.readSecureData("userType"),
          uuid: await _secureLocalRepository.readSecureData("uuid"),
        ),
      );
    }
    if (successResponse.isSuccess!) {
      _secureLocalRepository.writeSecureData(StorageItem("phoneNumber", phoneNumber!));
      SendSms sendSms = await _authRepository.sendSms(
        SendSmsRequest(
          phone: phoneNumber!,
          uuid: await _secureLocalRepository.readSecureData("uuid"),
        ),
      );
      if (sendSms.isSuccess!) {
        await _secureLocalRepository.writeSecureData(StorageItem("smsId", sendSms.smsId!));
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.error;
    }
    notifyListeners();
    return successResponse;
  }

  Future<SendSms> resendSms() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    String? phoneNumber = await _secureLocalRepository.readSecureData("phoneNumber");
    SendSms successResponse = await _authRepository.sendSms(
      SendSmsRequest(
        phone: phoneNumber!,
        uuid: await _secureLocalRepository.readSecureData("uuid"),
      ),
    );
    if (successResponse.isSuccess!) {
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
    await prepareSmsPin();
    if (smsPin.isNotEmpty) {
      String? phoneNumber = await _secureLocalRepository.readSecureData("phoneNumber");
      String? uuid = await _secureLocalRepository.readSecureData("uuid");
      String? smsId = await _secureLocalRepository.readSecureData("smsId");
      successResponse = await _authRepository.confirmSms(
        ConfirmSmsRequest(phone: phoneNumber, code: smsPin, uuid: uuid, smsId: smsId),
      );
      if (successResponse.isSuccess!) {
        _secureLocalRepository.writeSecureData(StorageItem("smsPin", smsPin));
        login();
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


  Future login() async {
    String? phoneNumber = await _secureLocalRepository.readSecureData("phoneNumber");
    String? uuid = await _secureLocalRepository.readSecureData("uuid");
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

  Future<void> getDeviceId() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
      await _secureLocalRepository.writeSecureData(StorageItem("uuid", deviceId!));
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
  }

  Future prepareSmsPin() async {
    smsPin = "";
    for (TextEditingController textEditingController in textEditingControllerList) {
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
    isKvkkCheck = !isKvkkCheck;
    notifyListeners();
  }

  Future<bool> isApplicant() async {
    String? userType = await _secureLocalRepository.readSecureData("userType");
    return userType! == "applicant";
  }


}
