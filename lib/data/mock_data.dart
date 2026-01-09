import 'package:keepintouch/models/models.dart';

// --- USERS ---
List<User> mockUsers = [
  User(
    id: 1, 
    username: 'berhan', 
    email: 'berhan@example.com', 
    role: 'admin', 
    createdAt: DateTime(2023, 1, 1),
    assignedOwnerIds: [1, 4, 14, 15, 16, 18, 19, 20], // Assigned specific owners
  ),
  User(
    id: 2, 
    username: 'aylin', 
    email: 'aylin@example.com', 
    role: 'user', 
    createdAt: DateTime(2023, 2, 10),
    assignedOwnerIds: [2, 3, 6, 9, 10, 11, 12],
  ),
  User(
    id: 3, 
    username: 'can', 
    email: 'can@example.com', 
    role: 'user', 
    createdAt: DateTime(2023, 3, 15),
    assignedOwnerIds: [5, 7, 8, 13, 17],
  ),
];

// --- OWNERS (20 Manually) ---
List<Owner> mockOwners = [
  Owner(id: 1, name: 'Selin Kara', contact: '555-0001', createdAt: DateTime(2023, 1, 1), updatedAt: DateTime(2023, 1, 1)),
  Owner(id: 2, name: 'Murat Boz', contact: '555-0002', createdAt: DateTime(2023, 1, 2), updatedAt: DateTime(2023, 1, 2)),
  Owner(id: 3, name: 'Leyla Tan', contact: '555-0003', createdAt: DateTime(2023, 1, 3), updatedAt: DateTime(2023, 1, 3)),
  Owner(id: 4, name: 'Emre Aslan', contact: '555-0004', createdAt: DateTime(2023, 1, 4), updatedAt: DateTime(2023, 1, 4)),
  Owner(id: 5, name: 'Fatma Gül', contact: '555-0005', createdAt: DateTime(2023, 1, 5), updatedAt: DateTime(2023, 1, 5)),
  Owner(id: 6, name: 'Ahmet Yücel', contact: '555-0006', createdAt: DateTime(2023, 1, 6), updatedAt: DateTime(2023, 1, 6)),
  Owner(id: 7, name: 'Beren Saat', contact: '555-0007', createdAt: DateTime(2023, 1, 7), updatedAt: DateTime(2023, 1, 7)),
  Owner(id: 8, name: 'Kıvanç Tatlıtuğ', contact: '555-0008', createdAt: DateTime(2023, 1, 8), updatedAt: DateTime(2023, 1, 8)),
  Owner(id: 9, name: 'Tuba Büyüküstün', contact: '555-0009', createdAt: DateTime(2023, 1, 9), updatedAt: DateTime(2023, 1, 9)),
  Owner(id: 10, name: 'Kenan İmirzalıoğlu', contact: '555-0010', createdAt: DateTime(2023, 1, 10), updatedAt: DateTime(2023, 1, 10)),
  Owner(id: 11, name: 'Hande Erçel', contact: '555-0011', createdAt: DateTime(2023, 1, 11), updatedAt: DateTime(2023, 1, 11)),
  Owner(id: 12, name: 'Çağatay Ulusoy', contact: '555-0012', createdAt: DateTime(2023, 1, 12), updatedAt: DateTime(2023, 1, 12)),
  Owner(id: 13, name: 'Demet Özdemir', contact: '555-0013', createdAt: DateTime(2023, 1, 13), updatedAt: DateTime(2023, 1, 13)),
  Owner(id: 14, name: 'Aras Bulut İynemli', contact: '555-0014', createdAt: DateTime(2023, 1, 14), updatedAt: DateTime(2023, 1, 14)),
  Owner(id: 15, name: 'Elçin Sangu', contact: '555-0015', createdAt: DateTime(2023, 1, 15), updatedAt: DateTime(2023, 1, 15)),
  Owner(id: 16, name: 'Barış Arduç', contact: '555-0016', createdAt: DateTime(2023, 1, 16), updatedAt: DateTime(2023, 1, 16)),
  Owner(id: 17, name: 'Serenay Sarıkaya', contact: '555-0017', createdAt: DateTime(2023, 1, 17), updatedAt: DateTime(2023, 1, 17)),
  Owner(id: 18, name: 'Burak Özçivit', contact: '555-0018', createdAt: DateTime(2023, 1, 18), updatedAt: DateTime(2023, 1, 18)),
  Owner(id: 19, name: 'Fahriye Evcen', contact: '555-0019', createdAt: DateTime(2023, 1, 19), updatedAt: DateTime(2023, 1, 19)),
  Owner(id: 20, name: 'Engin Akyürek', contact: '555-0020', createdAt: DateTime(2023, 1, 20), updatedAt: DateTime(2023, 1, 20)),
];


