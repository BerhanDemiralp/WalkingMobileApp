import 'package:flutter/material.dart';
import 'package:keepintouch/models/models.dart';
import 'package:keepintouch/screens/animal_profile_screen.dart';
import 'package:keepintouch/services/animal_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnimalService _animalService = AnimalService();
  late Future<List<Animal>> _animalsFuture;

  bool _showUnfilled = false;
  bool _showUnchecked = false;

  @override
  void initState() {
    super.initState();
    _animalsFuture = _animalService.getAnimals();
  }

  void _refreshAnimalList() {
    setState(() {
      _animalsFuture = _animalService.getAnimals();
    });
  }

  List<Animal> _filterAnimals(List<Animal> animals) {
    if (!_showUnfilled && !_showUnchecked) {
      return animals;
    }
    return animals.where((animal) {
      bool matches = false;
      if (_showUnfilled) {
        matches = matches || animal.forms.any((form) => !form.isFilled);
      }
      if (_showUnchecked) {
        matches = matches || animal.forms.any((form) => form.isFilled && !form.isChecked);
      }
      return matches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[50],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterChip(
                    label: const Text('Doldurulmamış'),
                    selected: _showUnfilled,
                    onSelected: (selected) {
                      setState(() {
                        _showUnfilled = selected;
                        if (selected) _showUnchecked = false;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Kontrol Edilmemiş'),
                    selected: _showUnchecked,
                    onSelected: (selected) {
                      setState(() {
                        _showUnchecked = selected;
                        if (selected) _showUnfilled = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Animal>>(
                future: _animalsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Gösterilecek hayvan bulunamadı.'));
                  }

                  final allAnimals = snapshot.data!;
                  final filteredAnimals = _filterAnimals(allAnimals);

                  return RefreshIndicator(
                    onRefresh: () async => _refreshAnimalList(),
                    child: ListView.builder(
                      itemCount: filteredAnimals.length,
                      itemBuilder: (context, index) {
                        final animal = filteredAnimals[index];
                        final filledForms = animal.forms.where((form) => form.isFilled).toList();
                        final hasUncheckedForm = filledForms.any((form) => !form.isChecked);
                        final allFormsChecked = filledForms.isNotEmpty && !hasUncheckedForm;

                        Icon statusIcon;
                        Color statusColor;
                        String statusText;

                        if (allFormsChecked) {
                          statusIcon = const Icon(Icons.check_circle, color: Colors.white);
                          statusColor = Colors.green;
                          statusText = 'All Checked';
                        } else if (hasUncheckedForm) {
                          statusIcon = const Icon(Icons.warning, color: Colors.white);
                          statusColor = Colors.orange;
                          statusText = 'Unchecked Forms';
                        } else {
                          statusIcon = const Icon(Icons.remove_circle_outline, color: Colors.white);
                          statusColor = Colors.grey;
                          statusText = 'No Forms';
                        }

                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnimalProfileScreen(animal: animal),
                                ),
                              );
                              _refreshAnimalList();
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Theme.of(context).colorScheme.secondary,
                                    child: const Icon(Icons.pets, color: Colors.white, size: 30),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(animal.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 4),
                                        Text(animal.species, style: TextStyle(color: Colors.grey[600])),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: statusColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        statusIcon,
                                        const SizedBox(width: 4),
                                        Text(statusText, style: const TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
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