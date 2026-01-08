import 'package:flutter/material.dart';
import 'package:keepintouch/data/mock_data.dart';
import 'package:keepintouch/models/models.dart';
import 'package:keepintouch/auth/login_screen.dart';
import 'package:keepintouch/services/data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DataService _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _dataService,
      builder: (context, _) {
        // Recalculate stats every time the data service notifies of a change
        final formsCheckedByMe = mockFormEntries.where((f) => f.checkedByUserId == widget.user.id).toList();
        final currentTotal = formsCheckedByMe.length;
        final totalForms = mockFormEntries.length;

        return Container(
          color: Colors.green[50],
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 24),
              _buildInfoCard('Staff Information', [
                _buildInfoItem('Username', widget.user.username, Icons.person),
                _buildInfoItem('Email', widget.user.email, Icons.email),
                _buildInfoItem('Role', widget.user.role.toUpperCase(), Icons.badge),
              ]),
              const SizedBox(height: 16),
              _buildInfoCard('Work Statistics', [
                _buildInfoItem('Forms Checked', '$currentTotal / $totalForms', Icons.fact_check),
                _buildInfoItem('Account Created', _formatDate(widget.user.createdAt), Icons.calendar_today),
              ]),
              const SizedBox(height: 32),
              _buildLogoutButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.green,
          child: Text(
            widget.user.username[0].toUpperCase(),
            style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.user.username,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.user.role.toUpperCase(),
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, List<Widget> items) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            const Divider(),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _showLogoutDialog(context),
      icon: const Icon(Icons.logout),
      label: const Text('LOG OUT'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('logged_in_user');

              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
