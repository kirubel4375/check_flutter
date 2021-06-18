import 'package:check_flutter/modules/customer_services/services/category/a_category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../constants.dart';

class Categories {
  // ignore: missing_return
  static Future<List<Acategory>> getCategory() async {
    final String apiUrl = kApi + '/services/category/';
    var url = Uri.parse(apiUrl);
    try {
      http.Response response = await http.get(
        url,
        headers: {
          "Authorization": 'Token $kSuperIdToken',
        },
      );
      String responseBody = response.body;
      List data = jsonDecode(responseBody);
      List<Acategory> categoryList =
          data.map((json) => Acategory.fromJson(json)).toList();
      return categoryList;
    } catch(e){
      
    }
  }
}
