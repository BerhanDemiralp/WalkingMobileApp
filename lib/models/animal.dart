import 'owner.dart';
import 'form_entry.dart';

class Animal {
  final int id;
  final int ownerId;
  final String name;
  final String species;
  final String? breed;
  final int age;
  final DateTime? lastCheckDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Owner owner;
  final List<FormEntry> forms;

  Animal({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.species,
    this.breed,
    required this.age,
    this.lastCheckDate,
    required this.createdAt,
    required this.updatedAt,
    required this.owner,
    required this.forms,
  });
}
