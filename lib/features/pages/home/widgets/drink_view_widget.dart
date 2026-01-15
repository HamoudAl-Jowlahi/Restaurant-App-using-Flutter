import 'package:flutter/material.dart';

class DrinksWidget extends StatelessWidget {
  final String name;
  final String image;
  final String? price;

  DrinksWidget({required this.name, required this.image, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 5,right: 5,top: 2),
      margin: const EdgeInsets.only(left:5),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(image,width: 50,height: 50,),
          ),
          Text(name),
        ],
      ),
    );
  }
}
