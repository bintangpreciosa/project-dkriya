import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          'https://s3-id-jkt-1.kilatstorage.id/d3si-telu/dkriya/homapage.json'));

      if (response.statusCode == 200) {
        _products = productFromJson(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
