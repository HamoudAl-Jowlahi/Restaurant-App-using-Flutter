import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../core/constants.dart';


class FavoriteController extends GetxController {
  // Use GetStorage to persist favorites
  final box = GetStorage();

  // Retrieve favorite status from storage
  bool isFavorite(int categoryId) {
    return box.read('favorite_$categoryId') ?? false;
  }

  // Save favorite status to storage and update state
  Future<void> saveFavorite(int userId, int categoryId) async {
    final response = await http.post(
      Uri.parse('${Constants.urlName}/restaurant/save_favorite.php'),
      body: {
        'user_id': userId.toString(),
        'category_id': categoryId.toString(),
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        // Update favorite status in GetStorage
        bool currentFavorite = isFavorite(categoryId);
        box.write('favorite_$categoryId', !currentFavorite);
        print('Favorite saved successfully');
      } else {
        print('Failed: ${responseData['message']}');
      }
    } else {
      print('Failed to connect to the server');
    }
  }
}


