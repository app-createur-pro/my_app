abstract class PetDisplayEvent {}

class InitDisplayEvent extends PetDisplayEvent {}

class DisplayPetEvent extends PetDisplayEvent {
  final String text;

  DisplayPetEvent({required this.text});
}
