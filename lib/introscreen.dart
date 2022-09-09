import 'package:bookforme/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Image.asset("img/introimage.png", width: 350, height: 350,),
            const SizedBox(height: 100,),
            const Text(
              "Book your favorite meal from any restaurant anywhere, anytime",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(usersignup);
        },
        backgroundColor: Colors.black,
        child: const Icon(Iconsax.arrow_right),
      ),
    );
  }
}