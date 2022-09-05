import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';
import 'package:my_app/state/pet_provider.dart';

final petCreationProvider = ChangeNotifierProvider<PetCreationProvider>(
  (ref) => PetCreationProvider(
    petProvider: ref.read(petProvider),
    petRepository: ref.read(petRepositoryProvider),
  ),
);

class PetCreationProvider with ChangeNotifier {
  PetCreationProvider({
    required this.petProvider,
    required this.petRepository,
  });

  final PetProvider petProvider;
  final PetRepository petRepository;

  String? error;

  bool isLoading = false;

  Future<Either<CustomException, Pet>> createPet(String name) async {
    try {
      isLoading = true;
      notifyListeners();
      error = null;
      Random random = Random();
      int randomId = random.nextInt(1000000000);
      Pet? pet = await petRepository.createPet(
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
      int? petId = pet?.id;
      if (petId != null) {
        petProvider.updateLatIdCreated(petId);
      }
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
}
