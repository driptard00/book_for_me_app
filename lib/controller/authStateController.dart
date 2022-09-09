import 'dart:convert';

import 'package:bookforme/routes/api_route_names.dart';
import 'package:bookforme/routes/app_route_names.dart';
import 'package:bookforme/services/apiservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  
  // declare instant variables
  String _name = "";
  String _email = "";
  String _password = "";
  String _phonenumber = "";
  String _role = "";
  bool _hidePassword = true;
  bool _isLoading = false;

  // List & Maps
  Map<String, dynamic> _userDetails = {};
  final List<String> _userRoles = [
    "Customer",
    "Business Owner"
  ];

  // FLutter Secure Storage
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  //Text Editing Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  //GETTERS
  bool get hidePassword => _hidePassword;
  String get email => _email;
  String get password => _password;
  String get phonenumber => _phonenumber;
  String get name => _name;
  String get role => _role;
  bool get isLoading => _isLoading;


  // List & Maps
  Map<String, dynamic> get userDetails => _userDetails;
  List<String> get userRoles => _userRoles;

  // FLutter Secure Storage
  FlutterSecureStorage get flutterSecureStorage => _flutterSecureStorage; 

  //Text Editing Controllers
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;

  //SETTERS
  togglePassword() {
    _hidePassword= !_hidePassword;
    update();
  }
  updatedName(value) {
    _name = value;
    update();
  }
  updatedEmail(value) {
    _email = value;
    update();
  }
  updatedPassword(value) {
    _password = value;
    update();
  }
  updatedPhoneNumber(value) {
    _phonenumber = value;
    update();
  }
  updatedUserRole(value) {
    _role = value;
    update();
  }
  updateIsLoading(bool value) {
    _isLoading = value;
    update();
  }
  updateUserDetails(value) {
    _userDetails = value;
    update();
  }


  // Sign up user service
  Future<void> signUpUser() async {
    // update loading
    updateIsLoading(true);

    // declare the parameters
    Map<String, String> signUpUserDetails = {
      "fullname": _name,
      "email": _email,
      "password": _password,
      "phonenumber": _phonenumber,
      "role": _role,
    };

    // create the response
    var response = await ApiServices.userSignUp(signUpUserUrl, signUpUserDetails);
    print('RESPOONSE::::$response');

    bool isSuccess = response!.data["success"];
    if(isSuccess){
      updateIsLoading(false);

      Map<String, dynamic> userData = response.data["data"];
      print('USERS::::$response');

      // show success
      Get.snackbar(
        "Success!!!!", 
        "Sign up successful"
      );
      Get.toNamed(userloginscreen);
       
    }else{
      updateIsLoading(false);

      // show error 
      Get.snackbar(
        "Error!!!!", 
        "${response.data["message"]}"
      );
    }


    update();
  }


  // Login user service
  Future<void> loginUser () async {
    updateIsLoading(true);

    Map<String, String> loginUserDetails = {
      "email": _email,
      "password": _password
    };
    
    var response = await ApiServices.userLogin(loginUserUrl, loginUserDetails);
    print('RESPOONSE::::$response');

    bool isSuccess = response!.data["success"];
    if(isSuccess){
      updateIsLoading(false);

      // Store in variable
      Map<String, dynamic> userData = response.data["data"];

      // Encode the data
      String _encodedData = jsonEncode(userData);

      // Store in secure storage
      await _flutterSecureStorage.write(key: "loggedInUser", value: _encodedData);

      if(userData["role"] == "Customer") {
        Get.snackbar(
          "Success!!!!", 
          "${response.data["message"]}"
        );
        Get.offNamed(holderpage);
      }
    }else{
      updateIsLoading(false);
      Get.snackbar(
        "Error!!!!", 
        "${response.data["message"]}"
      );

    }
    update();
    
  }
 
}