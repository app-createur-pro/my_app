import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/pet_creation_bloc/pet_creation_bloc.dart';
import 'package:my_app/blocs/pet_creation_bloc/pet_creation_event.dart';
import 'package:my_app/blocs/pet_creation_bloc/pet_creation_state.dart';
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
          child: BlocListener<PetCreationBloc, PetCreationState>(
            listener: (context, state) {
              if (state is PetCreationSuccess) {
                Pet? pet = state.pet;
                NavigationUtils.displaySnackBar(
                    text: LocaleKeys.pet_created.tr(
                      namedArgs: {
                        'petName': "${pet.name}",
                        'petId': "${pet.id}",
                      },
                    ),
                    context: context);
              } else if (state is PetCreationError) {
                NavigationUtils.displaySnackBar(
                  text: state.exception.errorMessage,
                  context: context,
                );
              }
            },
            child: BlocBuilder<PetCreationBloc, PetCreationState>(
              builder: (context, state) {
                bool isLoading = state is PetCreationLoading;

                return Column(
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
                                BlocProvider.of<PetCreationBloc>(context).add(
                                  CreatePetEvent(
                                      name: createPetViewModel.textFieldValue ??
                                          ""),
                                );
                                createPetViewModel.textEditingController
                                    .clear();
                              }
                            },
                      child: Text(LocaleKeys.create_a_pet.tr()),
                    ),
                    if (isLoading) CircularProgressIndicator()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
