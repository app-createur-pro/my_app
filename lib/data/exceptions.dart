import 'package:easy_localization/easy_localization.dart';
import 'package:my_app/generated/locale_keys.g.dart';

class NotFoundException {}

class UnauthorizedException {}

class UnknownException {}

class ExceptionHandler {
  static String getErrorMessage(dynamic error) {
    if (error is NotFoundException) {
      return LocaleKeys.error_not_found.tr();
    } else if (error is UnauthorizedException) {
      return LocaleKeys.error_not_authorized.tr();
    } else {
      return LocaleKeys.error_unknown.tr();
    }
  }
}
