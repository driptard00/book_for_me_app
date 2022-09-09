import 'package:bookforme/introscreen.dart';
import 'package:bookforme/screens/auth/login.dart';
import 'package:bookforme/screens/auth/signup.dart';
import 'package:bookforme/screens/customer/editmeal.dart';
import 'package:bookforme/screens/customer/holderpage.dart';
import 'package:bookforme/screens/customer/mealPage.dart';
import 'package:bookforme/screens/customer/notificationpage.dart';
import 'package:bookforme/screens/customer/profile.dart';
import 'package:bookforme/widgets/splash_screen.dart';
import 'package:get/get.dart';
import 'app_route_names.dart';

// =========== APP ROUTES ============

List <GetPage> getPages =  [

// ====== SPLASH SCREEN ========
  GetPage(
    name: splashscreen, 
    page: ()=> const SplashScreen()
  ),

// ========= INTRO SCREEN ========
  GetPage(
    name: introscreen, 
    page: ()=> IntroScreen(), 
    transition: Transition.cupertino, 
    transitionDuration: const Duration(seconds: 1)
  ),

// ======== AUTH SCREENS (CUSTOMERS) ========
// ======== Sign up =======
  GetPage(
    name: usersignup, 
    page: ()=> SignUp(), 
    transition: Transition.cupertino, 
    transitionDuration: const Duration(seconds: 1)
  ),

// ======== Login =======
  GetPage(
    name: userloginscreen, 
    page: ()=> SignIn(), 
    transition: Transition.cupertino, 
    transitionDuration: const Duration(seconds: 1)
  ),

  // ====== MAIN SCREENS (CUSTOMERS) ========
  GetPage(
    name: holderpage, 
    page: ()=> HolderPage(), 
    transition: Transition.cupertino, 
    transitionDuration: const Duration(seconds: 1)
  ),

  GetPage(
    name: mealscreen, 
    page: ()=> MealPage(), 
    transition: Transition.cupertino, 
    transitionDuration: const Duration(seconds: 1)
  ),

  GetPage(
    name: profilescreen, 
    page: ()=> ProfilePage(), 
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),

  GetPage(
    name: detailscreen, 
    page: ()=> EditMeal(), 
    transition: Transition.cupertino, 
    transitionDuration: const Duration(seconds: 1)
  ),

  GetPage(
    name: notificationscreen, 
    page: ()=> NotificationPage(), 
    transition: Transition.cupertino, 
    transitionDuration: const Duration(seconds: 1)
  ),


];