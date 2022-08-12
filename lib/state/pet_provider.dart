import 'package:flutter/material.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';

class PetProvider with ChangeNotifier {
  PetRepository petRepository = PetRepository();

  Pet? pet;
  String? error;

  bool isLoading = false;

  int? lastIdCreated;

  Future<Pet?> createPet(String name) async {
    try {
      isLoading = true;
      notifyListeners();
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
      lastIdCreated = pet?.id;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = ExceptionHandler.getErrorMessage(e);
      isLoading = false;
      notifyListeners();
    }
    return pet;
  }

  getPet(String textFieldValue) async {
    try {
      isLoading = true;
      notifyListeners();
      error = null;
      pet = await petRepository.getPet(textFieldValue);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = ExceptionHandler.getErrorMessage(e);
      isLoading = false;
      notifyListeners();
    }
  }
}
