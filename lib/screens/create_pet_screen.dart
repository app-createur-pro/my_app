import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';

class CreatePetScreen extends StatelessWidget {
  const CreatePetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
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
                if (_formKey.currentState!.validate()) {
                  PetRepository.createPet(
                    Pet(
                      name: "Pilou",
                      photoUrls: ["veniam ad", "ipsum ullamco Ut in irure"],
                      id: 50926536738,
                      category: Category(
                        id: 37405040,
                        name: "chien",
                      ),
                      tags: [
                        Tag(id: "66356411", name: "incididunt"),
                        Tag(id: "13377129", name: "magna"),
                      ],
                      status: Status.available,
                    ),
                  );
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
