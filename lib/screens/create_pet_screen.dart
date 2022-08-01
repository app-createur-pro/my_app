import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/view_models/create_pet_view_model.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  createPetViewModel.createPet();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(LocaleKeys.pet_created.tr()),
                    ),
                  );
                }
              },
              child: Text(LocaleKeys.create_a_pet.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
