
import 'package:flutter_shopping_app/models/trending_product_model.dart';
import 'package:flutter_shopping_app/models/product_model.dart';
import 'package:flutter_shopping_app/models/category_model.dart';


List<TrendingProductModel> getTrendingProducts(){
  List<TrendingProductModel> trendingProducts = new List<TrendingProductModel>();
  TrendingProductModel productModel;
  //1
  productModel = new TrendingProductModel();
  productModel.storeName = "Store Name";
  productModel.productName = "Product";
  productModel.noOfRating = 1;
  productModel.rating = 4;
  productModel.priceInDollars = 75;
  trendingProducts.add(productModel);
  //2
  productModel = new TrendingProductModel();
  productModel.storeName = "Store Name";
  productModel.productName = "Product";
  productModel.noOfRating = 3;
  productModel.rating = 4;
  productModel.priceInDollars = 30;
  trendingProducts.add(productModel);
  //3
  productModel = new TrendingProductModel();
  productModel.storeName = "Store Name";
  productModel.productName = "Product";
  productModel.noOfRating = 3;
  productModel.rating = 4;
  productModel.priceInDollars = 30;
  trendingProducts.add(productModel);
  //4
  productModel = new TrendingProductModel();
  productModel.storeName = "Store Name";
  productModel.productName = "Product";
  productModel.noOfRating = 301;
  productModel.rating = 4;
  productModel.priceInDollars = 30;
  trendingProducts.add(productModel);

  return trendingProducts;
}

List<ProductModel> getProduct(){
  List<ProductModel> products = new List<ProductModel>();
  ProductModel productModel;
  //1
  productModel = new ProductModel();
  productModel.productName = "Special gift card";
  productModel.imgUrl = "";
  productModel.noOfRating = 4;
  productModel.rating = 4;
  productModel.priceInDollars = 20;
  products.add(productModel);
  //2
  productModel = new ProductModel();
  productModel.productName = "Special gift card";
  productModel.imgUrl = "";
  productModel.noOfRating = 4;
  productModel.rating = 4;
  productModel.priceInDollars = 20;
  products.add(productModel);
  //3
  productModel = new ProductModel();
  productModel.productName = "Special gift card";
  productModel.imgUrl = "";
  productModel.noOfRating = 4;
  productModel.rating = 4;
  productModel.priceInDollars = 20;
  products.add(productModel);
  //4
  productModel = new ProductModel();
  productModel.productName = "Special gift card";
  productModel.imgUrl = "";
  productModel.noOfRating = 4;
  productModel.rating = 4;
  productModel.priceInDollars = 20;
  products.add(productModel);
  //5
  productModel = new ProductModel();
  productModel.productName = "Special gift card";
  productModel.imgUrl = "";
  productModel.noOfRating = 4;
  productModel.rating = 4;
  productModel.priceInDollars = 20;
  products.add(productModel);
  //6
  productModel = new ProductModel();
  productModel.productName = "Special gift card";
  productModel.imgUrl = "";
  productModel.noOfRating = 4;
  productModel.rating = 4;
  productModel.priceInDollars = 57;
  products.add(productModel);

  return products;
}

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = new List<CategoryModel>();
  CategoryModel categoryModel;
  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Regular Gift";
  categoryModel.imgAssetPath = "assets/categorie.png";
  categoryModel.color1 = "0xff8EA2FF";
  categoryModel.color2 = "0xff557AC7";
  categories.add(categoryModel);
  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Box Gift";
  categoryModel.imgAssetPath = "assets/boxgift.png";
  categoryModel.color1 = "0xff50F9B4";
  categoryModel.color2 = "0xff38CAE9";
  categories.add(categoryModel);
  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Chocolate";
  categoryModel.imgAssetPath = "assets/choclate.png";
  categoryModel.color1 = "0xffFFB397";
  categoryModel.color2 = "0xffF46AA0";
  categories.add(categoryModel);
  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Gift with card";
  categoryModel.imgAssetPath = "assets/categorie.png";
  categoryModel.color1 = "0xff8EA2FF";
  categoryModel.color2 = "0xff557AC7";
  categories.add(categoryModel);
  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Regular Gift";
  categoryModel.imgAssetPath = "assets/categorie.png";
  categoryModel.color1 = "0xff8EA2FF";
  categoryModel.color2 = "0xff557AC7";
  categories.add(categoryModel);

  return categories;
}