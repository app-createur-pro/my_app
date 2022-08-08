import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/screens/create_pet_screen.dart';
import 'package:my_app/view_models/create_pet_view_model.dart';
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
  CreatePetViewModel createPetViewModel = CreatePetViewModel();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Pet? pet = context.watch<HomeViewModel?>()?.pet;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreatePetScreen(),
            )),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    context.read<HomeViewModel>().setTextFieldValue(value);
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
                    context.read<HomeViewModel>().getPet();
                  }
                },
                child: Text(LocaleKeys.display_pet.tr()),
              ),
              const SizedBox(height: 80),
              _ResponseText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResponseText extends StatelessWidget {
  const _ResponseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pet? pet = context.watch<HomeViewModel?>()?.pet;
    String? error = context.watch<HomeViewModel?>()?.error;
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
