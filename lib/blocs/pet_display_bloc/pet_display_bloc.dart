import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/repository/pet_repository.dart';

import 'pet_display_event.dart';
import 'pet_display_state.dart';

class PetDisplayBloc extends Bloc<PetDisplayEvent, PetDisplayState> {
  PetDisplayBloc() : super(PetDisplayInit()) {
    on<InitDisplayEvent>((event, emit) {
      emit(PetDisplayInit());
    });
    on<DisplayPetEvent>((event, emit) async {
      emit(PetDisplayLoading());
      Either<PetDisplayError, PetDisplaySuccess> stateEither =
          await displayPet(event.text);
      var state = stateEither.fold((left) => left, (right) => right);
      emit(state);
    });
  }

  PetRepository petRepository = PetRepository();

  Future<Either<PetDisplayError, PetDisplaySuccess>> displayPet(
      String textFieldValue) async {
    try {
      Pet? pet = await petRepository.getPet(textFieldValue);
      return Right(PetDisplaySuccess(pet: pet));
    } catch (e) {
      CustomException customException = e.toCustomException();
      return Left(PetDisplayError(exception: customException));
    }
  }
}
