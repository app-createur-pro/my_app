import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/repository/pet_repository.dart';

class HomeViewModel {
  PetRepository petRepository = PetRepository();

  Pet? pet;
  String? error;

  displayPet() async {
    try {
      pet = await petRepository.getPet();
    } catch (e) {
      error = ExceptionHandler.getErrorMessage(e);
    }
  }
}
