class ProductModel {
  final String name;
  final double currentPrice;
  final double originalPrice;
  final int discountPercentage;
  final double rating;
  final int reviewCount;
  final String networkImage;

  ProductModel({
    required this.name,
    required this.currentPrice,
    required this.originalPrice,
    required this.discountPercentage,
    required this.rating,
    required this.reviewCount,
    required this.networkImage,
  });
  
foromDataBase(Map<String, dynamic> json) {
  return ProductModel(
    name: json['name'] ?? '',
    currentPrice: (json['currentPrice'] ?? 0).toDouble(),
    originalPrice: (json['originalPrice'] ?? 0).toDouble(),
    discountPercentage: json['discountPercentage'] ?? 0,
    rating: (json['rating'] ?? 0).toDouble(),
    reviewCount: json['reviewCount'] ?? 0,
    networkImage: json['networkImage'] ?? '',
  );
}

Map<String, dynamic> toDataBase() {
  return {
    'name':name ,
    'currentPrice': currentPrice,
    'originalPrice': originalPrice,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'reviewCount': reviewCount,
    'networkImage': networkImage,
  };
}

}



//  name: 'Wireless Charging Pad',
//     currentPrice: 39.99,
//     originalPrice: 49.99,
//     discountPercentage: 20,
//     rating: 4.5,
//     reviewCount: 128,
//     networkImage: 'https://thingsi