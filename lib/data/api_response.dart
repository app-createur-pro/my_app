import 'package:http/http.dart' as http;
import 'package:my_app/data/exceptions.dart';

class ApiResponse {
  static String handleAPIResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw UnauthorizedException();
    } else {
      throw UnknownException();
    }
  }
}
