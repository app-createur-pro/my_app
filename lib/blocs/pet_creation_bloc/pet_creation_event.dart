abstract class PetCreationEvent {}

class InitCreationEvent extends PetCreationEvent {}

class CreatePetEvent extends PetCreationEvent {
  final String name;

  CreatePetEvent({required this.name});
}
