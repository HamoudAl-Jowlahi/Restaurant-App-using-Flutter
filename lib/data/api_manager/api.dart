// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:teriaq/core/constants.dart';
// import 'package:teriaq/data/models/awareness.dart';
// import 'package:teriaq/data/models/disease.dart';
// import 'package:teriaq/data/models/category_data.dart';
//
// import '../models/doctorDetails.dart';
// class Api{
//   static Future getData() async {
//     final url = Uri.parse('http://192.168.154.45/teriaq/read.php');
//     // var url = 'http://192.168.102.45/teriaq/read.php';
//     var response = await http.get(url);
//     var data = jsonDecode(response.body);
//     return data;
//
//   }
//   static Future<List<DoctorDetails>> getDoctorNamesData() async {
//     final url = Uri.parse('${Constants.urlName}/teriaq/read_doctors_name.php');
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => DoctorDetails.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load doctor data');
//     }
//   }
//   static Future<List<Medicine>> getMedicineData() async {
//     final url = Uri.parse('${Constants.urlName}/teriaq/read_medicine.php');
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Medicine.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load medicine data');
//     }
//   }
//   static Future<List<Medicine>> fetchMedicines() async {
//     final response = await http.get(Uri.parse('${Constants.urlName}/teriaq/read_medicine.php'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((medicine) => Medicine.fromJson(medicine)).toList();
//     } else {
//       throw Exception('Failed to load medicines'); }
//   }
//   static Future<List<Disease>> getDiseaseData() async {
//     final url = Uri.parse('${Constants.urlName}/teriaq/read_disease.php');
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Disease.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load medicine data');
//     }
//   }
//   static Future<List<Awareness>> getAwarenessData() async {
//     final url = Uri.parse('${Constants.urlName}/teriaq/read_awareness.php');
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Awareness.fromJson(json)).toList();
//       // print();
//
//     } else {
//       throw Exception('Failed to load awareness data');
//     }
//   }
//   static Future getDoctorNameData() async {
//     final url = Uri.parse('${Constants.urlName}/teriaq/read_doctors_name.php');
//     // var url = 'http://192.168.102.45/teriaq/read.php';
//     var response = await http.get(url);
//     var data = jsonDecode(response.body);
//     return data;
//
//   }
//   static Future register(String name,String email) async {
//     final url = Uri.parse('${Constants.urlName}/teriaq/register.php');
//     // var url = 'http://192.168.102.45/teriaq/read.php';
//     var body_data = {"Name":name,"Email":email};
//     var response = await http.post(url,body: body_data);
//     var data = jsonDecode(response.body);
//     if(data == "Error"){
//       Center(
//         child: Text("Error user exist",style: TextStyle(color:Colors.black,),),
//       );
//       print("-------------------------Error This user exist------------------------");
//     } else{
//       const Center(
//         child: Text("Register Sucsses",style: TextStyle(color:Colors.black,),),
//       );
//       print("-------------------------Register done------------------------");
//     }
//     return data;
//
//   }
// }