import 'package:my_app/data/exceptions.dart';
import 'package:my_app/models/pet.dart';

abstract class PetDisplayState {}

class PetDisplayInit extends PetDisplayState {}

class PetDisplaySuccess extends PetDisplayState {
  final Pet? pet;

  PetDisplaySuccess({required this.pet});
}

class PetDisplayError extends PetDisplayState {
  CustomException exception;

  PetDisplayError({required this.exception});
}

class PetDisplayLoading extends PetDisplayState {}
