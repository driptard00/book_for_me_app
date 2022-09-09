import 'dart:convert';

import 'package:bookforme/routes/app_route_names.dart';
import 'package:bookforme/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

  
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  var loggedInUser = await _flutterSecureStorage.read(key: "loggedInUser") ?? "";

  // Decode user
  Map<String, dynamic>? _decodedUser;
  if(loggedInUser.isNotEmpty){
    _decodedUser = json.decode(loggedInUser);
  }

  runApp(MyApp(
    loggedInUserData : _decodedUser
  ));
}

class MyApp extends StatelessWidget{
  final Map<String, dynamic>? loggedInUserData;

  MyApp({Key? key, this.loggedInUserData}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var initialRoute = (loggedInUserData == null) ?
    (splashscreen):
    (holderpage);

    return GetMaterialApp( 
      debugShowCheckedModeBanner: false, 
      title: "Book for me",
      theme: ThemeData( 
        fontFamily: "Inter" 
      ),
      initialRoute: initialRoute,
      getPages: getPages
    );
  }
 
}