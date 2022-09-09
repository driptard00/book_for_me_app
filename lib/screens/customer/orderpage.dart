import 'package:bookforme/controller/customer_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; 
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderPage extends StatelessWidget {
  OrderPage({ Key? key }) : super(key: key);

  final CustomerStateController _customerStateController = Get.find<CustomerStateController>();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          toolbarHeight: 70,
          title: const Text("Your Order", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        // body: GetBuilder<CustomerStateController>(
        //   builder: (controller) {
        //     return Container(
        //       height: double.infinity,
        //       width: double.infinity,
        //       color: Colors.white,
        //       padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        //       child: () ? (
        //         const Center(
        //           child: Text("No order found"),
        //         )
        //       ) : 
        //       (
        //         Column(
        //         children: [
        //           SizedBox(
        //             height: 500,
        //             child: ListView.separated(
        //               itemCount: controller.orderedItems.length,
        //               separatorBuilder: (context, int index){
        //                 return const SizedBox(
        //                   height: 15,
        //                   width: 15,
        //                 );
        //               },
        //               itemBuilder: ((context, index) {
        //                 return Slidable(
        //                   key: const ValueKey(0),
        //                   endActionPane: ActionPane(
        //                     motion: const ScrollMotion(), 
        //                     children: [
        //                       SlidableAction(
        //                         onPressed: ((context) {
                                  
        //                         }),
        //                         backgroundColor: Colors.red,
        //                         foregroundColor: Colors.white,
        //                         icon: Iconsax.trash,
        //                         label: 'Delete',
        //                       )
        //                     ],
        //                     dismissible: DismissiblePane(onDismissed: (() {
        //                       controller.removeOrderedData(controller.orderedItems[index]);
        //                     })),
        //                   ),
        //                   child: SizedBox(
        //                     height: 120,
        //                     child: Card(
        //                       shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(20)
        //                       ),
        //                       child: Padding(
        //                         padding: const EdgeInsets.symmetric(horizontal: 20),
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 Container(
        //                                   height: 40,
        //                                   width: 40,
        //                                   decoration: BoxDecoration(
        //                                     borderRadius: BorderRadius.circular(20),
        //                                     color: Colors.grey,
        //                                   ),
        //                                 ),
        //                                 const SizedBox(width: 20,),
        //                                 Column(
        //                                   mainAxisAlignment: MainAxisAlignment.center,
        //                                   crossAxisAlignment: CrossAxisAlignment.start,
        //                                   children: [
        //                                     Column(
        //                                       crossAxisAlignment: CrossAxisAlignment.start,
        //                                       children: [
        //                                         Text(
        //                                           controller.orderedItems[index]["name"],
        //                                           style: const TextStyle(
        //                                             fontSize: 15,
        //                                             color: Colors.black,
        //                                             fontWeight: FontWeight.bold
        //                                           ),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                     const SizedBox(height: 10,),
        //                                     Row(
        //                                       children: [
        //                                         Image.asset("img/naira.png", height: 20, width: 20,),
        //                                         Text(
        //                                           controller.orderedItems[index]["price"].toString() * controller.initialAmount,
        //                                           style: const TextStyle(
        //                                             fontSize: 20,
        //                                             color: Colors.black,
        //                                             fontWeight: FontWeight.bold
        //                                           ),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ],
        //                             ),
        //                             Column(
        //                               mainAxisAlignment: MainAxisAlignment.center,
        //                               children: [
        //                                 InkWell(
        //                                   onTap: (){
        //                                     if(controller.initialAmount > 1){
        //                                       controller.decrementAmount();
        //                                     }
        //                                   },
        //                                   child: Container(
        //                                     height: 30,
        //                                     width: 30,
        //                                     decoration: BoxDecoration(
        //                                       borderRadius: BorderRadius.circular(10),
        //                                       color: Colors.white,
        //                                       border: Border.all(
        //                                         color: Colors.black
        //                                       )
        //                                     ),
        //                                     child: const Icon(Iconsax.minus, color: Colors.black, size: 20,),
        //                                   ),
        //                                 ),
        //                                 const SizedBox(height: 5,),
        //                                 Text(
        //                                   controller.initialAmount.toString()
        //                                 ),
        //                                 const SizedBox(height: 5,),
        //                                 InkWell(
        //                                   onTap: (){
        //                                     if(controller.initialAmount >= 1){
        //                                       controller.incrementAmount();
        //                                     }
        //                                   },
        //                                   child: Container(
        //                                     height: 30,
        //                                     width: 30,
        //                                     decoration: BoxDecoration(
        //                                       borderRadius: BorderRadius.circular(10),
        //                                       color: Colors.red,
        //                                     ),
        //                                     child: const Icon(Icons.add, color: Colors.white, size: 20,),
        //                                   ),
        //                                 ),
        //                               ],
        //                             )
        //                           ],
        //                         ),
        //                       )
        //                     ),
        //                   ),
        //                 );
        //               })
        //               )
        //           ),
        //           Expanded(
        //             child: SizedBox(
        //               child: Column(
        //                 children: [
        //                   const SizedBox(height: 20,),
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       const Text("Booking services : ", style: TextStyle(fontSize: 15, fontFamily: "InterBold", color: Colors.black)),
        //                       Row(
        //                         children: [
        //                           Image.asset("img/naira.png", height: 20, width: 20,),
        //                           const Text("200", style: TextStyle(fontSize: 15, fontFamily: "InterBold", color: Colors.black, )),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(height: 50,),
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           const Text("Total :", style: TextStyle(fontFamily: "InterBold", color: Colors.black, fontSize: 20),),
        //                           Row(
        //                             crossAxisAlignment: CrossAxisAlignment.start,
        //                             children: [
        //                               Image.asset("img/naira.png", height: 30, width: 30,),
        //                             Text(
        //                               "",
        //                               style: const TextStyle(fontFamily: "InterBold", color: Colors.black, fontSize: 22),),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 50,
        //                         width: 200,
        //                         child: ElevatedButton(
        //                           onPressed: (){}, 
        //                           style: ElevatedButton.styleFrom(
        //                             primary: Colors.red,
        //                             shape: RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.circular(20),
        //                             )
        //                           ),
        //                           child: const Text("Book Now"),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             )
        //           )
        //         ],
        //       )
        //       )
        //     );
        //   }
        // ),
    );
  }
}