import 'package:bookforme/controller/authStateController.dart'; 
import 'package:bookforme/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({ Key? key }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthStateController>(
        builder: (controller) {
          return Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black,)
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset("img/bookformelogo.png"),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Fullname",
                              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                              prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black, size: 25,),
                              hintText: "e.g John Doe"
                            ),
                            onChanged: (value) {
                              controller.updatedName(value);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please fill in this field correctly";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                              prefixIcon: Icon(Icons.mail, color: Colors.black, size: 25,),
                              hintText: "Email"
                            ),
                            onChanged: (value) {
                              controller.updatedEmail(value);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please fill in this field correctly";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
                              prefixIcon: const Icon(Icons.lock, color: Colors.black, size: 25,),
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: (){
                                  controller.togglePassword();
                                },
                                icon: Icon(
                                  (controller.hidePassword) ? (Icons.remove_red_eye) : (Icons.visibility_off),
                                  color: Colors.black,
                                )
                              )
                            ),
                                obscureText: controller.hidePassword,
                                onChanged: (value) {
                                  controller.updatedPassword(value);
                                },                            
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Please fill in this field correctly";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration: const InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelText: "Phone number",
                                  labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                                  prefixIcon:  Icon(Icons.phone, color: Colors.black, size: 25,),
                                  hintText: "Phone number",
                                ),
                                onChanged: (value) {
                                  controller.updatedPhoneNumber(value);
                                },                            
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Please fill in this field correctly";
                                  }
                                  return null;
                                },
                              ),                              
                              const SizedBox(height: 10,),
                              DropdownButtonFormField<dynamic>(
                                decoration: const InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelText: "Role",
                                  labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                                  prefixIcon:  Icon(Icons.phone, color: Colors.black, size: 25,),
                                  hintText: "User role",
                                ),
                                onChanged: (value) {
                                  controller.updatedUserRole(value);
                                },                            
                                validator: (value){
                                  if(value == null){
                                    return "Please fill in this field correctly";
                                  }
                                  return null;
                                },
                                items: controller.userRoles.map((eachRole){
                                  return DropdownMenuItem(
                                    value: eachRole,
                                    child: Text(eachRole)
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                height: 50,
                                width: 350,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    )
                                  ),
                                  onPressed: (){
                                    (_formKey.currentState!.validate()) ?
                                    (controller.signUpUser()):
                                    (
                                      AutovalidateMode.disabled
                                    );
                                  },
                                  child: Text(
                                    (controller.isLoading) ? 
                                    ("Processing...") : 
                                    ("Sign up"), 
                                    style: const TextStyle(fontSize: 15, color: Colors.white)
                                  ),
                                ),
                              ),
                            ],
                          ),
                    )
                  ),
                  const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have account ?", style: TextStyle(fontSize: 15)),
                        TextButton(
                          onPressed: (){
                            Get.toNamed(userloginscreen);
                          },
                          child: const Text("Sign In", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                )
              )
            );
        }
      ),
      );
    }
  }