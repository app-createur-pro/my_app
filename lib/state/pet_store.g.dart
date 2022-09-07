// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PetStore on _PetStore, Store {
  Computed<PetState>? _$stateComputed;

  @override
  PetState get state => (_$stateComputed ??=
          Computed<PetState>(() => super.state, name: '_PetStore.state'))
      .value;

  late final _$_futurePetAtom =
      Atom(name: '_PetStore._futurePet', context: context);

  @override
  ObservableFuture<Pet?>? get _futurePet {
    _$_futurePetAtom.reportRead();
    return super._futurePet;
  }

  @override
  set _futurePet(ObservableFuture<Pet?>? value) {
    _$_futurePetAtom.reportWrite(value, super._futurePet, () {
      super._futurePet = value;
    });
  }

  late final _$petAtom = Atom(name: '_PetStore.pet', context: context);

  @override
  Pet? get pet {
    _$petAtom.reportRead();
    return super.pet;
  }

  @override
  set pet(Pet? value) {
    _$petAtom.reportWrite(value, super.pet, () {
      super.pet = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_PetStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$lastIdCreatedAtom =
      Atom(name: '_PetStore.lastIdCreated', context: context);

  @override
  int? get lastIdCreated {
    _$lastIdCreatedAtom.reportRead();
    return super.lastIdCreated;
  }

  @override
  set lastIdCreated(int? value) {
    _$lastIdCreatedAtom.reportWrite(value, super.lastIdCreated, () {
      super.lastIdCreated = value;
    });
  }

  late final _$displayPetAsyncAction =
      AsyncAction('_PetStore.displayPet', context: context);

  @override
  Future displayPet(String textFieldValue) {
    return _$displayPetAsyncAction.run(() => super.displayPet(textFieldValue));
  }

  late final _$createPetAsyncAction =
      AsyncAction('_PetStore.createPet', context: context);

  @override
  Future<Either<CustomException, Pet>> createPet(String name) {
    return _$createPetAsyncAction.run(() => super.createPet(name));
  }

  late final _$_PetStoreActionController =
      ActionController(name: '_PetStore', context: context);

  @override
  dynamic refreshPet() {
    final _$actionInfo =
        _$_PetStoreActionController.startAction(name: '_PetStore.refreshPet');
    try {
      return super.refreshPet();
    } finally {
      _$_PetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pet: ${pet},
errorMessage: ${errorMessage},
lastIdCreated: ${lastIdCreated},
state: ${state}
    ''';
  }
}
