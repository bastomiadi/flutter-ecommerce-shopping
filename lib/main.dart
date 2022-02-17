import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/data/data.dart';
import 'package:flutter_ecommerce/models/category_model.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:flutter_ecommerce/models/trending_product_model.dart';
import 'package:flutter_ecommerce/resources/colors.dart';
import 'package:flutter_ecommerce/views/home.dart';

void main() => runApp(MyApp());

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
      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TrendingProductModel> trendingProducts = [];
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingProducts = getTrendingProducts();
    products = getProducts();
    categories = getCategories();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),

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
                ),
              ],
            ),
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
          SizedBox(
            height: 30,
          ),

          /// Trending
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
                Text("30 June")
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
                    priceInDollars: trendingProducts[index].priceInDollars,
                    productName: trendingProducts[index].productName,
                    storename: trendingProducts[index].storename,
                    imgUrl: trendingProducts[index].imgUrl,
                    noOfRating: trendingProducts[index].noOfRating,
                    rating: trendingProducts[index].rating,
                  );
                }),
          ),
          SizedBox(
            height: 40,
          ),

          /// Best Selling
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Best Selling",
                  style: TextStyle(color: Colors.black87, fontSize: 22),
                ),
                SizedBox(
                  width: 12,
                ),
                Text("This week")
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 240,
            padding: EdgeInsets.only(left: 22),
            child: ListView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductTile(
                    priceInDollars: products[index].priceInDollars,
                    productName: products[index].productName,
                    rating: products[index].rating,
                    imgUrl: products[index].imgUrl,
                    noOfRating: products[index].noOfRating,
                  );
                }),
          ),

          /// Top categorie
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              "Top categories",
              style: TextStyle(color: Colors.black87, fontSize: 22),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 240,
            padding: EdgeInsets.only(left: 22),
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategorieTile(
                    categorieName: categories[index].categorieName,
                    imgAssetPath: categories[index].imgAssetPath,
                    color1: categories[index].color1,
                    color2: categories[index].color2,
                  );
                }),
          )
        ],
      ),
    ));
  }
}

class TrendingTile extends StatelessWidget {
  final String productName;
  final String storename;
  final String imgUrl;
  final int noOfRating;
  final int priceInDollars;
  final int rating;
  TrendingTile(
      {required this.productName,
      required this.storename,
      required this.imgUrl,
      required this.rating,
      required this.noOfRating,
      required this.priceInDollars});
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
                      ])),
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
                  style: TextStyle(color: Colors.black87, fontSize: 19),
                ),
                Text(
                  storename,
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
                    )
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
                      ])),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int rating;
  StarRating({required this.rating});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          rating >= 1 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          rating >= 2 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          rating >= 3 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          rating >= 4 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
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
  final int priceInDollars;
  final String productName;
  final int rating;
  final String imgUrl;
  final int noOfRating;
  ProductTile(
      {required this.priceInDollars,
      required this.imgUrl,
      required this.rating,
      required this.productName,
      required this.noOfRating});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/productImage.png",
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 25,
                  width: 45,
                  margin: EdgeInsets.only(left: 8, top: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(colors: [
                        const Color(0xff8EA2FF).withOpacity(0.5),
                        const Color(0xff557AC7).withOpacity(0.5)
                      ])),
                  child: Text(
                    "\$$priceInDollars",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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

class CategorieTile extends StatelessWidget {
  final String categorieName;
  final String imgAssetPath;
  final String color1;
  final String color2;
  CategorieTile(
      {required this.imgAssetPath,
      required this.color2,
      required this.color1,
      required this.categorieName});
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
                gradient: LinearGradient(colors: [
                  Color(int.parse(color1)),
                  Color(int.parse(color2))
                ]),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Container(
                child: Image.asset(
              imgAssetPath,
            )),
          ),
          SizedBox(
            height: 8,
          ),
          Text(categorieName),
        ],
      ),
    );
  }
}
