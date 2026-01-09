import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:keepintouch/screens/home_page.dart';
import 'package:keepintouch/screens/data_page.dart';
import 'package:keepintouch/screens/profile_page.dart';
import 'package:keepintouch/auth/login_screen.dart';
import 'package:keepintouch/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final userJson = prefs.getString('logged_in_user');
  
  User? initialUser;
  if (userJson != null) {
    try {
      initialUser = User.fromJson(jsonDecode(userJson));
    } catch (e) {
      debugPrint('Error parsing saved user: $e');
    }
  }

  runApp(MyApp(initialUser: initialUser));
}

class MyApp extends StatelessWidget {
  final User? initialUser;
  const MyApp({super.key, this.initialUser});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep In Touch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          primary: const Color(0xFF4CAF50),
          secondary: const Color(0xFF81C784),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF388E3C),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF2E7D32),
          unselectedItemColor: Colors.grey,
        ),
        cardTheme: CardThemeData(
          elevation: 1,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        chipTheme: ChipThemeData(
            backgroundColor: const Color(0xFFC8E6C9),
            selectedColor: const Color(0xFF4CAF50),
            labelStyle: const TextStyle(color: Colors.black87),
            secondaryLabelStyle: const TextStyle(color: Colors.white),
            padding: const EdgeInsets.all(8.0)),
      ),
      home: initialUser != null 
          ? MainScreen(user: initialUser!) 
          : const LoginScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(currentUser: widget.user), // Pass user down
      DataPage(currentUser: widget.user), // Added currentUser here
      ProfilePage(user: widget.user),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<String> titles = ['Home', 'Data', 'Profile'];
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