// --- FORM ENTRIES (60 total) ---
List<FormEntry> mockFormEntries = [
  // Animal 1 (3 Forms)
  FormEntry(id: '1', animalId: 1, type: FormType.RoutineCheck, formData: {'Genel Görünüm': 'Canlı ve parlak tüylü.', 'Davranış': 'Oyuncu ve sosyal.', 'Yeme/İçme Alışkanlıkları': 'Normal, iştahı yerinde.', 'Ek Notlar': 'Herhangi bir sorun gözlemlenmedi.'}, isChecked: true, checkedByUserId: 1, createdAt: DateTime(2024, 1, 15), sentAt: DateTime(2024, 1, 15), checkedAt: DateTime(2024, 1, 16), updatedAt: DateTime(2024, 1, 16)),
  FormEntry(id: '2', animalId: 1, type: FormType.Vaccination, formData: {'Uygulanan Aşı': 'Kuduz (Rabies) - Yıllık Tekrar', 'Lot Numarası': 'RAB2024-11B', 'Reaksiyon Gözlemlendi mi?': 'Hayır, herhangi bir yan etki görülmedi.', 'Sonraki Aşı Tarihi': '20 Mart 2025'}, isChecked: true, checkedByUserId: 1, createdAt: DateTime(2024, 3, 20), sentAt: DateTime(2024, 3, 20), checkedAt: DateTime(2024, 3, 21), updatedAt: DateTime(2024, 3, 21)),
  FormEntry(id: '3', animalId: 1, type: FormType.Emergency, formData: {'Acil Durum Sebebi': 'Aşırı ve sürekli kaşınma, kulaklarını sallama.', 'İlk Değerlendirme': 'Sol kulakta kızarıklık ve akıntı tespit edildi.', 'Uygulanan Tedavi': 'Kulak temizliği yapıldı ve antibiyotikli damla reçete edildi.', 'Evde Bakım Talimatları': 'Damlanın 7 gün boyunca günde 2 kez kullanılması gerekiyor.'}, isChecked: false, createdAt: DateTime(2024, 5, 10), sentAt: DateTime(2024, 5, 10), updatedAt: DateTime(2024, 5, 10)),

  // Animal 2 (3 Forms)
  FormEntry(id: '4', animalId: 2, type: FormType.RoutineCheck, checkedByUserId: 2, formData: {'Notes': 'Healthy weight and appetite.'}, isChecked: true, createdAt: DateTime(2024, 2, 1), sentAt: DateTime(2024, 2, 1), checkedAt: DateTime(2024, 2, 2), updatedAt: DateTime(2024, 2, 2)),
  FormEntry(id: '5', animalId: 2, type: FormType.RoutineCheck, formData: {'Notes': 'Minor ear infection found.'}, isChecked: false, createdAt: DateTime(2024, 4, 5), sentAt: DateTime(2024, 4, 5), updatedAt: DateTime(2024, 4, 5)),
  FormEntry(id: '6', animalId: 2, type: FormType.Surgery, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 12), updatedAt: DateTime(2024, 6, 12)),

  // Animal 3 (3 Forms)
  FormEntry(id: '7', animalId: 3, type: FormType.Vaccination, checkedByUserId: 2, formData: {'Notes': 'Booster shots administered.'}, isChecked: true, createdAt: DateTime(2024, 1, 22), sentAt: DateTime(2024, 1, 22), checkedAt: DateTime(2024, 1, 23), updatedAt: DateTime(2024, 1, 23)),
  FormEntry(id: '8', animalId: 3, type: FormType.RoutineCheck, checkedByUserId: 2, formData: {'Notes': 'Grooming recommendations provided.'}, isChecked: true, createdAt: DateTime(2024, 3, 1), sentAt: DateTime(2024, 3, 1), checkedAt: DateTime(2024, 3, 2), updatedAt: DateTime(2024, 3, 2)),
  FormEntry(id: '9', animalId: 3, type: FormType.RoutineCheck, formData: {'Notes': 'Owner reports excessive scratching.'}, isChecked: false, createdAt: DateTime(2024, 5, 18), sentAt: DateTime(2024, 5, 18), updatedAt: DateTime(2024, 5, 18)),

  // Animal 4 (3 Forms)
  FormEntry(id: '10', animalId: 4, type: FormType.RoutineCheck, checkedByUserId: 1, formData: {'Notes': 'All clear.'}, isChecked: true, createdAt: DateTime(2024, 4, 30), sentAt: DateTime(2024, 4, 30), checkedAt: DateTime(2024, 5, 1), updatedAt: DateTime(2024, 5, 1)),
  FormEntry(id: '11', animalId: 4, type: FormType.Emergency, checkedByUserId: 1, formData: {'Notes': 'Swallowed a foreign object.'}, isChecked: true, createdAt: DateTime(2024, 5, 20), sentAt: DateTime(2024, 5, 20), checkedAt: DateTime(2024, 5, 21), updatedAt: DateTime(2024, 5, 21)),
  FormEntry(id: '12', animalId: 4, type: FormType.Surgery, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 25), updatedAt: DateTime(2024, 6, 25)),

  // Animal 5 (3 Forms)
  FormEntry(id: '13', animalId: 5, type: FormType.RoutineCheck, checkedByUserId: 3, formData: {'Notes': 'Routine check, all good.'}, isChecked: true, createdAt: DateTime(2024, 5, 1), sentAt: DateTime(2024, 5, 1), checkedAt: DateTime(2024, 5, 2), updatedAt: DateTime(2024, 5, 2)),
  FormEntry(id: '14', animalId: 5, type: FormType.Vaccination, formData: {'Notes': 'Annual vaccine shots given.'}, isChecked: false, createdAt: DateTime(2024, 5, 2), sentAt: DateTime(2024, 5, 2), updatedAt: DateTime(2024, 5, 2)),
  FormEntry(id: '15', animalId: 5, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 7, 3), updatedAt: DateTime(2024, 7, 3)),

  // Animal 6 (3 Forms)
  FormEntry(id: '16', animalId: 6, type: FormType.Surgery, checkedByUserId: 2, formData: {'Notes': 'Scheduled for neutering.'}, isChecked: true, createdAt: DateTime(2024, 6, 10), sentAt: DateTime(2024, 6, 10), checkedAt: DateTime(2024, 6, 11), updatedAt: DateTime(2024, 6, 11)),
  FormEntry(id: '17', animalId: 6, type: FormType.RoutineCheck, formData: {'Notes': 'Post-surgery checkup.'}, isChecked: false, createdAt: DateTime(2024, 6, 24), sentAt: DateTime(2024, 6, 24), updatedAt: DateTime(2024, 6, 24)),
  FormEntry(id: '18', animalId: 6, type: FormType.Emergency, formData: {}, isChecked: false, createdAt: DateTime(2024, 8, 1), updatedAt: DateTime(2024, 8, 1)),

  // Animal 7 (3 Forms)
  FormEntry(id: '19', animalId: 7, type: FormType.RoutineCheck, checkedByUserId: 3, formData: {'Notes': 'All looks normal.'}, isChecked: true, createdAt: DateTime(2024, 3, 12), sentAt: DateTime(2024, 3, 12), checkedAt: DateTime(2024, 3, 13), updatedAt: DateTime(2024, 3, 13)),
  FormEntry(id: '20', animalId: 7, type: FormType.RoutineCheck, checkedByUserId: 3, formData: {'Notes': 'Discussed diet options.'}, isChecked: true, createdAt: DateTime(2024, 4, 15), sentAt: DateTime(2024, 4, 15), checkedAt: DateTime(2024, 4, 16), updatedAt: DateTime(2024, 4, 16)),
  FormEntry(id: '21', animalId: 7, type: FormType.Vaccination, formData: {}, isChecked: false, createdAt: DateTime(2024, 5, 22), updatedAt: DateTime(2024, 5, 22)),

  // Animal 8 (3 Forms)
  FormEntry(id: '22', animalId: 8, type: FormType.Emergency, checkedByUserId: 3, formData: {'Notes': 'Presented with a limp.'}, isChecked: true, createdAt: DateTime(2024, 5, 30), sentAt: DateTime(2024, 5, 30), checkedAt: DateTime(2024, 5, 31), updatedAt: DateTime(2024, 5, 30)),
  FormEntry(id: '23', animalId: 8, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 15), updatedAt: DateTime(2024, 6, 15)),
  FormEntry(id: '24', animalId: 8, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 7, 1), updatedAt: DateTime(2024, 7, 1)),

  // Animal 9 (3 Forms)
  FormEntry(id: '25', animalId: 9, type: FormType.RoutineCheck, checkedByUserId: 2, formData: {'Notes': 'Normal checkup.'}, isChecked: true, createdAt: DateTime(2024, 5, 9), sentAt: DateTime(2024, 5, 9), checkedAt: DateTime(2024, 5, 10), updatedAt: DateTime(2024, 5, 10)),
  FormEntry(id: '26', animalId: 9, type: FormType.Vaccination, checkedByUserId: 2, formData: {'Notes': 'Flea and tick prevention applied.'}, isChecked: true, createdAt: DateTime(2024, 5, 23), sentAt: DateTime(2024, 5, 23), checkedAt: DateTime(2024, 5, 24), updatedAt: DateTime(2024, 5, 24)),
  FormEntry(id: '27', animalId: 9, type: FormType.Surgery, formData: {'Notes': 'Dental cleaning performed.'}, isChecked: false, createdAt: DateTime(2024, 6, 14), sentAt: DateTime(2024, 6, 14), updatedAt: DateTime(2024, 6, 14)),

  // Animal 10 (3 Forms)
  FormEntry(id: '28', animalId: 10, type: FormType.RoutineCheck, checkedByUserId: 2, formData: {'Notes': 'Healthy and active.'}, isChecked: true, createdAt: DateTime(2024, 2, 28), sentAt: DateTime(2024, 2, 28), checkedAt: DateTime(2024, 2, 29), updatedAt: DateTime(2024, 2, 29)),
  FormEntry(id: '29', animalId: 10, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 4, 10), updatedAt: DateTime(2024, 4, 10)),
  FormEntry(id: '30', animalId: 10, type: FormType.Emergency, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 5), updatedAt: DateTime(2024, 6, 5)),

  // Animal 11 (3 Forms)
  FormEntry(id: '31', animalId: 11, type: FormType.Vaccination, checkedByUserId: 2, formData: {'Notes': 'Annual shots up to date.'}, isChecked: true, createdAt: DateTime(2024, 5, 16), sentAt: DateTime(2024, 5, 16), checkedAt: DateTime(2024, 5, 17), updatedAt: DateTime(2024, 5, 17)),
  FormEntry(id: '32', animalId: 11, type: FormType.RoutineCheck, formData: {'Notes': 'Slightly underweight.'}, isChecked: false, createdAt: DateTime(2024, 6, 20), sentAt: DateTime(2024, 6, 20), updatedAt: DateTime(2024, 6, 20)),
  FormEntry(id: '33', animalId: 11, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 7, 18), updatedAt: DateTime(2024, 7, 18)),

  // Animal 12 (3 Forms)
  FormEntry(id: '34', animalId: 12, type: FormType.RoutineCheck, checkedByUserId: 2, formData: {'Notes': 'Pre-adoption screening passed.'}, isChecked: true, createdAt: DateTime(2024, 6, 22), sentAt: DateTime(2024, 6, 22), checkedAt: DateTime(2024, 6, 23), updatedAt: DateTime(2024, 6, 23)),
  FormEntry(id: '35', animalId: 12, type: FormType.RoutineCheck, checkedByUserId: 2, formData: {'Notes': 'Ready for new home.'}, isChecked: true, createdAt: DateTime(2024, 6, 29), sentAt: DateTime(2024, 6, 29), checkedAt: DateTime(2024, 6, 30), updatedAt: DateTime(2024, 6, 30)),
  FormEntry(id: '36', animalId: 12, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 7, 5), updatedAt: DateTime(2024, 7, 5)),

  // Animal 13 (4 Forms)
  FormEntry(id: '37', animalId: 13, type: FormType.RoutineCheck, checkedByUserId: 3, formData: {'Notes': 'First checkup.'}, isChecked: true, createdAt: DateTime(2024, 1, 5), sentAt: DateTime(2024, 1, 5), checkedAt: DateTime(2024, 1, 6), updatedAt: DateTime(2024, 1, 6)),
  FormEntry(id: '38', animalId: 13, type: FormType.Vaccination, checkedByUserId: 3, formData: {'Notes': 'First round of puppy shots.'}, isChecked: true, createdAt: DateTime(2024, 2, 5), sentAt: DateTime(2024, 2, 5), checkedAt: DateTime(2024, 2, 6), updatedAt: DateTime(2024, 2, 6)),
  FormEntry(id: '39', animalId: 13, type: FormType.Vaccination, formData: {'Notes': 'Second round of puppy shots.'}, isChecked: false, createdAt: DateTime(2024, 3, 5), sentAt: DateTime(2024, 3, 5), updatedAt: DateTime(2024, 3, 5)),
  FormEntry(id: '40', animalId: 13, type: FormType.Surgery, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 1), updatedAt: DateTime(2024, 6, 1)),

  // Animal 14 (4 Forms)
  FormEntry(id: '41', animalId: 14, type: FormType.Emergency, checkedByUserId: 1, formData: {'Notes': 'Treated for minor cut on paw.'}, isChecked: true, createdAt: DateTime(2024, 4, 12), sentAt: DateTime(2024, 4, 12), checkedAt: DateTime(2024, 4, 13), updatedAt: DateTime(2024, 4, 13)),
  FormEntry(id: '42', animalId: 14, type: FormType.RoutineCheck, formData: {'Notes': 'Wound is healing well.'}, isChecked: false, createdAt: DateTime(2024, 4, 26), sentAt: DateTime(2024, 4, 26), updatedAt: DateTime(2024, 4, 26)),
  FormEntry(id: '43', animalId: 14, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 5, 24), updatedAt: DateTime(2024, 5, 24)),
  FormEntry(id: '44', animalId: 14, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 21), updatedAt: DateTime(2024, 6, 21)),

  // Animal 15 (4 Forms)
  FormEntry(id: '45', animalId: 15, type: FormType.RoutineCheck, checkedByUserId: 1, formData: {'Notes': 'Initial intake screening.'}, isChecked: true, createdAt: DateTime(2024, 6, 1), sentAt: DateTime(2024, 6, 1), checkedAt: DateTime(2024, 6, 2), updatedAt: DateTime(2024, 6, 2)),
  FormEntry(id: '46', animalId: 15, type: FormType.Vaccination, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 2), updatedAt: DateTime(2024, 6, 2)),
  FormEntry(id: '47', animalId: 15, type: FormType.Surgery, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 3), updatedAt: DateTime(2024, 6, 3)),
  FormEntry(id: '48', animalId: 15, type: FormType.Emergency, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 4), updatedAt: DateTime(2024, 6, 4)),

  // Animal 16 (4 Forms)
  FormEntry(id: '49', animalId: 16, type: FormType.RoutineCheck, checkedByUserId: 1, formData: {'Notes': 'Good health.'}, isChecked: true, createdAt: DateTime(2024, 1, 10), sentAt: DateTime(2024, 1, 10), checkedAt: DateTime(2024, 1, 11), updatedAt: DateTime(2024, 1, 11)),
  FormEntry(id: '50', animalId: 16, type: FormType.RoutineCheck, checkedByUserId: 1, formData: {'Notes': 'Good health.'}, isChecked: true, createdAt: DateTime(2024, 2, 10), sentAt: DateTime(2024, 2, 10), checkedAt: DateTime(2024, 2, 11), updatedAt: DateTime(2024, 2, 11)),
  FormEntry(id: '51', animalId: 16, type: FormType.RoutineCheck, checkedByUserId: 1, formData: {'Notes': 'Good health.'}, isChecked: true, createdAt: DateTime(2024, 3, 10), sentAt: DateTime(2024, 3, 10), checkedAt: DateTime(2024, 3, 11), updatedAt: DateTime(2024, 3, 11)),
  FormEntry(id: '52', animalId: 16, type: FormType.RoutineCheck, formData: {'Notes': 'Needs a dental check.'}, isChecked: false, createdAt: DateTime(2024, 4, 10), sentAt: DateTime(2024, 4, 10), updatedAt: DateTime(2024, 4, 10)),

  // Animal 17 (4 Forms)
  FormEntry(id: '53', animalId: 17, type: FormType.Vaccination, checkedByUserId: 3, formData: {'Notes': 'Rabies shot.'}, isChecked: true, createdAt: DateTime(2024, 5, 5), sentAt: DateTime(2024, 5, 5), checkedAt: DateTime(2024, 5, 6), updatedAt: DateTime(2024, 5, 6)),
  FormEntry(id: '54', animalId: 17, type: FormType.Surgery, checkedByUserId: 3, formData: {'Notes': 'Minor procedure on left ear.'}, isChecked: true, createdAt: DateTime(2024, 5, 12), sentAt: DateTime(2024, 5, 12), checkedAt: DateTime(2024, 5, 13), updatedAt: DateTime(2024, 5, 13)),
  FormEntry(id: '55', animalId: 17, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 5, 26), updatedAt: DateTime(2024, 5, 26)),
  FormEntry(id: '56', animalId: 17, type: FormType.Emergency, formData: {}, isChecked: false, createdAt: DateTime(2024, 6, 3), updatedAt: DateTime(2024, 6, 3)),

  // Animal 18 (4 Forms)
  FormEntry(id: '57', animalId: 18, type: FormType.RoutineCheck, checkedByUserId: 1, formData: {'Notes': 'Behavioral assessment.'}, isChecked: true, createdAt: DateTime(2024, 6, 18), sentAt: DateTime(2024, 6, 18), checkedAt: DateTime(2024, 6, 19), updatedAt: DateTime(2024, 6, 19)),
  FormEntry(id: '58', animalId: 18, type: FormType.RoutineCheck, formData: {'Notes': 'Dietary consultation.'}, isChecked: false, createdAt: DateTime(2024, 6, 28), sentAt: DateTime(2024, 6, 28), updatedAt: DateTime(2024, 6, 28)),
  FormEntry(id: '59', animalId: 18, type: FormType.Vaccination, formData: {}, isChecked: false, createdAt: DateTime(2024, 7, 10), updatedAt: DateTime(2024, 7, 10)),
  FormEntry(id: '60', animalId: 18, type: FormType.RoutineCheck, formData: {}, isChecked: false, createdAt: DateTime(2024, 8, 1), updatedAt: DateTime(2024, 8, 1)),
];


