import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/screens/create_pet_screen.dart';
import 'package:my_app/state/pet_creation_provider.dart';
import 'package:my_app/state/pet_provider.dart';
import 'package:my_app/view_models/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({required this.title});

  final String title;

  final HomeViewModel homeViewModel = HomeViewModel();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(petProvider.select((value) => value.isLoading));
    int? lastIdCreated =
        ref.watch(petProvider.select((value) => value.lastIdCreated));
    final PetProvider _petProvider = ref.read(petProvider);
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
              ref.refresh(petCreationProvider);
              _petProvider.refreshPet();
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(children: [
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
                  _petProvider.displayPet(homeViewModel.textFieldValue ?? "");
                  homeViewModel.textEditingController.clear();
                }
              },
              child: Text(LocaleKeys.display_pet.tr()),
            ),
            const SizedBox(height: 80),
            if (isLoading) CircularProgressIndicator() else _ResponseText(),
            const SizedBox(height: 20),
            if (lastIdCreated != null)
              Text(LocaleKeys.last_id
                  .tr(namedArgs: {'petId': lastIdCreated.toString()}))
          ]),
        ),
      ),
    );
  }
}

class _ResponseText extends ConsumerWidget {
  const _ResponseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Pet? pet = ref.watch(petProvider.select((value) => value.pet));
    String? error = ref.watch(petProvider.select((value) => value.error));

    if (pet != null || error != null) {
      if (error != null) {
        return Text(
          error,
          style: TextStyle(color: Colors.red),
        );
      } else {
        return Text(
          LocaleKeys.the_pet_displayed.tr(
            namedArgs: {'petName': pet?.name ?? "inconnu"},
          ),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
