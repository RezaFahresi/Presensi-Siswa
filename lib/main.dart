import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/attendance_provider.dart';
import './screens/attendance_screen.dart';
import './screens/history_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AttendanceProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Warna utama aplikasi
        scaffoldBackgroundColor: Colors.blue.shade50, // Latar belakang
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87), // Warna teks default
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent, // Warna tombol
            foregroundColor: Colors.white, // Warna teks tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Tombol dengan sudut melengkung
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo, // Warna latar AppBar
          foregroundColor: Colors.white, // Warna teks AppBar
          elevation: 0, // Hilangkan bayangan
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final _screens = [AttendanceScreen(), HistoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Pencatatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
      ),
    );
  }
}