// --- ANIMALS (20 total) ---
List<Animal> mockAnimals = [
  Animal(id: 1, ownerId: 1, name: 'Karabaş', species: 'Köpek',breed: 'Golden Retriever', age: 5, lastCheckDate: DateTime.now().subtract(const Duration(days: 10)), createdAt: DateTime(2023, 3, 1), updatedAt: DateTime(2023, 11, 1), owner: mockOwners[0], forms: mockFormEntries.where((form) => form.animalId == 1).toList()),
  Animal(id: 2, ownerId: 2, name: 'Pamuk', species: 'Kedi', age: 3, lastCheckDate: DateTime.now().subtract(const Duration(days: 20)), createdAt: DateTime(2023, 3, 2), updatedAt: DateTime(2023, 11, 2), owner: mockOwners[1], forms: mockFormEntries.where((form) => form.animalId == 2).toList()),
  Animal(id: 3, ownerId: 3, name: 'Maviş', species: 'Kuş', age: 2, lastCheckDate: DateTime.now().subtract(const Duration(days: 30)), createdAt: DateTime(2023, 3, 3), updatedAt: DateTime(2023, 11, 3), owner: mockOwners[2], forms: mockFormEntries.where((form) => form.animalId == 3).toList()),
  Animal(id: 4, ownerId: 4, name: 'Dost', species: 'Köpek', age: 7, lastCheckDate: DateTime.now().subtract(const Duration(days: 40)), createdAt: DateTime(2023, 3, 4), updatedAt: DateTime(2023, 11, 4), owner: mockOwners[3], forms: mockFormEntries.where((form) => form.animalId == 4).toList()),
  Animal(id: 5, ownerId: 5, name: 'Boncuk', species: 'Kedi', age: 1, lastCheckDate: DateTime.now().subtract(const Duration(days: 50)), createdAt: DateTime(2023, 3, 5), updatedAt: DateTime(2023, 11, 5), owner: mockOwners[4], forms: mockFormEntries.where((form) => form.animalId == 5).toList()),
  Animal(id: 6, ownerId: 6, name: 'Paşa', species: 'Köpek', age: 4, lastCheckDate: DateTime.now().subtract(const Duration(days: 60)), createdAt: DateTime(2023, 3, 6), updatedAt: DateTime(2023, 11, 6), owner: mockOwners[5], forms: mockFormEntries.where((form) => form.animalId == 6).toList()),
  Animal(id: 7, ownerId: 7, name: 'Limon', species: 'Kuş', age: 3, lastCheckDate: DateTime.now().subtract(const Duration(days: 70)), createdAt: DateTime(2023, 3, 7), updatedAt: DateTime(2023, 11, 7), owner: mockOwners[6], forms: mockFormEntries.where((form) => form.animalId == 7).toList()),
  Animal(id: 8, ownerId: 8, name: 'Zeytin', species: 'Kedi', age: 6, lastCheckDate: DateTime.now().subtract(const Duration(days: 80)), createdAt: DateTime(2023, 3, 8), updatedAt: DateTime(2023, 11, 8), owner: mockOwners[7], forms: mockFormEntries.where((form) => form.animalId == 8).toList()),
  Animal(id: 9, ownerId: 9, name: 'Fındık', species: 'Köpek', age: 2, lastCheckDate: DateTime.now().subtract(const Duration(days: 90)), createdAt: DateTime(2023, 3, 9), updatedAt: DateTime(2023, 11, 9), owner: mockOwners[8], forms: mockFormEntries.where((form) => form.animalId == 9).toList()),
  Animal(id: 10, ownerId: 10, name: 'Bulut', species: 'Kedi', age: 8, lastCheckDate: DateTime.now().subtract(const Duration(days: 100)), createdAt: DateTime(2023, 3, 10), updatedAt: DateTime(2023, 11, 10), owner: mockOwners[9], forms: mockFormEntries.where((form) => form.animalId == 10).toList()),
  Animal(id: 11, ownerId: 11, name: 'Şeker', species: 'Kuş', age: 1, lastCheckDate: DateTime.now().subtract(const Duration(days: 110)), createdAt: DateTime(2023, 3, 11), updatedAt: DateTime(2023, 11, 11), owner: mockOwners[10], forms: mockFormEntries.where((form) => form.animalId == 11).toList()),
  Animal(id: 12, ownerId: 12, name: 'Kont', species: 'Köpek', age: 9, lastCheckDate: DateTime.now().subtract(const Duration(days: 120)), createdAt: DateTime(2023, 3, 12), updatedAt: DateTime(2023, 11, 12), owner: mockOwners[11], forms: mockFormEntries.where((form) => form.animalId == 12).toList()),
  Animal(id: 13, ownerId: 13, name: 'Garfield', species: 'Kedi', age: 4, lastCheckDate: DateTime.now().subtract(const Duration(days: 130)), createdAt: DateTime(2023, 3, 13), updatedAt: DateTime(2023, 11, 13), owner: mockOwners[12], forms: mockFormEntries.where((form) => form.animalId == 13).toList()),
  Animal(id: 14, ownerId: 14, name: 'Çakıl', species: 'Köpek', age: 6, lastCheckDate: DateTime.now().subtract(const Duration(days: 140)), createdAt: DateTime(2023, 3, 14), updatedAt: DateTime(2023, 11, 14), owner: mockOwners[13], forms: mockFormEntries.where((form) => form.animalId == 14).toList()),
  Animal(id: 15, ownerId: 15, name: 'Duman', species: 'Kedi', age: 5, lastCheckDate: DateTime.now().subtract(const Duration(days: 150)), createdAt: DateTime(2023, 3, 15), updatedAt: DateTime(2023, 11, 15), owner: mockOwners[14], forms: mockFormEntries.where((form) => form.animalId == 15).toList()),
  Animal(id: 16, ownerId: 16, name: 'Hera', species: 'Köpek', age: 3, lastCheckDate: DateTime.now().subtract(const Duration(days: 160)), createdAt: DateTime(2023, 3, 16), updatedAt: DateTime(2023, 11, 16), owner: mockOwners[15], forms: mockFormEntries.where((form) => form.animalId == 16).toList()),
  Animal(id: 17, ownerId: 17, name: 'Simba', species: 'Kedi', age: 2, lastCheckDate: DateTime.now().subtract(const Duration(days: 170)), createdAt: DateTime(2023, 3, 17), updatedAt: DateTime(2023, 11, 17), owner: mockOwners[16], forms: mockFormEntries.where((form) => form.animalId == 17).toList()),
  Animal(id: 18, ownerId: 18, name: 'Tarçın', species: 'Köpek', age: 7, lastCheckDate: DateTime.now().subtract(const Duration(days: 180)), createdAt: DateTime(2023, 3, 18), updatedAt: DateTime(2023, 11, 18), owner: mockOwners[17], forms: mockFormEntries.where((form) => form.animalId == 18).toList()),
  Animal(id: 19, ownerId: 19, name: 'Yoda', species: 'Tavşan', age: 1, lastCheckDate: null, createdAt: DateTime(2023, 4, 19), updatedAt: DateTime(2023, 4, 19), owner: mockOwners[18], forms: []),
  Animal(id: 20, ownerId: 20, name: 'Spike', species: 'İguana', age: 4, lastCheckDate: null, createdAt: DateTime(2023, 4, 20), updatedAt: DateTime(2023, 4, 20), owner: mockOwners[19], forms: []),
];
