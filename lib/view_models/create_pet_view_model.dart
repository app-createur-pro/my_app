import 'package:flutter/cupertino.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';

class CreatePetViewModel {
  PetRepository petRepository = PetRepository();

  Pet? pet;
  String? error;
  String? textFieldValue;
  TextEditingController textEditingController = TextEditingController();
  int? lastIdCreated;

  createPet({required String name}) async {
    try {
      error = null;
      pet = await petRepository.createPet(
        Pet(
          name: name,
          photoUrls: ["veniam ad", "ipsum ullamco Ut in irure"],
          id: 1,
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
      textEditingController.clear();
      lastIdCreated = pet?.id;
      return pet;
    } catch (e) {
      error = ExceptionHandler.getErrorMessage(e);
    }
  }
}
