import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/data/data.dart';
import 'package:flutter_shopping_app/models/category_model.dart';
import 'package:flutter_shopping_app/models/product_model.dart';
import 'package:flutter_shopping_app/models/trending_product_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<TrendingProductModel> trendingProducts = new List<TrendingProductModel>();
  List<ProductModel> products = new List<ProductModel>();
  List<CategoryModel> categories = new List<CategoryModel>();
  @override
  void initState() {
    super.initState();
    trendingProducts = getTrendingProducts();
    products = getProduct();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            //here we will add our container
          ],
        ),
      ),
    );
  }
}
