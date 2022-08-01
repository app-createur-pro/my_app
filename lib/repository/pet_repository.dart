import 'package:http/http.dart' as http;
import 'package:my_app/data/api_response.dart';
import 'package:my_app/models/pet.dart';

class PetRepository {
  static final String baseUrl = 'https://petstore.swagger.io/v2/';
  static final String createPetUrl = 'pet';
  static final String getPetUrl = 'pet/5087';

  Future<Pet?> createPet(Pet pet) async {
    var jsonPet = pet.toJson();
    var url = Uri.parse('$baseUrl$createPetUrl');
    var response = await http.post(
      url,
      body: jsonPet,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    Pet petResponse = Pet.fromJson(ApiResponse.handleAPIResponse(response));
    return petResponse;
  }

  Future getPet() async {
    var url = Uri.parse('$baseUrl$getPetUrl');
    var response = await http.get(url);
    print("response get pet : ${response.body}");
  }
}
