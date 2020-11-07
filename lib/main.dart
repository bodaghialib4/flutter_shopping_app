import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/data/data.dart';
import 'package:flutter_shopping_app/models/category_model.dart';
import 'package:flutter_shopping_app/models/product_model.dart';
import 'package:flutter_shopping_app/models/trending_product_model.dart';
import 'package:flutter_shopping_app/resources/colors.dart';

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

class TrendingTitle extends StatelessWidget{
  final String productName;
  final String storeName;
  final String imgUrl;
  final int noOfRating;
  final int rating;
  final int priceInDollars;
  TrendingTitle({this.productName, this.storeName, this.imgUrl, this.noOfRating,
    this.rating, this.priceInDollars});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      margin: EdgeInsets.only(right: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0,1.0),
            blurRadius: 15.0,
            color: Colors.black87.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset("assets/image.png", height: 150, fit: BoxFit.cover,),
                Container(
                  height: 25,
                  width: 50,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      colors: [const Color(0xff8EA2FF).withOpacity(0.5),
                        const Color(0xff557AC7).withOpacity(0.5)]
                    ),
                  ),
                  child: Text(
                    "\$$priceInDollars",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productName,
                  style: TextStyle(color: Colors.black87, fontSize: 19, ),
                ),
                Text(
                  storeName,
                  style: TextStyle(color: textGrey),
                ),
                SizedBox(height: 8,),
                Row(
                  children: <Widget>[
                    StarRating(rating:rating,),
                    SizedBox(width: 3,),
                    Text(
                      "($noOfRating)",
                      style: TextStyle( color: textGrey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 13,),
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                        colors: [const Color(0xff8EA2FF), const Color(0xff557AC7)]
                    ),
                  ),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget{
  final int rating;
  StarRating({this.rating});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(rating>=1?"assets/star.png":"assets/stargrey.png",width: 13, height: 13,),
        Image.asset(rating>=2?"assets/star.png":"assets/stargrey.png",width: 13, height: 13,),
        Image.asset(rating>=3?"assets/star.png":"assets/stargrey.png",width: 13, height: 13,),
        Image.asset(rating>=4?"assets/star.png":"assets/stargrey.png",width: 13, height: 13,),
        Image.asset(rating>=5?"assets/star.png":"assets/stargrey.png",width: 13, height: 13,),
      ],
    );
  }
}

class ProductTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CategoryTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
