import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/view_models/create_pet_view_model.dart';

import '../utils/navigation_utils.dart';

class CreatePetScreen extends StatelessWidget {
  CreatePetScreen({Key? key}) : super(key: key);

  final CreatePetViewModel createPetViewModel = CreatePetViewModel();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: createPetViewModel.textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    createPetViewModel.textFieldValue = value;
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    Pet? pet = await createPetViewModel.createPet(
                        name: createPetViewModel.textFieldValue ?? "pet name");
                    if (createPetViewModel.error != null) {
                      NavigationUtils.displaySnackBar(
                        text: createPetViewModel.error!,
                        context: context,
                      );
                    } else if (pet != null) {
                      NavigationUtils.displaySnackBar(
                        text: LocaleKeys.pet_created.tr(namedArgs: {
                          'petName': "${pet.name}",
                          'petId': "${pet.id}",
                        }),
                        context: context,
                      );
                    }
                  }
                },
                child: Text(LocaleKeys.create_a_pet.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
