import 'dart:math';

import 'package:dartz/dartz.dart';
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

  Future<Either<CustomException, Pet>> createPet(String name) async {
    try {
      isLoading = true;
      notifyListeners();
      error = null;
      Random random = Random();
      int randomId = random.nextInt(1000000000);
      pet = await petRepository.createPet(
        Pet(
          name: name,
          photoUrls: ["veniam ad", "ipsum ullamco Ut in irure"],
          id: randomId,
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
      return Right(pet!);
    } catch (e) {
      CustomException customException = e.toCustomException();
      error = customException.errorMessage;
      isLoading = false;
      notifyListeners();
      return Left(customException);
    }
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
      CustomException customException = e as CustomException;
      error = customException.errorMessage;
      isLoading = false;
      notifyListeners();
    }
  }
}
