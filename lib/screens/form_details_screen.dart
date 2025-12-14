import 'package:flutter/material.dart';
import 'package:keepintouch/models/models.dart';

class FormDetailsScreen extends StatefulWidget {
  final FormEntry form;

  const FormDetailsScreen({super.key, required this.form});

  @override
  State<FormDetailsScreen> createState() => _FormDetailsScreenState();
}

class _FormDetailsScreenState extends State<FormDetailsScreen> {
  late FormEntry _formState;

  @override
  void initState() {
    super.initState();
    // Create a local, mutable copy of the form to manage its state
    _formState = widget.form;
  }

  // Helper function to handle the state change for the checkbox.
  void _toggleChecked(bool newValue) {
    setState(() {
      _formState = FormEntry(
        id: _formState.id,
        animalId: _formState.animalId,
        type: _formState.type,
        formData: _formState.formData,
        isChecked: newValue,
        createdAt: _formState.createdAt,
        sentAt: _formState.sentAt,
        checkedAt: newValue ? DateTime.now() : null,
        updatedAt: DateTime.now(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // We manually control popping to return data
      onPopInvoked: (bool didPop) { // Using the modern callback
        // This is called after a pop gesture is handled.
        if (didPop) return; // If pop already happened, do nothing.
        Navigator.of(context).pop(_formState); // Otherwise, pop with our data.
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_formState.type.displayTitle),
          // Also update the AppBar's back button to return the state
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(_formState),
          ),
        ),
        body: Container(
          color: Colors.green[50],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display form data only if it is filled
              if (_formState.isFilled)
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _formState.formData.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.key, // Question
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                entry.value, // Answer
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              if (entry.key != _formState.formData.keys.last)
                                const Divider(height: 24),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              else
                // Show a message if the form is not filled out
                const Expanded(
                  child: Center(
                    child: Text(
                      'This form has not been filled out yet.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
              const Spacer(),
              // Only show the review checkbox if the form has been filled
              if (_formState.isFilled)
                Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias, // Ensures the InkWell ripple stays inside
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () => _toggleChecked(!_formState.isChecked),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Kontrol Edildi', style: TextStyle(fontSize: 16)),
                          Checkbox(
                            value: _formState.isChecked,
                            onChanged: (bool? newValue) {
                              if (newValue != null) {
                                _toggleChecked(newValue);
                              }
                            },
                            activeColor: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
