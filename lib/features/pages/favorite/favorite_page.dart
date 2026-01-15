import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Future<List<dynamic>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = _fetchFavorites(1); // Replace with dynamic user ID
  }

  /// Fetch favorites from the server
  // Future<List<dynamic>> _fetchFavorites(int userId) async {
  //   final url = '${Constants.urlName}/restaurant/get_favorites.php?user_id=$userId';
  //   final response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     if (data['status'] == 'success') {
  //       return data['favorites'];
  //     } else {
  //       throw Exception(data['message']);
  //     }
  //   } else {
  //     throw Exception('Failed to connect to server');
  //   }
  // }



// Delete favorite by using the 'id' instead of user_id and category_id
//   Future<void> _deleteFavorite(int favoriteId) async {
//     final url = '${Constants.urlName}/restaurant/delete_favorite.php';
//     final response = await http.post(
//       Uri.parse(url),
//       body: {
//         'favorite_id': favoriteId.toString(), // Sending 'favorite_id' instead of 'user_id' and 'category_id'
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       if (responseData['status'] == 'success') {
//         print('Favorite deleted successfully');
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else {
//       throw Exception('Failed to connect to server');
//     }
//   }
  Future<List<dynamic>> _fetchFavorites(int userId) async {
    final url = '${Constants.urlName}/restaurant/get_favorites.php?user_id=$userId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        return data['favorites'];
      } else {
        throw Exception(data['message']);
      }
    } else {
      throw Exception('Failed to connect to server');
    }
  }

  ///
  // Future<void> _deleteFavorite(int favoriteId) async {
  //   final url = '${Constants.urlName}/restaurant/delete_favorite.php';
  //   final response = await http.post(
  //     Uri.parse(url),
  //     body: {
  //       'fav_id': favoriteId.toString(), // Sending 'favorite_id'
  //     },
  //   );
  //
  //   print('Server Response: ${response.body}');  // Log the raw server response
  //
  //   if (response.statusCode == 200) {
  //     try {
  //       final responseData = json.decode(response.body);
  //       if (responseData['status'] == 'success') {
  //         print('Favorite deleted successfully');
  //       } else {
  //         throw Exception(responseData['message']);
  //       }
  //     } catch (e) {
  //       print('Failed to parse response: ${e.toString()}');
  //       throw Exception('Failed to parse response: ${e.toString()}');
  //     }
  //   } else {
  //     print('Failed to connect to server');
  //     throw Exception('Failed to connect to server');
  //   }
  // }
  Future<void> _deleteFavorite(int favoriteId) async {
    final url = '${Constants.urlName}/restaurant/delete_favorite.php';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'category_id': favoriteId.toString(),
      },
    );

    print('Server Response: ${response.body}');  // Log the raw server response

    if (response.statusCode == 200) {
      try {
        final responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          print('Favorite deleted successfully');
        } else {
          throw Exception(responseData['message']);
        }
      } catch (e) {
        print('Failed to parse response: ${e.toString()}');
        throw Exception('Failed to parse response: ${e.toString()}');
      }
    } else {
      print('Failed to connect to server');
      throw Exception('Failed to connect to server');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _favoritesFuture, // Use the stored future for fetching favorites
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No favorites found.'));
          } else {
            final favorites = snapshot.data!;

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                // Check if price is null or not available
                final price = favorite['price'] ?? 'N/A'; // Default to 'N/A' if null

                return ListTile(
                  title: Text(favorite['name']),
                  subtitle: Text(price.toString()), // Ensure price is always displayed as a string
                  leading: const Icon(Icons.image_not_supported), // Placeholder for image
                  trailing:
                  IconButton(
                    icon: const Icon(Icons.delete_forever_outlined, color: Colors.red),
                    onPressed: () async {
                      try {
                        // Capture the favorite 'id' (which is likely the unique identifier)
                        final favoriteId = favorite['category_id'];
                        print('Deleting Favorite -> Favorite ID: $favoriteId');
                        print('Favorite Data: $favorite');
// Using 'id' here
                        if (favoriteId == null) {
                          throw Exception('Favorite ID is missing');
                        }



                        // Proceed with deletion using favorite ID
                        await _deleteFavorite(favoriteId);

                        setState(() {
                          // Remove the item from the list and refresh UI
                            _favoritesFuture = _fetchFavorites(1); // Re-fetch the list after deletion

                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Favorite deleted successfully')),
                        );
                      } catch (e) {
                        print('Error: ${e.toString()}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Errorr: ${e.toString()}')),
                        );
                      }
                    },
                      ///
                      // onPressed: () async {
                      //   try {
                      //     final favoriteId = favorite['fav_id']; // Assuming the 'id' is returned by the backend
                      //     if (favoriteId == null) {
                      //       throw Exception('Favorite ID is missing');
                      //     }
                      //
                      //     print('Deleting Favorite -> Favorite ID: $favoriteId');
                      //
                      //     // Proceed with deletion
                      //     await _deleteFavorite(favoriteId);
                      //
                      //     setState(() {
                      //       // Remove the item from the list and refresh UI
                      //       favorites.removeAt(index);
                      //     });
                      //
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('Favorite deleted successfully')),
                      //     );
                      //   } catch (e) {
                      //     print('Error: ${e.toString()}');
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('Error: ${e.toString()}')),
                      //     );
                      //   }
                      // }

                  )

                  // IconButton(
                  //   icon: const Icon(Icons.delete_forever_outlined, color: Colors.red),
                  //   onPressed: () async {
                  //     try {
                  //       // Debug: Check the entire favorite object
                  //       print('Favorite: $favorite');
                  //
                  //       // Capture category_id and user_id from favorite
                  //       final categoryId = favorite['category_id'];
                  //       final userId = favorite['user_id'];
                  //
                  //       // Debug: Print the captured ids
                  //       print('Captured User ID: $userId, Category ID: $categoryId');
                  //
                  //       // Check if the ids are null
                  //       if (categoryId == null || userId == null) {
                  //         throw Exception('User ID or Category ID is missing');
                  //       }
                  //
                  //       // Proceed with the delete
                  //       await _deleteFavorite(userId, categoryId);
                  //
                  //       // Update UI by removing the favorite item
                  //       setState(() {
                  //         favorites.removeAt(index);
                  //       });
                  //
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text('Favorite deleted successfully')),
                  //       );
                  //     } catch (e) {
                  //       print('Error: ${e.toString()}');
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text('Error: ${e.toString()}')),
                  //       );
                  //     }
                  //   },
                  // )




                );
              },
            );
          }
        },
      ),
    );
  }
}


