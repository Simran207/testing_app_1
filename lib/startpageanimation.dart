
import 'package:flutter/material.dart';

import 'loginscreen.dart';
import 'registrationpage.dart';
import 'sharedpreference.dart';

class Startpageanimation extends StatefulWidget {
  const Startpageanimation({super.key});

  @override
  State<Startpageanimation> createState() => StartpageanimationState();
}

class StartpageanimationState extends State<Startpageanimation> {
  double size = 100;

  @override
  void initState() {
    super.initState();

    // Trigger animation after widget builds
    Future.delayed(Duration.zero, () {
      setState(() {
        size = 200; // final size
      });
    });
   Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Registrationpage()),
      );
    });
  getStartPage();
  
  }
Future<Widget> getStartPage() async {
    bool loggedIn = await Sharedpreference.isLoggedIn();

    if (loggedIn) {
      String name = await Sharedpreference.getName();
     // return DashboardScreen(name: name);
     return LoginScreen();
    } else {
      return Registrationpage();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center, // centers vertically
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        AnimatedContainer(
          duration: const Duration(seconds: 10),
          curve: Curves.easeOut,
          height: size,
          width: size,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/gurudev.png',
                    // fit: BoxFit.fill, 
                 ),
              ),
            ],
          ),
        ),
         const Text('श्री तिलोक रत्न स्थानकवासी जैन धार्मिक परीक्षा बोर्ड ',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 40,color: Colors.red),),
         ],
      ),
    );
  }
}