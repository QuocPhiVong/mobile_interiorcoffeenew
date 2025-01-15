import 'dart:convert';

class ProductsResponse {
  final int? pageNo;
  final int? pageSize;
  final int? listSize;
  final int? currentPageSize;
  final int? listSizeAfter;
  final int? totalPage;
  final int? minPrice;
  final int? maxPrice;
  final int? inStock;
  final int? outOfStock;
  final OrderBy? orderBy;
  final Filter? filter;
  final dynamic keyword;
  final List<Product>? products;

  ProductsResponse({
    required this.pageNo,
    required this.pageSize,
    required this.listSize,
    required this.currentPageSize,
    required this.listSizeAfter,
    required this.totalPage,
    required this.minPrice,
    required this.maxPrice,
    required this.inStock,
    required this.outOfStock,
    required this.orderBy,
    required this.filter,
    required this.keyword,
    required this.products,
  });

  factory ProductsResponse.fromRawJson(String str) => ProductsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
        pageNo: json["page-no"] ?? 0,
        pageSize: json["page-size"] ?? 0,
        listSize: json["list-size"] ?? 0,
        currentPageSize: json["current-page-size"] ?? 0,
        listSizeAfter: json["list-size-after"] ?? 0,
        totalPage: json["total-page"] ?? 0,
        minPrice: json["min-price"] ?? 0,
        maxPrice: json["max-price"] ?? 0,
        inStock: json["in-stock"] ?? 0,
        outOfStock: json["out-of-stock"] ?? 0,
        orderBy: json["order-by"] != null ? OrderBy.fromJson(json["order-by"]) : null,
        filter: json["filter"] != null ? Filter.fromJson(json["filter"]) : null,
        keyword: json["keyword"],
        products:
            json["products"] != null ? List<Product>.from(json["products"].map((x) => Product.fromJson(x))) : null,
      );

  Map<String, dynamic> toJson() => {
        "page-no": pageNo,
        "page-size": pageSize,
        "list-size": listSize,
        "current-page-size": currentPageSize,
        "list-size-after": listSizeAfter,
        "total-page": totalPage,
        "min-price": minPrice,
        "max-price": maxPrice,
        "in-stock": inStock,
        "out-of-stock": outOfStock,
        "order-by": orderBy?.toJson(),
        "filter": filter?.toJson(),
        "keyword": keyword,
        "products": products != null ? List<dynamic>.from(products!.map((x) => x.toJson())) : [],
      };
}

class Filter {
  final dynamic status;
  final dynamic categoryId;
  final dynamic merchantId;
  final dynamic isAvailability;

  Filter({
    required this.status,
    required this.categoryId,
    required this.merchantId,
    required this.isAvailability,
  });

  factory Filter.fromRawJson(String str) => Filter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        status: json["status"],
        categoryId: json["category-id"],
        merchantId: json["merchant-id"],
        isAvailability: json["is-availability"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "category-id": categoryId,
        "merchant-id": merchantId,
        "is-availability": isAvailability,
      };
}

class OrderBy {
  final dynamic sortBy;
  final bool isAscending;

  OrderBy({
    required this.sortBy,
    required this.isAscending,
  });

  factory OrderBy.fromRawJson(String str) => OrderBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderBy.fromJson(Map<String, dynamic> json) => OrderBy(
        sortBy: json["sort-by"],
        isAscending: json["is-ascending"],
      );

  Map<String, dynamic> toJson() => {
        "sort-by": sortBy,
        "is-ascending": isAscending,
      };
}

class Product {
  final String? id;
  final List<String>? categoryIds;
  final String? name;
  final String? description;
  final Images? images;
  final int? sellingPrice;
  final int? discount;
  final int? truePrice;
  int? quantity;
  final String? status;
  final String? dimensions;
  final List<String>? materials;
  final String? modelTextureUrl;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String? campaignId;
  final String? merchantId;

  Product({
    required this.id,
    required this.categoryIds,
    required this.name,
    required this.description,
    required this.images,
    required this.sellingPrice,
    required this.discount,
    required this.truePrice,
    required this.quantity,
    required this.status,
    required this.dimensions,
    required this.materials,
    required this.modelTextureUrl,
    required this.createdDate,
    required this.updatedDate,
    required this.campaignId,
    required this.merchantId,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"] ?? '',
        categoryIds: json["category-ids"] != null ? List<String>.from(json["category-ids"].map((x) => x)) : [],
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        images: json["images"] != null ? Images.fromJson(json["images"]) : Images(thumbnail: '', normalImages: []),
        sellingPrice: json["selling-price"] ?? 0,
        discount: json["discount"] ?? 0,
        truePrice: json["true-price"] ?? 0,
        quantity: json["quantity"] ?? 0,
        status: json["status"] ?? '',
        dimensions: json["dimensions"] ?? '',
        materials: json["materials"] != null ? List<String>.from(json["materials"].map((x) => x)) : [],
        modelTextureUrl: json["model-texture-url"] ?? '',
        createdDate: json["created-date"] != null ? DateTime.parse(json["created-date"]) : DateTime.now(),
        updatedDate: json["updated-date"] != null ? DateTime.parse(json["updated-date"]) : DateTime.now(),
        campaignId: json["campaign-id"] ?? '',
        merchantId: json["merchant-id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category-ids": categoryIds != null ? List<dynamic>.from(categoryIds!.map((x) => x)) : [],
        "name": name,
        "description": description,
        "images": images?.toJson(),
        "selling-price": sellingPrice,
        "discount": discount,
        "true-price": truePrice,
        "quantity": quantity,
        "status": status,
        "dimensions": dimensions,
        "materials": materials != null ? List<dynamic>.from(materials!.map((x) => x)) : [],
        "model-texture-url": modelTextureUrl,
        "created-date": createdDate?.toIso8601String(),
        "updated-date": updatedDate?.toIso8601String(),
        "campaign-id": campaignId,
        "merchant-id": merchantId,
      };
}

class Images {
  final String? thumbnail;
  final List<String>? normalImages;
  Images({
    required this.thumbnail,
    required this.normalImages,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: json["thumbnail"] ?? '',
        normalImages: json["normal-images"] != null ? List<String>.from(json["normal-images"].map((x) => x)) : [],
      );
  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "normal-images": normalImages != null ? List<dynamic>.from(normalImages!.map((x) => x)) : [],
      };
}

class CartItem {
  final String? id;
  final Product? object;
  final int? quantity;
  final double? timestamp;

  CartItem({
    required this.id,
    required this.object,
    required this.quantity,
    required this.timestamp,
  });

  factory CartItem.fromRawJson(String str) => CartItem.fromJson(json.decode(str));

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"] ?? '',
        object: json["object"] != null ? Product.fromJson(json["object"]) : null,
        quantity: json["quantity"] ?? 0,
        timestamp: json["timestamp"] != null
            ? double.parse(json["timestamp"].toString())
            : DateTime.now().millisecondsSinceEpoch.toDouble(),
      );
}
