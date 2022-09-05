import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/repository/pet_repository.dart';

final petProvider = ChangeNotifierProvider<PetProvider>(
  (ref) => PetProvider(
    petRepository: ref.read(petRepositoryProvider),
  ),
);

class PetProvider with ChangeNotifier {
  final PetRepository petRepository;

  PetProvider({required this.petRepository});

  Pet? pet;
  String? error;

  bool isLoading = false;

  int? lastIdCreated;

  displayPet(String textFieldValue) async {
    try {
      isLoading = true;
      notifyListeners();
      error = null;
      pet = await petRepository.getPet(textFieldValue);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      CustomException customException = e.toCustomException();
      error = customException.errorMessage;
      isLoading = false;
      notifyListeners();
    }
  }

  updateLatIdCreated(int id) {
    lastIdCreated = id;
    notifyListeners();
  }

  refreshPet() {
    pet = null;
    notifyListeners();
  }
}
