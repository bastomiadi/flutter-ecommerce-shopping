import 'package:flutter_ecommerce/models/category_model.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:flutter_ecommerce/models/trending_product_model.dart';

List<TrendingProductModel> getTrendingProducts() {
  List<TrendingProductModel> trendingProducts = [
    TrendingProductModel(
        storename: "Store Name",
        productName: "Product",
        noOfRating: 1,
        rating: 4,
        priceInDollars: 75,
        imgUrl: ""),
    TrendingProductModel(
        storename: "Store Name",
        productName: "Product",
        noOfRating: 3,
        rating: 4,
        priceInDollars: 30,
        imgUrl: ""),
    TrendingProductModel(
        storename: "Store Name",
        productName: "Product",
        noOfRating: 3,
        rating: 4,
        priceInDollars: 30,
        imgUrl: ""),
    TrendingProductModel(
        storename: "Store Name",
        productName: "Product",
        noOfRating: 301,
        rating: 4,
        priceInDollars: 30,
        imgUrl: ""),
  ];

  return trendingProducts;
}

List<ProductModel> getProducts() {
  List<ProductModel> products = [
    ProductModel(
        productName: "",
        noOfRating: 4,
        imgUrl: "",
        rating: 4,
        priceInDollars: 20),
    ProductModel(
        productName: "",
        noOfRating: 4,
        imgUrl: "",
        rating: 4,
        priceInDollars: 20),
    ProductModel(
        productName: "",
        noOfRating: 4,
        imgUrl: "",
        rating: 4,
        priceInDollars: 20),
    ProductModel(
        productName: "",
        noOfRating: 4,
        imgUrl: "",
        rating: 4,
        priceInDollars: 20),
    ProductModel(
        productName: "",
        noOfRating: 4,
        imgUrl: "",
        rating: 4,
        priceInDollars: 20),
  ];
  return products;
}

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [
    CategoryModel(
        categorieName: "Regular Gift",
        color1: "0xff8EA2FF",
        color2: "0xff557AC7",
        imgAssetPath: "assets/categorie.png"),
    CategoryModel(
        categorieName: "Box Gift",
        color1: "0xff50F9B4",
        color2: "0xff38CAE9",
        imgAssetPath: "assets/boxgift.png"),
    CategoryModel(
        categorieName: "Chocolate",
        color1: "0xffFFB397",
        color2: "0xffF46AA0",
        imgAssetPath: "assets/choclate.png"),
    CategoryModel(
        categorieName: "Gift with card",
        color1: "0xff8EA2FF",
        color2: "0xff557AC7",
        imgAssetPath: "assets/categorie.png"),
    CategoryModel(
        categorieName: "Regular Gift",
        color1: "0xff8EA2FF",
        color2: "0xff557AC7",
        imgAssetPath: "assets/categorie.png")
  ];
  return categories;
}
