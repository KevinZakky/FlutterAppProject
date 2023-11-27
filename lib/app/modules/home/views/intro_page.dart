import 'package:modul2/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:modul2/app/modules/home/views/login_page.dart';
import 'package:modul2/app/modules/home/views/register_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80.0, top: 50.0, bottom: 30.0),
            child: Image.asset('lib/images/basket.png'),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 50.0, right: 50.0, top: 0, bottom: 20.0),
            child: Text(
              "We deliver grocery at your doorstep",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 47.0, right: 47.0, top: 10.0),
            child: Text(
              "Groceer gives you fresh vegetables and fruits, Order fresh items from groceer.",
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 136, 135, 135)),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RegisterPage();
                },
              ),
            ),
            child: Container(
              width: 180,
              height: 50,
              margin: const EdgeInsets.only(top: 45),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 132, 138, 228),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            ),
            child: Container(
              width: 180,
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 132, 138, 228),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
