import 'package:http/http.dart' as http;
import 'package:my_app/models/pet.dart';

String baseUrl = 'https://petstore.swagger.io/v2';

class PetRepository {
  static createPet(Pet pet) async {
    var jsonPet = pet.toJson();
    var url = Uri.parse('$baseUrl/pet');
    var response = await http.post(
      url,
      body: jsonPet,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static getPet() async {
    var url = Uri.parse('$baseUrl/pet/5087');
    var response = await http.get(url);
    print("response get pet : ${response.body}");
  }
}
