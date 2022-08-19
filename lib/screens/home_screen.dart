import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/screens/create_pet_screen.dart';
import 'package:my_app/state/pet_provider.dart';
import 'package:my_app/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  PetProvider petProvider = PetProvider();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<PetProvider>().isLoading;
    int? lastIdCreated = context.watch<PetProvider>().lastIdCreated;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreatePetScreen(),
                ),
              );
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
                  context
                      .read<PetProvider>()
                      .displayPet(homeViewModel.textFieldValue ?? "");
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

class _ResponseText extends StatelessWidget {
  const _ResponseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pet? pet = context.watch<PetProvider>().pet;
    String? error = context.watch<PetProvider>().error;
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
