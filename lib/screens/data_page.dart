import 'package:flutter/material.dart';
import 'package:keepintouch/data/mock_data.dart';
import 'package:keepintouch/models/models.dart';
import 'package:keepintouch/services/data_service.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final DataService _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _dataService,
      builder: (context, _) {
        // Analytics calculation
        final totalAnimals = mockAnimals.length;
        final totalForms = mockFormEntries.length;
        final filledForms = mockFormEntries.where((f) => f.isFilled).length;
        final checkedForms = mockFormEntries.where((f) => f.isChecked).length;
        
        // Species distribution
        final Map<String, int> speciesCount = {};
        for (var animal in mockAnimals) {
          speciesCount[animal.species] = (speciesCount[animal.species] ?? 0) + 1;
        }

        return Container(
          color: Colors.green[50],
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildSummaryCard('Animal Overview', [
                _buildStatItem('Total Animals', totalAnimals.toString(), Icons.pets),
                _buildStatItem('Total Owners', mockOwners.length.toString(), Icons.people),
              ]),
              const SizedBox(height: 16),
              _buildSummaryCard('Form Progress', [
                _buildStatItem('Total Assigned', totalForms.toString(), Icons.assignment),
                _buildStatItem('Filled by Owners', filledForms.toString(), Icons.edit_note),
                _buildStatItem('Reviewed by Staff', checkedForms.toString(), Icons.fact_check),
              ]),
              const SizedBox(height: 16),
              _buildSpeciesCard(speciesCount),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryCard(String title, List<Widget> items) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
            const Divider(),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSpeciesCard(Map<String, int> speciesCount) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Species Distribution', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
            const Divider(),
            ...speciesCount.entries.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Text(e.key, style: const TextStyle(fontSize: 16)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(e.value.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
