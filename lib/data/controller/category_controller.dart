import 'package:get/get.dart';
import 'package:restaurant/data/api_manager/api_manager.dart';
import 'package:restaurant/data/models/category_data.dart';

class CategoryController extends GetxController {
  var categoryData = <CategoryData>[].obs; // Observable list for category data
  var isLoading = true.obs;  // Observable loading state
  var errorMessage = ''.obs; // Observable error message

  // Fetch category data from API
  Future<void> fetchCategoryData() async {
    try {
      isLoading(true); // Set loading to true
      final data = await ApiManager.fetchCategoryData();
      if (data.isNotEmpty) {
        categoryData.assignAll(data); // Update the list with fetched data
      } else {
        errorMessage('No data available');
      }
    } catch (e) {
      errorMessage('Error loading data: $e');
    } finally {
      isLoading(false); // Set loading to false
    }
  }
}
