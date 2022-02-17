class ProductModel {
  final int priceInDollars; // price
  final String productName; // name of the product
  final int rating; // rating
  final String imgUrl; // product image url
  final int noOfRating; // number of rating
  ProductModel(
      {required this.productName,
      required this.imgUrl,
      required this.priceInDollars,
      required this.rating,
      required this.noOfRating});
}
