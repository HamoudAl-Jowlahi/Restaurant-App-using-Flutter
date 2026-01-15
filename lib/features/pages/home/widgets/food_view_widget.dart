import 'package:flutter/material.dart';

import '../../../../core/config/page_routes_name.dart';
import '../../../../core/constants.dart';
import '../../../../data/controller/favorite_controller.dart';
import '../../../../data/models/category_data.dart';
/*class FoodWidget extends StatelessWidget {
  final CategoryData data;

  FoodWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, PageRoutesName.categoryDetails,arguments: data,);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          leading: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: data.image != null && data.image!.isNotEmpty
                    ? Image.network("${Constants.urlName}${Constants.readCategoryDataDomain}${data.image}", fit: BoxFit.cover)
                    : Image.asset('assets/images/example.png'),

              ),
               Positioned(
                top: 1,
                left: -2,
                child: InkWell(
                  onTap: (){},
                    child: const Icon(Icons.favorite_border,color: Colors.red,size: 18,)),
              )
            ],

          ),
          title: Text(data.name.toString()),
          subtitle:  data.price != null ? Text(data.price.toString()) : null,
           trailing: InkWell( onTap: (){},
               child: const Icon(Icons.add_box_outlined))
        ),
      ),
    );
  }
}
*/
//before getx
// class FoodWidget extends StatelessWidget {
//   final CategoryData data;
//
//   FoodWidget({required this.data});
//
//   Future<void> _saveFavorite(int userId, int categoryId) async {
//     final response = await http.post(
//       Uri.parse('${Constants.urlName}/restaurant/save_favorite.php'),
//       body: {
//         'user_id': userId.toString(), // Example: User ID
//         'category_id': categoryId.toString(), // Category ID
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       if (responseData['status'] == 'success') {
//         print('Favorite saved successfully');
//       } else {
//         print('Failed: ${responseData['message']}');
//       }
//     } else {
//       print('Failed to connect to the server');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           PageRoutesName.categoryDetails,
//           arguments: data,
//         );
//       },
//       child: Card(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//         child: ListTile(
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(25),
//             child: data.image != null && data.image!.isNotEmpty
//                 ? Image.network(
//               "${Constants.urlName}${Constants.readCategoryDataDomain}${data.image}",
//               fit: BoxFit.cover,
//             )
//                 : Image.asset('assets/images/example.png'),
//           ),
//           title: Text(data.name.toString()),
//           subtitle: data.price != null ? Text(data.price.toString()) : null,
//           trailing: InkWell(
//             onTap: () async {
//               // Replace 1 with the actual user ID
//               await _saveFavorite(1, data.id!);
//             },
//             child: const Icon(
//               Icons.favorite_border,
//               color: Colors.red,
//               size: 30,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:get/get.dart';

class FoodWidget extends StatelessWidget {
  final CategoryData data;

  FoodWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());

    // Check if the current category is a favorite (load from GetStorage)
    bool isFav = favoriteController.isFavorite(data.id!);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          PageRoutesName.categoryDetails,
          arguments: data,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: data.image != null && data.image!.isNotEmpty
                ? Image.network(
              "${Constants.urlName}${Constants.readCategoryDataDomain}${data.image}",
              fit: BoxFit.cover,
            )
                : Image.asset('assets/images/example.png'),
          ),
          title: Text(data.name.toString()),
          subtitle: data.price != null ? Text(data.price.toString()) : null,
          trailing: InkWell(
            onTap: () async {
              // Replace 1 with the actual user ID
              await favoriteController.saveFavorite(1, data.id!);
            },
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}


