import 'package:e_commerce/domain/entites/ProductResponseEntity.dart';

import 'CategoryReponseDm.dart';

class ProductsResponseDm extends ProductResponseEntity {
  ProductsResponseDm({
    super.results,
    super.metadata,
    super.data,
  });

  ProductsResponseDm.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDataDm.fromJson(v));
      });
    }
  }
}

class ProductDataDm extends ProductDataEntity {
  ProductDataDm({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
  });

  ProductDataDm.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDm.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoriesOrBrandsDm.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoriesOrBrandsDm.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
}

class SubcategoryDm extends SubcategoryEntity {
  SubcategoryDm({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  SubcategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}
