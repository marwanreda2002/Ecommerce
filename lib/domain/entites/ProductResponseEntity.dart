import 'package:e_commerce/domain/entites/CategoriesResponseEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  num? results;
  MetadataEntity? metadata;
  List<ProductDataEntity>? data;
}

class ProductDataEntity {
  ProductDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoriesOrBrandsEntity? category;
  CategoriesOrBrandsEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
}

// class Brand {
//   Brand({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//
// }

// class Category {
//   Category({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   Category.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//
// }

class SubcategoryEntity {
  SubcategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
}
