import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';

class CreatePetViewModel {
  PetRepository petRepository = PetRepository();

  Pet? pet;
  String? error;

  createPet() async {
    try {
      error = null;
      pet = await petRepository.createPet(
        Pet(
          name: "Pilou",
          photoUrls: ["veniam ad", "ipsum ullamco Ut in irure"],
          id: 50926536738,
          category: Category(
            id: 37405040,
            name: "chien",
          ),
          tags: [
            Tag(id: 66356411, name: "incididunt"),
            Tag(id: 13377129, name: "magna"),
          ],
          status: Status.available,
        ),
      );
    } catch (e) {
      error = ExceptionHandler.getErrorMessage(e);
    }
  }
}
