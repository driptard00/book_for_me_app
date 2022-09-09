import 'package:bookforme/controller/customer_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({ Key? key }) : super(key: key);

  final CustomerStateController _customerStateController = Get.put(CustomerStateController());

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _customerStateController.updateCustomerDetails();
    },);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: const Icon(Iconsax.arrow_left)
          ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight:100,
        title: const Text("My Profile", style: TextStyle(color: Colors.white, fontFamily: "InterBold"),),
        centerTitle: true,
      ),
      body: GetBuilder<CustomerStateController>(
        builder: (controller){
          return (!controller.isLoading) ?
          (
            Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    color: Colors.red,
                  )
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 100, ),
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      color: Colors.white
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              controller.toggleNameField();
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: 70,
                                child: Center(
                                  child: TextFormField(
                                    controller: controller.nameController,
                                    enabled: controller.enableNameField,
                                    decoration: const InputDecoration(
                                      labelText: "Fullname",
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      prefixIcon: Icon(Iconsax.profile_circle5, size: 30,),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 70,
                              child: Center(
                                child: TextFormField(
                                  controller: controller.emailController,
                                  enabled: false,
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    prefixIcon: Icon(Icons.mail_outline_rounded ,size: 30,),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              controller.togglePhoneField();
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: 70,
                                child: Center(
                                  child: TextFormField(
                                    controller: controller.phoneController,
                                    enabled: controller.enablePhoneField,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      labelText: "Phone Number",
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      prefixIcon: Icon(Iconsax.call, size: 30,),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 200,),
                          SizedBox(
                            height: 50,
                            width: 340,
                            child: ElevatedButton(
                              onPressed: (){
                                controller.updateCustomer();
                              }, 
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                              ),
                              child: const Text("Save"),
                              ),
                          )
                        ],
                        )
                      ),
                  ),
                  ),
                  Positioned(
                    bottom: 630,
                    right: 155,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: (controller.customers.picture != null) 
                            ? NetworkImage(controller.customers.picture!)
                            : const AssetImage("img/profileavatar.png") as ImageProvider
                          )
                      ),
                    )
                    )
              ],
            ),
          )
          ) :
          (
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.black.withOpacity(0),
              child: const Center(
                child: CircularProgressIndicator()
              ),
            )
          );
        }
      )
    );

  }
}