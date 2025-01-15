class ReviewResponse {
  final List<Review> reviews;

  ReviewResponse({required this.reviews});

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    return ReviewResponse(
      reviews: List<Review>.from(json['results'].map((review) => Review.fromJson(review))),
    );
  }
}

class Review {
  final String id;
  final String comment;
  final int rating;
  final String accountId;
  final String productId;
  final String accountName;

  Review({
    required this.id,
    required this.comment,
    required this.rating,
    required this.accountId,
    required this.productId,
    required this.accountName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        id: json['_id'],
        comment: json['comment'],
        rating: json['rating'],
        accountId: json['account-id'],
        productId: json['product-id'],
        accountName: json['account-name']);
  }
}
