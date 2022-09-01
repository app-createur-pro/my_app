import 'package:flutter/material.dart';
import 'package:my_app/state/pet_provider.dart';

class CreatePetViewModel {
  PetProvider petProvider = PetProvider();

  String? textFieldValue;
  TextEditingController textEditingController = TextEditingController();
}
