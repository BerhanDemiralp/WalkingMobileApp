import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keepintouch/screens/form_details_screen.dart';
import 'package:keepintouch/models/models.dart';
import 'package:keepintouch/services/animal_service.dart';

class AnimalProfileScreen extends StatefulWidget {
  final Animal animal;

  const AnimalProfileScreen({super.key, required this.animal});

  @override
  State<AnimalProfileScreen> createState() => _AnimalProfileScreenState();
}

class _AnimalProfileScreenState extends State<AnimalProfileScreen> {
  late Animal _animalState;
  final AnimalService _animalService = AnimalService();

  @override
  void initState() {
    super.initState();
    // Create a local, mutable copy to manage state
    _animalState = widget.animal;
  }

  // Method to handle updating the form in the local state and service
  void _updateForm(FormEntry updatedForm) {
    // This updates the data in our mock service
    _animalService.updateForm(updatedForm);
    setState(() {
      // This updates the UI of this screen
      final formIndex = _animalState.forms.indexWhere((f) => f.id == updatedForm.id);
      if (formIndex != -1) {
        _animalState.forms[formIndex] = updatedForm;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the local state object for building the UI
    final sortedForms = List<FormEntry>.from(_animalState.forms);
    sortedForms.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return Scaffold(
      appBar: AppBar(
        title: Text(_animalState.name),
        elevation: 0,
      ),
      body: Container(
        color: Colors.green[50],
        child: Column(
          children: [
            // Header with animal avatar
            Container(
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.pets, size: 50, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _animalState.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Animal and Owner Information
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Hayvan Bilgileri',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.info_outline, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text('Tür: ${_animalState.species}'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.cake_outlined, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text('Yaş: ${_animalState.age}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Sahip Bilgileri',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.person_outline, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text('Ad: ${_animalState.owner.name}'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.phone_outlined, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text('İletişim: ${_animalState.owner.contact}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(indent: 16, endIndent: 16),
            // List of All Forms
            Expanded(
              child: ListView.builder(
                itemCount: sortedForms.length,
                itemBuilder: (context, index) {
                  final form = sortedForms[index];

                  Widget leadingIcon;
                  String subtitle;

                  if (!form.isFilled) {
                    // State 1: Pending (unfilled)
                    leadingIcon = CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.hourglass_empty, color: Colors.grey[600]),
                    );
                    subtitle = 'Pending';
                  } else if (form.isFilled && !form.isChecked) {
                    // State 2: Awaiting Review (filled but not checked)
                    leadingIcon = CircleAvatar(
                      backgroundColor: Colors.orange[100],
                      child: Icon(form.type.icon, color: Colors.orange),
                    );
                    subtitle = 'Awaiting Review';
                  } else {
                    // State 3: Reviewed (filled and checked)
                    leadingIcon = CircleAvatar(
                      backgroundColor: Colors.green[100],
                      child: Icon(form.type.icon, color: Colors.green),
                    );
                    subtitle = 'Reviewed';
                  }

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: leadingIcon,
                      title: Text(form.type.displayTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
                      trailing: Text(
                        DateFormat('dd MMM yyyy').format(form.createdAt),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormDetailsScreen(form: form),
                          ),
                        );
                        // If a form was returned with changes, update the state
                        if (result != null && result is FormEntry) {
                          _updateForm(result);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
