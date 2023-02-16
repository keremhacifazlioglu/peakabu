import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/repository/auth_repository.dart';
import 'package:platform/util/logger.dart';

@injectable
class JobPostingProvider with ChangeNotifier {
  final AuthRepository _authRepository;

  JobPostingProvider(this._authRepository);

  Future token() async {
    Token? token = await _authRepository
        .token(TokenRequest(phoneNumber: "12", uuid: "12"));
    Log.v(token!.message!);
  }
}
