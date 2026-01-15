import 'package:flutter/material.dart';
import 'package:restaurant/data/models/category_data.dart';

import '../../../../core/constants.dart';

class CategoryDataDetails extends StatelessWidget {
  const CategoryDataDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryData = ModalRoute.of(context)!.settings.arguments as CategoryData;
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Color(0xff282A28),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: categoryData.image != null && categoryData.image!.isNotEmpty
                    ? Image.network("${Constants.urlName}${Constants.readCategoryDataDomain}${categoryData.image}", width:60,height: 60, fit: BoxFit.cover)
                    : Image.asset('assets/images/example.png'),

              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 10),
              padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
              height: 120,
              width: 300,
              color: Colors.black12,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text("${categoryData.name}"),
                    // Text('<${categoryData.originalTitle}>'),
                    const Divider(
                      color: Colors.white54,
                    ),
                    Row(
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Text('Description: '),
                            Text(
                              ' -> ${categoryData.description} ',
                              style: theme.textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Text('Price: '),
                            Text(
                              ' -> ${categoryData.price}',
                              style: theme.textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

