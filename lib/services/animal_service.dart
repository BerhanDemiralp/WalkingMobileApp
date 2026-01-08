import 'package:keepintouch/data/mock_data.dart';
import 'package:keepintouch/models/models.dart';
import 'package:keepintouch/services/data_service.dart';

class AnimalService {
  final DataService _dataService = DataService();

  Future<List<Animal>> getAnimals() async {
    return mockAnimals;
  }

  Future<void> updateForm(FormEntry updatedForm) async {
    // 1. Update in the specific animal's list
    for (var animal in mockAnimals) {
      if (animal.id.toString() == updatedForm.animalId.toString()) {
        final formIndex = animal.forms.indexWhere((f) => f.id == updatedForm.id);
        if (formIndex != -1) {
          animal.forms[formIndex] = updatedForm;
        }
        break;
      }
    }

    // 2. Update in the global mockFormEntries list
    final globalIndex = mockFormEntries.indexWhere((f) => f.id == updatedForm.id);
    if (globalIndex != -1) {
      mockFormEntries[globalIndex] = updatedForm;
    }

    // 3. Notify all listeners (DataPage, ProfilePage)
    _dataService.notifyDataChanged();
  }
}
