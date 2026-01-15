import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/core/constants.dart';
import 'package:restaurant/data/models/category_data.dart';

class ApiManager{
  static Future<List<CategoryData>> fetchCategoryData() async {
    final response = await http.get(Uri.parse('${Constants.urlName}${Constants.readCategoryDataDomain}'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((medicine) => CategoryData.fromJson(medicine)).toList();
    } else {
      throw Exception('Failed to load data'); }
  }

  static Future register(String name,String email) async {
    final url = Uri.parse('${Constants.urlName}${Constants.registrationDomain}');
    var body_data = {"Name":name,"Email":email};
    var response = await http.post(url,body: body_data);
    var data = jsonDecode(response.body);
    if(data == "Error"){
      const Center(
        child: Text("Error user exist",style: TextStyle(color:Colors.black,),),
      );
      print("-------------------------Error This user exist------------------------");
    } else{
      const Center(
        child: Text("Register Sucsses",style: TextStyle(color:Colors.black,),),
      );
      print("-------------------------Register done------------------------");
    }
    return data;

  }
}