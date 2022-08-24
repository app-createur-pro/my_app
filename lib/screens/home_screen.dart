import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/pet_creation_bloc/pet_creation_bloc.dart';
import 'package:my_app/blocs/pet_display_bloc/pet_display_bloc.dart';
import 'package:my_app/blocs/pet_display_bloc/pet_display_event.dart';
import 'package:my_app/blocs/pet_display_bloc/pet_display_state.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/screens/create_pet_screen.dart';
import 'package:my_app/view_models/home_view_model.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              BlocProvider.of<PetDisplayBloc>(context).add(InitDisplayEvent());
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
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
                    BlocProvider.of<PetDisplayBloc>(context).add(
                        DisplayPetEvent(
                            text: homeViewModel.textFieldValue ?? ""));
                    homeViewModel.textEditingController.clear();
                  }
                },
                child: Text(LocaleKeys.display_pet.tr()),
              ),
              const SizedBox(height: 80),
              BlocBuilder<PetDisplayBloc, PetDisplayState>(
                builder: (context, state) {
                  if (state is PetDisplayLoading) {
                    return CircularProgressIndicator();
                  } else if (state is PetDisplaySuccess) {
                    Pet? pet = state.pet;
                    return Text(
                      LocaleKeys.the_pet_displayed.tr(
                        namedArgs: {'petName': pet?.name ?? "inconnu"},
                      ),
                    );
                  } else if (state is PetDisplayError) {
                    return Text(
                      state.exception.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<PetDisplayBloc, PetDisplayState>(
                builder: (context, state) {
                  int? lastIdCreated = context.select(
                      (PetCreationBloc petCreationBloc) =>
                          petCreationBloc.lastIdCreated);
                  if (lastIdCreated != null) {
                    return Text(
                      LocaleKeys.last_id.tr(
                        namedArgs: {'petId': lastIdCreated.toString()},
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
