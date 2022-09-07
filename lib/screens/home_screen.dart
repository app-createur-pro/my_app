import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/screens/create_pet_screen.dart';
import 'package:my_app/state/pet_store.dart';
import 'package:my_app/view_models/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.title});

  final String title;

  final HomeViewModel homeViewModel = HomeViewModel();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreatePetScreen(),
                ),
              );
              petStore.refreshPet();
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Observer(builder: (context) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: homeViewModel.textEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      homeViewModel.setTextFieldValue(value);
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: LocaleKeys.enter_pet_id.tr(),
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      petStore.displayPet(homeViewModel.textFieldValue ?? "");
                      homeViewModel.textEditingController.clear();
                    }
                  },
                  child: Text(LocaleKeys.display_pet.tr()),
                ),
                const SizedBox(height: 80),
                if (petStore.state == PetState.loading)
                  CircularProgressIndicator()
                else if (petStore.errorMessage == null && petStore.pet == null)
                  const SizedBox.shrink()
                else if (petStore.state == PetState.error &&
                    petStore.errorMessage != null)
                  Text(
                    petStore.errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                if (petStore.state == PetState.loaded)
                  Text(
                    LocaleKeys.the_pet_displayed.tr(
                      namedArgs: {'petName': petStore.pet?.name ?? "inconnu"},
                    ),
                  ),
                const SizedBox(height: 20),
                if (petStore.lastIdCreated != null)
                  Text(LocaleKeys.last_id.tr(
                      namedArgs: {'petId': petStore.lastIdCreated.toString()}))
              ],
            );
          }),
        ),
      ),
    );
  }
}
