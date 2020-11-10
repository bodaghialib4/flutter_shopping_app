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
  List<TrendingProductModel> trendingProducts =
      new List<TrendingProductModel>();
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
            SizedBox(
              height: 50,
            ),
            //here we will add our container

            /// Search Bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(5.0, 5.0),
                      blurRadius: 5.0,
                      color: Colors.black87.withOpacity(0.05),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Text(
                      "Search",
                      style: TextStyle(color: Color(0xff9B9B9B), fontSize: 17),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.search),
                ],
              ),
            ),

            ///Trending products slide
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Today Trending",
                    style: TextStyle(color: Colors.black87, fontSize: 22),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text("30 June"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 22),
              height: 150,
              child: ListView.builder(
                itemCount: trendingProducts.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TrendingTile(
                    productName: trendingProducts[index].productName,
                    storeName: trendingProducts[index].storeName,
                    imgUrl: trendingProducts[index].imgUrl,
                    priceInDollars: trendingProducts[index].priceInDollars,
                    rating: trendingProducts[index].rating,
                    noOfRating: trendingProducts[index].noOfRating,
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class TrendingTile extends StatelessWidget {
  final String productName;
  final String storeName;
  final String imgUrl;
  final int noOfRating;
  final int rating;
  final int priceInDollars;

  TrendingTile(
      {this.productName,
      this.storeName,
      this.imgUrl,
      this.noOfRating,
      this.rating,
      this.priceInDollars});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(right: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
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
                Image.asset(
                  "assets/image.png",
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 25,
                  width: 50,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(colors: [
                      const Color(0xff8EA2FF).withOpacity(0.5),
                      const Color(0xff557AC7).withOpacity(0.5)
                    ]),
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
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 19,
                  ),
                ),
                Text(
                  storeName,
                  style: TextStyle(color: textGrey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    StarRating(
                      rating: rating,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "($noOfRating)",
                      style: TextStyle(color: textGrey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(colors: [
                      const Color(0xff8EA2FF),
                      const Color(0xff557AC7)
                    ]),
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

class StarRating extends StatelessWidget {
  final int rating;

  StarRating({this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          rating >= 1 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        Image.asset(
          rating >= 2 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        Image.asset(
          rating >= 3 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        Image.asset(
          rating >= 4 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        Image.asset(
          rating >= 5 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
      ],
    );
  }
}

class ProductTile extends StatelessWidget {
  final String productName;
  final String imgUrl;
  final int priceInDollars;
  final int rating;
  final int noOfRating;

  ProductTile(
      {this.productName,
      this.imgUrl,
      this.priceInDollars,
      this.rating,
      this.noOfRating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset("assets/productImage.png",
                    height: 150, fit: BoxFit.cover),
                Container(
                  height: 25,
                  width: 45,
                  margin: EdgeInsets.only(left: 8, top: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(colors: [
                      const Color(0xff8EA2FF).withOpacity(0.5),
                      const Color(0xff557AC7).withOpacity(0.5),
                    ]),
                  ),
                  child: Text("\$$priceInDollars",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
          Text(productName),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              StarRating(
                rating: rating,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "($noOfRating)",
                style: TextStyle(color: textGrey, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String imgAssetPath;
  final String color1;
  final String color2;

  CategoryTile(
      {this.categoryName, this.imgAssetPath, this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 65,
            width: 110,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(int.parse(color1)), Color(int.parse(color2))],
                ),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Container(
              child: Image.asset(
                imgAssetPath,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}
