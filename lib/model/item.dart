import 'dart:convert';

class Item {
  String articleCode;
  String shopCode;
  String availableFrom;
  String availableUntil;
  double eatOutPrice;
  double eatInPrice;
  String articleName;
  List<String> dayParts;
  String internalDescription;
  String customerDescription;
  String imageUri;
  String thumbnailUri;
  Item({
    required this.articleCode,
    required this.shopCode,
    required this.availableFrom,
    required this.availableUntil,
    required this.eatOutPrice,
    required this.eatInPrice,
    required this.articleName,
    required this.dayParts,
    required this.internalDescription,
    required this.customerDescription,
    required this.imageUri,
    required this.thumbnailUri,
  });

  Map<String, dynamic> toMap() {
    return {
      'articleCode': articleCode,
      'shopCode': shopCode,
      'availableFrom': availableFrom,
      'availableUntil': availableUntil,
      'eatOutPrice': eatOutPrice,
      'eatInPrice': eatInPrice,
      'articleName': articleName,
      'dayParts': dayParts,
      'internalDescription': internalDescription,
      'customerDescription': customerDescription,
      'imageUri': imageUri,
      'thumbnailUri': thumbnailUri,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      articleCode: map['articleCode'] ?? '',
      shopCode: map['shopCode'] ?? '',
      availableFrom: map['availableFrom'] ?? '',
      availableUntil: map['availableUntil'] ?? '',
      eatOutPrice: map['eatOutPrice']?.toDouble() ?? 0.0,
      eatInPrice: map['eatInPrice']?.toDouble() ?? 0.0,
      articleName: map['articleName'] ?? '',
      dayParts: List<String>.from(map['dayParts']),
      internalDescription: map['internalDescription'] ?? '',
      customerDescription: map['customerDescription'] ?? '',
      imageUri: map['imageUri'] ?? '',
      thumbnailUri: map['thumbnailUri'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
