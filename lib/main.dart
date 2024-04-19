import 'package:debtrackr/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DebtTracker',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(   
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF535C91)),
        scaffoldBackgroundColor: const Color(0xFF070F2B),
        dividerColor: const Color(0xFF1B1A55),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Color(0xFF535C91) ,selectedItemColor: Colors.black)
      ),
      home: const BottomNavBar(),
    );
  }
}
