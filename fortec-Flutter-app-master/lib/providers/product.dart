import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../helper/product.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];

  List<ProductModel> mostSoldCategory = [];
  List<ProductModel> offersCategory = [];

  List<ProductModel> tvCategory = [];
  List<ProductModel> sataliteCategory = [];
  List<ProductModel> accessoriesCategory = [];
  List<ProductModel> securityCategory = [];
  List<ProductModel> electricCategory = [];
  List<ProductModel> networkCategory = [];
  List<ProductModel> soundCategory = [];
  List<ProductModel> otherCategory = [];
  

  ProductProvider.initialize() {
    loadProducts();
    
    loadMostSoldCategory(categoryName: 'mostSold');
    loadOfferCategory(categoryName: 'offers');
    loadTvCategory(categoryName: 'tv');
    loadsataliteCategory(categoryName: 'satalite');
    loadsecurityCategory(categoryName: 'security');
    loadelectricCategory(categoryName: 'electric');
    loadnetworkCategory(categoryName: 'network');
    loadsoundCategory(categoryName : 'sound');
    loadotherCategory(categoryName: 'other');  
    loadaccessoriesCategory(categoryName: 'accessories');  
  }

  // All Products

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  // Tv Category

  Future loadTvCategory({String categoryName}) async {
    tvCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Grains Category

  Future loadsataliteCategory({String categoryName}) async {
    sataliteCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // DietFood Category

  Future loadsecurityCategory({String categoryName}) async {
    securityCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Spirulina Category

  Future loadelectricCategory({String categoryName}) async {
    electricCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Oil Category

  Future loadnetworkCategory({String categoryName}) async {
    networkCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // Special Food

   Future loadsoundCategory({String categoryName}) async {
    soundCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  // herbs

   Future loadotherCategory({String categoryName}) async {
    otherCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

   Future loadaccessoriesCategory({String categoryName}) async {
    accessoriesCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

   Future loadMostSoldCategory({String categoryName}) async {
    mostSoldCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

   Future loadOfferCategory({String categoryName}) async {
    offersCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }


  // Search

  Future search({String productName}) async {
    productsSearched =
        await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
