import 'package:bookforme/controller/authStateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_route_names.dart';

class SignIn extends StatelessWidget {
  SignIn({ Key? key }) : super(key: key);

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
                      Navigator.pop(context);
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
                  const SizedBox(height: 80,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                              prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black, size: 25,),
                              hintText: "e.g example@mail.com"
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
                          Row(
                            children: [
                              TextButton(
                                onPressed: (){},
                                child: const Text("Forgot Password ?", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),)
                                ),
                            ],
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
                                (controller.loginUser()):
                                (
                                  AutovalidateMode.disabled
                                );
                              },
                              child: Text(
                                (controller.isLoading) ? 
                                ("Processing...") : 
                                ("Sign in"), 
                                style: const TextStyle(fontSize: 15, color: Colors.white)
                              ),
                            ),
                          ),
                         ],
                        ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account ?", style: TextStyle(fontSize: 15)),
                      TextButton(
                        onPressed: (){
                          Get.toNamed(usersignup);
                        },
                        child: const Text("Sign Up", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),)
                        ),
                     ],
                   ),
                ],
              ),
            )
          );
        }
      )
    );
  }
}