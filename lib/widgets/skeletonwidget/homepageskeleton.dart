import 'package:flutter/material.dart';

class HomePageSkelton extends StatelessWidget {
  const HomePageSkelton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.shade200,
              )
            ],
          ),
          const SizedBox(height: 30,),
          Container(
            height: 10,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 10,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30)
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30)
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30)
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ],
      ),
    );
  }
}
