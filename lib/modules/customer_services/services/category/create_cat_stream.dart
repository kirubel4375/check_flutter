
import 'package:check_flutter/modules/customer_services/services/category/a_category.dart';
import 'package:check_flutter/modules/customer_services/services/category/get_category.dart';

class CategoryManager{

  // Stream<List<Acategory>> get getcategories async* {
  //   Stream.fromFuture(Categories.getCategory());
  // }

  Future<List<Acategory>> get futureCategory async{
   final value =  await Categories.getCategory();
   return value;
  }

}

CategoryManager categoryManager = CategoryManager();


