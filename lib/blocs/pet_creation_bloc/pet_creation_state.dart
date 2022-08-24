import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/pet.dart';

abstract class PetCreationState {}

class PetCreationInit extends PetCreationState {}

class PetCreationSuccess extends PetCreationState {
  final Pet pet;

  PetCreationSuccess({required this.pet});
}

class PetCreationError extends PetCreationState {
  CustomException exception;

  PetCreationError({required this.exception});
}

class PetCreationLoading extends PetCreationState {}
