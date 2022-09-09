import 'package:bookforme/controller/customer_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/app_route_names.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final CustomerStateController _customerStateController = Get.put(CustomerStateController());
  
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      print("HEY BEFORE BINDING");
      _customerStateController.getCustomersDetails();
      print("HEY AFTER BINDING");
    }));

    return Scaffold(
      body: GetBuilder<CustomerStateController>(
        builder: (controller) {
          return (!controller.isLoading) 
          ? (
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Welcome Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,  fontFamily: "InterBold"),),
                        InkWell(
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: (controller.customers.picture != null) 
                            ? NetworkImage(controller.customers.picture!)
                            : const AssetImage("img/profileavatar.png") as ImageProvider
                          ),
                          onTap: (){
                            Get.toNamed(profilescreen);
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const SizedBox(
                      width: 300,
                      child:Text("Where would you like to book food from today", style: TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none
                                ),
                                prefixIcon: Icon(Iconsax.search_normal_1, color: Colors.grey,),
                                hintText: "Search for restaurants.....",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                                ),
                              // child: Center(
                              //   child: ListTile(
                              //     leading: Container(
                              //       height: 40,
                              //       width: 40,
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(20),
                              //         color: Colors.white,
                              //       image: DecorationImage(
                              //         image: AssetImage(""), fit: BoxFit.cover
                              //       )
                              //       ),
                              //     ),
                              //     title: Text(controller.restaurantData[index]["name"], style: const TextStyle(fontSize: 15, fontFamily: "InterBold",color: Colors.black),),
                              //     subtitle: Text(controller.restaurantData[index]["specials"], style: const TextStyle(fontSize: 12,color: Colors.black),),
                              //     onTap: (){
                              //       Get.toNamed(mealscreen, arguments: {
                              //         "restaurantDetails": controller.restaurantData[index]
                              //       });
                              //     },
                              //   ),
                              // ),
                            ),
                          );
                        }
                        ),
                      ),
                    )
                  ],
                ),
              )
              ) 
          : (
              const Center(
              child: (
                CircularProgressIndicator()
              ),
            )
          );
        }
      ),
    );

  }
}