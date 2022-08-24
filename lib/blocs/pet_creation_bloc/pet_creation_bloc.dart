import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';

import 'pet_creation_event.dart';
import 'pet_creation_state.dart';

class PetCreationBloc extends Bloc<PetCreationEvent, PetCreationState> {
  PetCreationBloc() : super(PetCreationInit()) {
    on<InitCreationEvent>((event, emit) {
      emit(PetCreationInit());
    });
    on<CreatePetEvent>((event, emit) async {
      emit(PetCreationLoading());
      Either<PetCreationError, PetCreationSuccess> stateEither =
          await createPet(event.name);
      var state = stateEither.fold((left) => left, (right) => right);
      emit(state);
    });
  }

  PetRepository petRepository = PetRepository();

  int? lastIdCreated;

  Future<Either<PetCreationError, PetCreationSuccess>> createPet(
      String name) async {
    try {
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
      lastIdCreated = pet?.id;
      return Right(PetCreationSuccess(pet: pet!));
    } catch (e) {
      CustomException customException = e.toCustomException();
      return Left(PetCreationError(exception: customException));
    }
  }
}
