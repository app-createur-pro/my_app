import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = 'https://petstore.swagger.io/v2';

class PetRepository {
  static createPet() async {
    var url = Uri.parse('$baseUrl/pet');
    var response = await http.post(url,
        body: jsonEncode({
          "name": "pilou",
          "photoUrls": ["veniam ad", "ipsum ullamco Ut in irure"],
          "id": "5085",
          "category": {"id": "37405039", "name": "cillum elit sunt in"},
          "tags": [
            {"id": "66356411", "name": "incididunt"},
            {"id": "13377129", "name": "magna"}
          ],
          "status": "available"
        }),
        headers: {"Content-Type": "application/json"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
