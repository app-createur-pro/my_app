import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/repository/pet_repository.dart';

class HomeViewModel {
  PetRepository petRepository = PetRepository();

  Pet? pet;
  String? error;

  String? textFieldValue;

  getPet(String petId) async {
    try {
      error = null;
      pet = await petRepository.getPet(petId);
    } catch (e) {
      error = ExceptionHandler.getErrorMessage(e);
    }
  }
}
