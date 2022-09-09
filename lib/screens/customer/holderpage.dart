import 'package:bookforme/controller/customer_state_controller.dart';
import 'package:bookforme/routes/app_route_names.dart';
import 'package:bookforme/screens/customer/homepage.dart';
import 'package:bookforme/screens/customer/orderpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HolderPage extends StatelessWidget {
  HolderPage({Key? key }) : super(key: key);

  final List<Widget> _screens = [
    HomePage(),
    OrderPage()
  ];
  
  final CustomerStateController _customerStateController = Get.put(CustomerStateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerStateController>(
      builder: (controller) {
        return Scaffold(
          body: (controller.selectedScreenIndex == 0)
            ? _screens[0]
            : _screens[1],

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              elevation: 10,
              child: Container(
                height: 70,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: (){
                        controller.updatedScreenItem(0);   
                      }, 
                      child: Icon(
                        Iconsax.home,
                        color: (controller.selectedScreenIndex == 0)
                        ?(Colors.red)
                        :(Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        controller.updatedScreenItem(1);
                      }, 
                      child: (controller.orderedItems.isEmpty) ? (
                        Icon(
                          Iconsax.shopping_cart,
                          color: (controller.selectedScreenIndex == 1)?(Colors.red):(Colors.black),
                        )
                      ) : 
                      (
                        Stack(
                        children: [
                          Icon(
                            Iconsax.shopping_cart,
                            color: (controller.selectedScreenIndex == 1)?(Colors.red):(Colors.black),
                          ),
                          Container(
                            child: Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                height: 15,
                                width: 15,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text(
                                  controller.orderedItems.length.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      )
                    ),
                    TextButton(
                      onPressed: (){
                        showCupertinoModalPopup(
                          context: context, 
                          builder: (context) => Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 80),
                            child: SizedBox(
                              height: 300,
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                child: ListView(
                                  children:[
                                    ListTile(
                                      leading: const Icon(Iconsax.user, color: Colors.black,),
                                      title: const Text("Profile", style: TextStyle(fontSize: 15),),
                                      onTap: (){
                                        Get.toNamed(profilescreen);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Iconsax.notification, color: Colors.black,),
                                      title: const Text("Notifications", style: TextStyle(fontSize: 15),),
                                      onTap: (){
                                        Get.toNamed(notificationscreen);
                                      },
                                    ),
                                    ListTile( 
                                      leading: const Icon(Iconsax.setting, color: Colors.black,),
                                      title: const Text("Settings", style: TextStyle(fontSize: 15),),
                                      onTap: (){},
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    ListTile(
                                      leading: const Icon(Iconsax.logout, color: Colors.black,),
                                      title: const Text("Logout", style: TextStyle(fontSize: 15),),
                                      onTap: (){
                                        controller.logoutAuth();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        );
                      }, 
                      child: const Icon(
                        Iconsax.more_2,
                        color:Colors.black,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            ),
          );
      }
    );
  }

}