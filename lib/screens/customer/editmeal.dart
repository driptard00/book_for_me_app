import 'package:bookforme/controller/customer_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class EditMeal extends StatelessWidget {
  EditMeal({ Key? key }) : super(key: key);

  final CustomerStateController _customerStateController = Get.find<CustomerStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          elevation: 0,
          title: const Text("Details", style: TextStyle(fontWeight:FontWeight.bold, color: Colors.black)),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left, color: Colors.black,)
          ),
          ),
      body: GetBuilder<CustomerStateController>(
        builder: (controller) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 650,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Container(
                          height: 350,
                          width: 350,
                          decoration: BoxDecoration(
                            // image: const DecorationImage(
                            //   image: AssetImage("img/ricechicken.jfif"),
                            //   fit: BoxFit.cover
                            //   ),
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("", style: const TextStyle(fontFamily: "InterBold", color: Colors.black, fontSize: 20),),
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.yellow,),
                                Text("4.4", style: TextStyle(fontFamily: "InterBold", color: Colors.black),),              
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Text("Status :", style: TextStyle(fontFamily: "InterBold", color: Colors.black),),
                            SizedBox(width: 5,),
                            Icon(Icons.circle, color: Colors.green,),
                            Text("Available", style: TextStyle(fontFamily: "InterBold", color: Colors.black),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Text("Description", style: TextStyle(fontFamily: "InterBold", color: Colors.black),),       
                          ],
                        ),
                        const SizedBox(height: 5,),
                        ReadMoreText(
                          "",
                          trimLines: 3,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
                          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,  color: Colors.red),
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ]
                      ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("img/naira.png", height: 30, width: 30,),
                        Text("", style: const TextStyle(fontFamily: "InterBold", color: Colors.black, fontSize: 22),),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: (){
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: "Added to order",
                              message: "Meal successfully added to order!!!",
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            )
                          );
                        }, 
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                        child: const Text("Add to order"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}