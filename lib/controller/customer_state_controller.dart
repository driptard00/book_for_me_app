import 'dart:convert';
import 'package:bookforme/models/customer_model.dart';
import 'package:bookforme/routes/api_route_names.dart';
import 'package:bookforme/routes/app_route_names.dart';
import 'package:bookforme/services/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';


class CustomerStateController extends GetxController {

  // required variables
  String _name = "";
  String _email = "";
  String _phone = "";
  int _initialAmount = 1;
  int _selectedSreenIndex = 0;
  bool _isLoading = false;
  bool _isLiked = false; 
  bool _enablePhoneField = false;
  bool _enableNameField = false;

  List _orderedItems = [];

  // text editing controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  
  // flutter secure storage
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  
  // models
  Customers _customers = Customers();

  
  //GETTERS
  int get selectedScreenIndex => _selectedSreenIndex;
  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  bool get isLiked => _isLiked;
  int get initialAmount => _initialAmount;
  bool get isLoading => _isLoading;
  bool get enableNameField => _enableNameField;
  bool get enablePhoneField => _enablePhoneField;

  List get orderedItems => _orderedItems;


  // text editing controllers
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;

  // flutter secure storage
  FlutterSecureStorage get flutterSecureStorage => _flutterSecureStorage; 

  // models
  Customers get customers => _customers;


  //SETTERS
  updatedScreenItem (int value) {
    _selectedSreenIndex = value;
    update();
  }
  updateIsLoading (bool value) {
    _isLoading = value;
    update();
  }
  incrementAmount () {
    _initialAmount++;
    update();
  }
  decrementAmount () {
    _initialAmount--;
    update();
  }
  addOrderedItems (Map<String, dynamic> value) {
    _orderedItems.add(value);
    update();
  }
  removeOrderedData (Map<String, dynamic> value) {
    _orderedItems.remove(value);
    update();
  }
  updateTotalPrice(){
  }
  toggleLiked () {
    _isLiked = !_isLiked;
    update();
  }
  toggleNameField () {
    _enableNameField = !_enableNameField;
    update();
  }
  togglePhoneField () {
    _enablePhoneField = !_enablePhoneField;
    update();
  }
  updatedName(value) {
    _name = value;
    update();
  }
  updatedPhone(value) {
    _phone = value;
    update();
  }
  

  Future<void> getCustomersDetails () async{
    // read fss for user
    var _userInfo = await _flutterSecureStorage.read(key: "loggedInUser");
    if(_userInfo != null){
      // decode user
      Map<String, dynamic> _decodedUser = jsonDecode(_userInfo);
      _customers = Customers.fromMap(_decodedUser);

      _nameController.text = _customers.fullname!;
      _emailController.text = _customers.email!;
      _phoneController.text = _customers.phonenumber!;

      update();
    }

    
  }

  updateCustomerDetails (){
    _name = _nameController.text;
    _phone = _phoneController.text;
  }

  Future<void> updateCustomer () async{
    updateIsLoading(true);


    Map<String, dynamic> _update_details = {
      "fullname": _name,
      "phonenumber": _phone,
    };
    var response = await ApiServices.userUpdate(updateUserUrl, _update_details, _customers.id!);
    print("RESUPDATE:::$response");

    bool isSuccess = response!.data["success"];

    if(isSuccess){
      updateIsLoading(false);

      Map<String, dynamic> _userData = response.data["data"];

      var _encodedData = jsonEncode(_userData);
      await _flutterSecureStorage.write(key: "loggedInUser", value: _encodedData);

      Get.snackbar(
        "Success!!!", 
        "${response.data["message"]}"
      );

    }else{
      updateIsLoading(false);

      Get.snackbar(
        "Error!!!", 
        "${response.data["message"]}"
      );
    }


     update();
  }

  




  logoutAuth() async {
    await _flutterSecureStorage.delete(key: "loggedInUser");
    Get.snackbar(
      "Success!!!!", 
      "Logout Successful"
    );
    Get.offNamed(userloginscreen);
  }
  
}