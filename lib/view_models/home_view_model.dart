import 'package:flutter/material.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/repository/pet_repository.dart';

class HomeViewModel with ChangeNotifier {
  PetRepository petRepository = PetRepository();

  Pet? pet;
  String? error;

  String? textFieldValue;

  void getPet() async {
    try {
      error = null;
      pet = await petRepository.getPet(textFieldValue ?? "");
      notifyListeners();
    } catch (e) {
      error = ExceptionHandler.getErrorMessage(e);
      notifyListeners();
    }
  }

  void setTextFieldValue(String value) => textFieldValue = value;
}
