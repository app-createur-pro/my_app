import 'package:http/http.dart' as http;
import 'package:my_app/data/api_response.dart';
import 'package:my_app/models/pet.dart';

class PetRepository {
  static final String baseUrl = 'https://petstore.swagger.io/v2/';
  static final String petUrl = 'pet/';

  Future<Pet?> createPet(Pet pet) async {
    var jsonPet = pet.toJson();
    var url = Uri.parse(baseUrl + petUrl);
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

  Future<Pet?> getPet(String petId) async {
    var url = Uri.parse(baseUrl + petUrl + petId);
    var response = await http.get(url);
    Pet petResponse = Pet.fromJson(ApiResponse.handleAPIResponse(response));
    return petResponse;
  }
}
