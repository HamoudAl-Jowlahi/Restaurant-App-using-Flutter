import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../data/controller/category_controller.dart';
import 'widgets/food_view_widget.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final CategoryController categoryController = Get.put(CategoryController());

    // Fetch the category data
    categoryController.fetchCategoryData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Food"),
        const SizedBox(height: 5),
        Expanded(
          child: Obx(() {
            if (categoryController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (categoryController.errorMessage.isNotEmpty) {
              return Center(child: Text(categoryController.errorMessage.value));
            }

            final categoryData = categoryController.categoryData;

            return ListView.builder(
              itemCount: categoryData.length,
              itemBuilder: (context, index) {
                return FoodWidget(data: categoryData[index]);
              },
            );
          }),
        ),
      ],
    );
  }

}
class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
//before getX
// class HomePageView extends StatelessWidget {
//   const HomePageView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SectionTitle(title: "Food"),
//         const SizedBox(height: 5,),
//         Expanded(
//           child: FutureBuilder<List<CategoryData>>(
//             future: ApiManager.fetchCategoryData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 print(snapshot.error);
//                 return const Center(child: Text('Error loading data'));
//               }
//
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return const Center(child: Text('No data available'));
//               }
//
//               final categoryData = snapshot.data!;
//
//               return ListView.builder(
//                 itemCount: categoryData.length,
//                 itemBuilder: (context, index) {
//                   return FoodWidget(data: categoryData[index]);
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//     //   Column(
//     //   children: [
//     //     // const Text("data"),
//     //     // Row(
//     //     //     children: [
//     //     //       Column(
//     //     //         children: [
//     //     //           ClipRRect(
//     //     //             borderRadius: BorderRadius.circular(50),
//     //     //             child: Icon(Icons.account_circle_rounded),
//     //     //           ),
//     //     //           Text("juice"),
//     //     //         ],
//     //     //       ),
//     //     //       Column(
//     //     //         children: [
//     //     //           ClipRRect(
//     //     //             borderRadius: BorderRadius.circular(50),
//     //     //             child: Icon(Icons.account_circle_rounded),
//     //     //           ),
//     //     //           Text("juice"),
//     //     //         ],
//     //     //       ),
//     //     //     ],
//     //     //   ),
//     //
//     //   ],
//     // );
//   }
// }
//
// class SectionTitle extends StatelessWidget {
//   final String title;
//
//   SectionTitle({required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
