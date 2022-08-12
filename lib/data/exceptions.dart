import 'package:easy_localization/easy_localization.dart';
import 'package:my_app/generated/locale_keys.g.dart';

abstract class CustomException {
  String errorMessage = LocaleKeys.error_unknown.tr();
}

class NotFoundException extends CustomException {
  @override
  String get errorMessage => LocaleKeys.error_not_found.tr();
}

class UnauthorizedException extends CustomException {
  @override
  String get errorMessage => LocaleKeys.error_not_authorized.tr();
}

class SocketException extends CustomException {
  @override
  String get errorMessage => LocaleKeys.error_network.tr();
}

class UnknownException extends CustomException {
  @override
  String get errorMessage => LocaleKeys.error_unknown.tr();
}

extension ToCustomException on Object {
  toCustomException() {
    if (this is CustomException) {
      return this;
    } else {
      return UnknownException();
    }
  }
}
