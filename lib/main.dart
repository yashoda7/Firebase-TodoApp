import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/home_page.dart';
import 'package:frontend/login_page.dart';
import 'package:frontend/signup_page.dart';
// import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:starter_code/home_page.dart';/


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: ThemeData(
        fontFamily: 'Cera Pro',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              // color: Pallete.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context,value){
          if(value.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
          // if(data.snapshot.hasError) return Text('Error: ${data.snapshot.error.message}');
          if(value.data!=null){
            return MyHomePage();
          }
          return SignUpPage();
        })
    );
  }
}
