import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/exceptions.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/state/pet_provider.dart';
import 'package:my_app/view_models/create_pet_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/navigation_utils.dart';

class CreatePetScreen extends StatelessWidget {
  CreatePetScreen({Key? key}) : super(key: key);

  final CreatePetViewModel createPetViewModel = CreatePetViewModel();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool isLoading = context.watch<PetProvider>().isLoading;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30),
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
                onPressed: isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          Either<CustomException, Pet>? result = await context
                              .read<PetProvider>()
                              .createPet(
                                  createPetViewModel.textFieldValue ?? "");
                          displaySnackBar(
                            dataResult: result,
                            context: context,
                          );
                          createPetViewModel.textEditingController.clear();
                        }
                      },
                child: Text(LocaleKeys.create_a_pet.tr()),
              ),
              if (isLoading) CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  void displaySnackBar({
    required Either<CustomException, Pet>? dataResult,
    required BuildContext context,
  }) {
    dataResult?.fold(
      (CustomException failure) => NavigationUtils.displaySnackBar(
        text: failure.errorMessage,
        context: context,
      ),
      (Pet? pet) => NavigationUtils.displaySnackBar(
        text: LocaleKeys.pet_created.tr(
          namedArgs: {
            'petName': "${pet?.name}",
            'petId': "${pet?.id}",
          },
        ),
        context: context,
      ),
    );
  }
}
