import 'package:flutter/material.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/models/tag.dart';
import 'package:my_app/repository/pet_repository.dart';

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
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
