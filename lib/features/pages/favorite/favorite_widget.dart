import 'package:flutter/material.dart';

class FavoriteViewWidget extends StatelessWidget {
  final String name;
  final String image;
  final String? price;
  const FavoriteViewWidget({super.key,required this.name, required this.image, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
          leading: Stack(
            children: [
              Image.asset(image),
              Positioned(
                top: 1,
                left: -2,
                child: InkWell(
                    onTap: (){},
                    child: const Icon(Icons.favorite_border,color: Colors.red,size: 18,)),
              )
            ],

          ),
          title: Text(name),
          subtitle:  price != null ? Text(price!) : null,
          trailing: InkWell( onTap: (){},
              child: const Icon(Icons.add_box_outlined))
      ),
    );
  }
}




