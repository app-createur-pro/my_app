import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';

part 'pet_store.g.dart';

final PetStore petStore = PetStore();

enum PetState { initial, loading, loaded, error }

final PetRepository petRepository = PetRepository();

class PetStore = _PetStore with _$PetStore;

abstract class _PetStore with Store {
  _PetStore();

  @observable
  ObservableFuture<Pet?>? _futurePet;

  @observable
  Pet? pet;

  @observable
  String? errorMessage;

  @observable
  int? lastIdCreated;

  @computed
  PetState get state {
    if (_futurePet == null && errorMessage == null) {
      return PetState.initial;
    }
    if (errorMessage != null) {
      return PetState.error;
    }
    return _futurePet?.status == FutureStatus.pending
        ? PetState.loading
        : PetState.loaded;
  }

  @action
  displayPet(String textFieldValue) async {
    try {
      errorMessage = null;
      _futurePet = ObservableFuture(petRepository.getPet(textFieldValue));
      pet = await _futurePet;
    } catch (e) {
      CustomException customException = e.toCustomException();
      errorMessage = customException.errorMessage;
    }
  }

  @action
  Future<Either<CustomException, Pet>> createPet(String name) async {
    try {
      errorMessage = null;
      Random random = Random();
      int randomId = random.nextInt(1000000000);
      _futurePet = ObservableFuture(
        petRepository.createPet(
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
        ),
      );
      Pet? pet = await _futurePet;
      lastIdCreated = pet?.id;
      return Right(pet!);
    } catch (e) {
      CustomException customException = e.toCustomException();
      errorMessage = customException.errorMessage;
      return Left(customException);
    }
  }

  @action
  refreshPet() {
    _futurePet = null;
    errorMessage = null;
  }
}
