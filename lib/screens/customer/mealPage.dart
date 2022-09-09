import 'package:bookforme/controller/customer_state_controller.dart';
import 'package:bookforme/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MealPage extends StatelessWidget {
  MealPage({ Key? key }) : super(key: key);

  final CustomerStateController _customerStateController = Get.find<CustomerStateController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left, color: Colors.black,)
          ),
          title: const Text("Meals", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
        // body: GetBuilder<CustomerStateController>(
        //   builder: (controller) {
        //     return Container(
        //       height: double.infinity,
        //       width: double.infinity,
        //       color: Colors.white,
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const SizedBox(height: 10,),
        //           const SizedBox(
        //             width: 300,
        //             child:Text("What would you like to book today", style: TextStyle(fontSize: 15, color: Colors.black)),
        //             ),
        //           const SizedBox(height: 20,),
        //           SizedBox(
        //             height: 80,
        //             child: Card(
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(20)
        //                 ),
        //                 elevation: 4,
        //               child: Center(
        //                 child: ListTile(
        //                   horizontalTitleGap: 55,
        //                     leading: Container(
        //                       height: 40,
        //                       width: 40,
        //                       decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(20),
        //                         color: Colors.white,
        //                       image: DecorationImage(
        //                         image: AssetImage(meals["logo"]), fit: BoxFit.cover
        //                       )
        //                       ),
        //                     ),
        //                     title: Text(meals["name"], style: const TextStyle(fontSize: 18, fontFamily: "InterBold",color: Colors.black)),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           const SizedBox(height: 20,),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Container(
        //                 width: 350,
        //                 decoration: BoxDecoration(
        //                   color: Colors.grey[100],
        //                   borderRadius: BorderRadius.circular(10)
        //                 ),
        //                 child: TabBar(
        //                   labelColor: Colors.white,
        //                   unselectedLabelColor: Colors.black,
        //                   indicator: BoxDecoration(
        //                     color: Colors.red,
        //                     borderRadius: BorderRadius.circular(10)
        //                   ),
        //                   tabs: const [
        //                     Tab(text: "Meal",),
        //                     Tab(text: "Drinks",)
        //                   ]
        //                   ),
        //               ),
        //             ],
        //           ),
        //           const SizedBox(height: 20,),
        //             Expanded(
        //                 child: TabBarView(
        //                   children: [
        //                     Container(
        //                       child: ListView.builder(
        //                         itemCount: meals["availableMeals"].length,
        //                         itemBuilder: (context, index) {
        //                       return SizedBox(
        //                         height: 100,
        //                         child: Card(
        //                           shape: RoundedRectangleBorder(
        //                             borderRadius: BorderRadius.circular(20)
        //                             ),
        //                           child: Center(
        //                             child: ListTile(
        //                               leading: Container(
        //                                 height: 40,
        //                                 width: 40,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius: BorderRadius.circular(20),
        //                                   color: Colors.grey
        //                                 ),
        //                               ),
        //                               title: Text(meals["availableMeals"][index]["name"], style: const TextStyle(fontSize: 15, fontFamily: "InterBold",color: Colors.black),),
        //                               subtitle: Row(
        //                                 children: [
        //                                   Image.asset("img/naira.png", height: 15, width: 15,),
        //                                   Text(meals["availableMeals"][index]["price"].toString(), style: const TextStyle(fontSize: 12,color: Colors.black),),
        //                                 ],
        //                               ),
        //                               onTap: (){
        //                                 Get.toNamed(detailscreen , arguments: {
        //                                   "mealDetails": meals["availableMeals"][index]
        //                                 });
        //                               },
        //                             ),
        //                           ),
        //                         ),
        //                       );
        //                         }
        //                         ),
        //                     ),
        //                     Container(
        //                       child: ListView.builder(
        //                         itemCount: meals["availableDrinks"].length,
        //                         itemBuilder: (context, index) {
        //                       return SizedBox(
        //                         height: 100,
        //                         child: Card(
        //                           shape: RoundedRectangleBorder(
        //                             borderRadius: BorderRadius.circular(20)
        //                             ),
        //                           child: Center(
        //                             child: ListTile(
        //                               leading: Container(
        //                                 height: 40,
        //                                 width: 40,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius: BorderRadius.circular(20),
        //                                   color: Colors.grey
        //                                 ),
        //                               ),
        //                               title: Text(meals["availableDrinks"][index]["name"], style: const TextStyle(fontSize: 15, fontFamily: "InterBold",color: Colors.black),),
        //                               subtitle: Row(
        //                                 children: [
        //                                   Image.asset("img/naira.png", height: 15, width: 15,),
        //                                   Text(meals["availableDrinks"][index]["price"], style: const TextStyle(fontSize: 12,color: Colors.black),),
        //                                 ],
        //                               ),
        //                               onTap: (){
        //                                 Get.toNamed(detailscreen , arguments: {
        //                                   "mealDetails": meals["availableDrinks"][index]
        //                                 });
        //                               },
        //                             ),
        //                           ),
        //                         ),
        //                       );
        //                         }
        //                         ),
        //                     ),
        //                   ]
        //                   ),
        //                 )
        //         ],
        //       ),
        //     );
        //   }
        // ),
      ),
    );
  }
}