import 'form_type.dart';

class FormEntry {
  final String id;
  final int animalId;
  final FormType type;
  final int? checkedByUserId;
  final Map<String, String> formData;
  bool isChecked;
  final DateTime createdAt;
  final DateTime? sentAt; // Represents the date it was filled
  final DateTime? checkedAt;
  final DateTime updatedAt;

  bool get isFilled => formData.isNotEmpty;

  FormEntry({
    required this.id,
    required this.animalId,
    required this.type,
    this.checkedByUserId,
    required this.formData,
    this.isChecked = false,
    required this.createdAt,
    this.sentAt,
    this.checkedAt,
    required this.updatedAt,
  });
}
