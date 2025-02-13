import 'package:e_commerce/domain/entites/CategoriesResponseEntity.dart';

class CategoriesOrBrandsResponseDm extends CategoriesOrBrandsResponseEntity {
  CategoriesOrBrandsResponseDm({
    super.results,
    super.metadata,
    super.data,
  });

  CategoriesOrBrandsResponseDm.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoriesOrBrandsDm.fromJson(v));
      });
    }
  }
}

class CategoriesOrBrandsDm extends CategoriesOrBrandsEntity {
  CategoriesOrBrandsDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoriesOrBrandsDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
