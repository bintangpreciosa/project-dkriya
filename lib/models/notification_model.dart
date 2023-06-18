// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class NotificationModel {
//   int? id;
//   String? name;
//   String? price;
//   String? imageUrl;

//   NotificationModel({
//     this.id,
//     this.name,
//     this.price,
//     this.imageUrl,
//   });

//   factory NotificationModel.createNotificationModel(
//       Map<String, dynamic> object) {
//     return NotificationModel(
//       id: object['id'],
//       name: object['name'],
//       price: object['price'],
//       imageUrl: object['imageUrl'],
//     );
//   }
//   static Future<NotificationModel> connectToAPI(String name, String price) {
//     String apiURL =
//         "https://s3-id-jkt-1.kilatstorage.id/d3si-telu/dkriya/homapage.json";

//         var apiResult = await http.post(apiURL, body:{"name": name, "price"});
//         var jsonObject = json.decode(apiResult.body);


//   }
// }
