class TrendingProductModel {
  final String productName;
  final String storename;
  final String imgUrl;
  final int noOfRating;
  final int priceInDollars;
  final int rating;
  TrendingProductModel(
      {required this.imgUrl,
      required this.noOfRating,
      required this.priceInDollars,
      required this.productName,
      required this.storename,
      required this.rating});
}
