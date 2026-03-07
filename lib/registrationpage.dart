import 'package:flutter/material.dart';
import 'package:testing_app_1/loginscreen.dart';
import 'package:testing_app_1/sharedpreference.dart';

class Registrationpage extends StatelessWidget {

  Future<Widget> getStartPage() async {
    bool loggedIn = await Sharedpreference.isLoggedIn();

    if (loggedIn) {
      String name = await Sharedpreference.getName();
     // return DashboardScreen(name: name);
     return LoginScreen();
    } else {
      return LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registrion',
      color: Colors.red,
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: FutureBuilder<Widget>(
        future: getStartPage(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return snapshot.data!;
        },
      ),
    );
  }
}

