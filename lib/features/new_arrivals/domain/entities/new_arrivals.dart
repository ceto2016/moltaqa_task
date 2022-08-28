import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewArrival {
  final int id;
  final String productName;
  final int storeId;
  final String storeName;
  final int brandId;
  final String brandName;
  final String discount;
  final bool freeShipping;
  final DateTime createdAt;
  final String price;
  final String netPrice;
  final int materialRate;
  final String materialName;
  final int categoryId;
  final String hex;
  final int basicUnitCount;
  final bool isFavorited;
  final int bestSelling;
  final String? bestRated;
  final List<ArrivalColor> colors;
  final int numberOfFollowers;
  final int numberOfViews;
  final bool hasDiscount;
  final int rate;
  final String image;
  NewArrival({
    required this.id,
    required this.productName,
    required this.storeId,
    required this.storeName,
    required this.brandId,
    required this.brandName,
    required this.discount,
    required this.freeShipping,
    required this.createdAt,
    required this.price,
    required this.netPrice,
    required this.materialRate,
    required this.materialName,
    required this.categoryId,
    required this.hex,
    required this.basicUnitCount,
    required this.isFavorited,
    required this.bestSelling,
    required this.bestRated,
    required this.colors,
    required this.numberOfFollowers,
    required this.numberOfViews,
    required this.hasDiscount,
    required this.rate,
    required this.image,
  });

  NewArrival copyWith({
    int? id,
    String? productName,
    int? storeId,
    String? storeName,
    int? brandId,
    String? brandName,
    String? discount,
    bool? freeShipping,
    DateTime? createdAt,
    String? price,
    String? netPrice,
    int? materialRate,
    String? materialName,
    int? categoryId,
    String? hex,
    int? basicUnitCount,
    bool? isFavorited,
    int? bestSelling,
    String? bestRated,
    List<ArrivalColor>? colors,
    int? numberOfFollowers,
    int? numberOfViews,
    bool? hasDiscount,
    int? rate,
    String? image,
  }) {
    return NewArrival(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      brandId: brandId ?? this.brandId,
      brandName: brandName ?? this.brandName,
      discount: discount ?? this.discount,
      freeShipping: freeShipping ?? this.freeShipping,
      createdAt: createdAt ?? this.createdAt,
      price: price ?? this.price,
      netPrice: netPrice ?? this.netPrice,
      materialRate: materialRate ?? this.materialRate,
      materialName: materialName ?? this.materialName,
      categoryId: categoryId ?? this.categoryId,
      hex: hex ?? this.hex,
      basicUnitCount: basicUnitCount ?? this.basicUnitCount,
      isFavorited: isFavorited ?? this.isFavorited,
      bestSelling: bestSelling ?? this.bestSelling,
      bestRated: bestRated ?? this.bestRated,
      colors: colors ?? this.colors,
      numberOfFollowers: numberOfFollowers ?? this.numberOfFollowers,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      hasDiscount: hasDiscount ?? this.hasDiscount,
      rate: rate ?? this.rate,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_name': productName,
      'store_id': storeId,
      'store_name': storeName,
      'brand_id': brandId,
      'brand_name': brandName,
      'discount': discount,
      'free_shipping': freeShipping,
      'created_at': createdAt.millisecondsSinceEpoch,
      'price': price,
      'net_price': netPrice,
      'material_rate': materialRate,
      'material_name': materialName,
      'category_id': categoryId,
      'hex': hex,
      'basic_unit_count': basicUnitCount,
      'is_favorited': isFavorited,
      'best_selling': bestSelling,
      'best_rated': bestRated,
      'colors': colors.map((x) => x.toMap()).toList(),
      'number_of_followers': numberOfFollowers,
      'number_of_views': numberOfViews,
      'has_discount': hasDiscount,
      'rate': rate,
      'image': image,
    };
  }

  factory NewArrival.fromMap(Map<String, dynamic> map) {
    return NewArrival(
      id: map['id']?.toInt() ?? 0,
      productName: map['product_name'] ?? '',
      storeId: map['store_id']?.toInt() ?? 0,
      storeName: map['store_name'] ?? '',
      brandId: map['brand_id']?.toInt() ?? 0,
      brandName: map['brand_name'] ?? '',
      discount: map['discount'] ?? '',
      freeShipping: map['free_shipping'] ?? false,
      createdAt: DateTime.parse(map['created_at']),
      price: map['price'] ?? '',
      netPrice: map['net_price'] ?? '',
      materialRate: map['material_rate']?.toInt() ?? 0,
      materialName: map['material_name'] ?? '',
      categoryId: map['category_id']?.toInt() ?? 0,
      hex: map['hex'] ?? '',
      basicUnitCount: map['basic_unit_count']?.toInt() ?? 0,
      isFavorited: map['is_favorited'] ?? false,
      bestSelling: map['best_selling']?.toInt() ?? 0,
      bestRated: map['best_rated'],
      colors: List<ArrivalColor>.from(
          map['colors']?.map((x) => ArrivalColor.fromMap(x))),
      numberOfFollowers: map['number_of_followers']?.toInt() ?? 0,
      numberOfViews: map['number_of_views']?.toInt() ?? 0,
      hasDiscount: map['has_discount'] ?? false,
      rate: map['rate']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewArrival.fromJson(String source) =>
      NewArrival.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Datum(id: $id, productName: $productName, storeId: $storeId, storeName: $storeName, brandId: $brandId, brandName: $brandName, discount: $discount, freeShipping: $freeShipping, createdAt: $createdAt, price: $price, netPrice: $netPrice, materialRate: $materialRate, materialName: $materialName, categoryId: $categoryId, hex: $hex, basicUnitCount: $basicUnitCount, isFavorited: $isFavorited, bestSelling: $bestSelling, bestRated: $bestRated, colors: $colors, numberOfFollowers: $numberOfFollowers, numberOfViews: $numberOfViews, hasDiscount: $hasDiscount, rate: $rate, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewArrival &&
        other.id == id &&
        other.productName == productName &&
        other.storeId == storeId &&
        other.storeName == storeName &&
        other.brandId == brandId &&
        other.brandName == brandName &&
        other.discount == discount &&
        other.freeShipping == freeShipping &&
        other.createdAt == createdAt &&
        other.price == price &&
        other.netPrice == netPrice &&
        other.materialRate == materialRate &&
        other.materialName == materialName &&
        other.categoryId == categoryId &&
        other.hex == hex &&
        other.basicUnitCount == basicUnitCount &&
        other.isFavorited == isFavorited &&
        other.bestSelling == bestSelling &&
        other.bestRated == bestRated &&
        listEquals(other.colors, colors) &&
        other.numberOfFollowers == numberOfFollowers &&
        other.numberOfViews == numberOfViews &&
        other.hasDiscount == hasDiscount &&
        other.rate == rate &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productName.hashCode ^
        storeId.hashCode ^
        storeName.hashCode ^
        brandId.hashCode ^
        brandName.hashCode ^
        discount.hashCode ^
        freeShipping.hashCode ^
        createdAt.hashCode ^
        price.hashCode ^
        netPrice.hashCode ^
        materialRate.hashCode ^
        materialName.hashCode ^
        categoryId.hashCode ^
        hex.hashCode ^
        basicUnitCount.hashCode ^
        isFavorited.hashCode ^
        bestSelling.hashCode ^
        bestRated.hashCode ^
        colors.hashCode ^
        numberOfFollowers.hashCode ^
        numberOfViews.hashCode ^
        hasDiscount.hashCode ^
        rate.hashCode ^
        image.hashCode;
  }
}

class ArrivalColor {
  final int id;
  final String name;
  final String hex;
  ArrivalColor({
    required this.id,
    required this.name,
    required this.hex,
  });

  ArrivalColor copyWith({
    int? id,
    String? name,
    String? hex,
  }) {
    return ArrivalColor(
      id: id ?? this.id,
      name: name ?? this.name,
      hex: hex ?? this.hex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'hex': hex,
    };
  }

  factory ArrivalColor.fromMap(Map<String, dynamic> map) {
    return ArrivalColor(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      hex: map['hex'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ArrivalColor.fromJson(String source) =>
      ArrivalColor.fromMap(json.decode(source));

  @override
  String toString() => 'Color(id: $id, name: $name, hex: $hex)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArrivalColor &&
        other.id == id &&
        other.name == name &&
        other.hex == hex;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ hex.hashCode;
}
