import 'package:keepintouch/data/mock_data.dart';
import 'package:keepintouch/models/models.dart';

class AnimalService {

  Future<List<Animal>> getAnimals() async {
    return mockAnimals;
  }

  Future<void> updateForm(FormEntry updatedForm) async {
    // This is a simulation. In a real app, this would be an API call.
    final animal = mockAnimals.firstWhere((a) => a.id == updatedForm.animalId);
    final formIndex = animal.forms.indexWhere((f) => f.id == updatedForm.id);
    if (formIndex != -1) {
      animal.forms[formIndex] = updatedForm;
    }
  }
}
