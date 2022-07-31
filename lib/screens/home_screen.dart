import 'package:flutter/material.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';
import 'package:my_app/screens/create_pet_screen.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    PetRepository.createPet(
      Pet(
        name: "Pilou",
        photoUrls: ["veniam ad", "ipsum ullamco Ut in irure"],
        id: 50926536738,
        category: Category(id: 37405040, name: "chien"),
        tags: [
          Tag(id: "66356411", name: "incididunt"),
          Tag(id: "13377129", name: "magna"),
        ],
        status: Status.available,
      ),
    );
    //PetRepository.getPet();
  }

  @override
  Widget build(BuildContext context) {
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
                    return null;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Entrez un id',
                      fillColor: Colors.grey[300],
                      filled: true),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Afficher pet'),
              ),
              SizedBox(
                height: 80,
              ),
              Text('Le pet que vous affichez est :'),
            ],
          ),
        ),
      ),
    );
  }
}
