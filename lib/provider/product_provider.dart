import 'dart:convert';
import 'package:authentication_app/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../constants/app_url.dart';


class ProductProvider extends ChangeNotifier{

  List<productModel>? _productData;
  List<productModel>? get productData => _productData;
  bool dataLoading = false;

  Future <void> fetchProductData() async {

    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NjZlNDM1YzM5NWRkMjU2ZWFkMmI1ZCIsImlhdCI6MTcwMTk1MDMzMSwiZXhwIjoxNzA0NTQyMzMxfQ.IaYreti55-nZSrRgML-csR44L-87kdped3n3ohmp3Lo99";
    print("fetchProductData");
    final response = await http.get(Uri.parse(productUrl),
    headers: {"Authorization":"Bearer $token"});

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      _productData = body.map((item) => productModel.fromJson(item)).toList();
      print('productData data $_productData');
      notifyListeners();
    }else{
      print('Faild to loaded data');
      notifyListeners();
    }
  }
}
