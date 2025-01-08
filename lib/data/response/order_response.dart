class OrderResponse {
  final int? pageSize;
  final int? pageNo;
  final int? totalItems;
  final int? totalPages;
  final List<Order>? items;

  OrderResponse({
    this.pageSize,
    this.pageNo,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      pageSize: json['page-size'] as int?,
      pageNo: json['page-no'] as int?,
      totalItems: json['total-items'] as int?,
      totalPages: json['total-pages'] as int?,
      items: (json['items'] as List?)?.map((item) => Order.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page-size': pageSize,
      'page-no': pageNo,
      'total-items': totalItems,
      'total-pages': totalPages,
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }
}

class Order {
  final String? id;
  final DateTime? orderDate;
  final String? status;
  final double? vat;
  final double? feeAmount;
  final double? totalAmount;
  final String? shippingAddress;
  final List<OrderProduct>? orderProducts;
  final double? systemIncome;
  final String? voucherId;
  final String? accountId;
  final DateTime? updatedDate;

  Order({
    this.id,
    this.orderDate,
    this.status,
    this.vat,
    this.feeAmount,
    this.totalAmount,
    this.shippingAddress,
    this.orderProducts,
    this.systemIncome,
    this.voucherId,
    this.accountId,
    this.updatedDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'] as String?,
      orderDate: json['order-date'] != null ? DateTime.tryParse(json['order-date'] as String) : null,
      status: json['status'] as String?,
      vat: (json['vat'] as num?)?.toDouble(),
      feeAmount: (json['fee-amount'] as num?)?.toDouble(),
      totalAmount: (json['total-amount'] as num?)?.toDouble(),
      shippingAddress: json['shipping-address'] as String?,
      orderProducts: (json['order-products'] as List?)
          ?.map((item) => OrderProduct.fromJson(item as Map<String, dynamic>))
          .toList(),
      systemIncome: (json['system-income'] as num?)?.toDouble(),
      voucherId: json['voucher-id'] as String?,
      accountId: json['account-id'] as String?,
      updatedDate: json['updated-date'] != null ? DateTime.tryParse(json['updated-date'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'order-date': orderDate?.toIso8601String(),
      'status': status,
      'vat': vat,
      'fee-amount': feeAmount,
      'total-amount': totalAmount,
      'shipping-address': shippingAddress,
      'order-products': orderProducts?.map((item) => item.toJson()).toList(),
      'system-income': systemIncome,
      'voucher-id': voucherId,
      'account-id': accountId,
      'updated-date': updatedDate?.toIso8601String(),
    };
  }
}

class OrderProduct {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final int? quantity;
  final String? merchantId;

  OrderProduct({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.merchantId,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      merchantId: json['merchant-id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'merchant-id': merchantId,
    };
  }
}
