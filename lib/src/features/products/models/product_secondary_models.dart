import 'dart:convert';

class Dimensions {
  final double width;
  final double height;
  final double depth;
  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  Dimensions copyWith({
    double? width,
    double? height,
    double? depth,
  }) {
    return Dimensions(
      width: width ?? this.width,
      height: height ?? this.height,
      depth: depth ?? this.depth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'depth': depth,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width'].toDouble() as double,
      height: map['height'].toDouble() as double,
      depth: map['depth'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) =>
      Dimensions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Dimensions(width: $width, height: $height, depth: $depth)';

  @override
  bool operator ==(covariant Dimensions other) {
    if (identical(this, other)) return true;

    return other.width == width &&
        other.height == height &&
        other.depth == depth;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ depth.hashCode;
}

class Review {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;
  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  Review copyWith({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return Review(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerEmail: reviewerEmail ?? this.reviewerEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      rating: map['rating'].toInt() as int,
      comment: map['comment'] as String,
      date: map['date'] as String,
      reviewerName: map['reviewerName'] as String,
      reviewerEmail: map['reviewerEmail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(rating: $rating, comment: $comment, date: $date, reviewerName: $reviewerName, reviewerEmail: $reviewerEmail)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.rating == rating &&
        other.comment == comment &&
        other.date == date &&
        other.reviewerName == reviewerName &&
        other.reviewerEmail == reviewerEmail;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
        comment.hashCode ^
        date.hashCode ^
        reviewerName.hashCode ^
        reviewerEmail.hashCode;
  }
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;
  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  Meta copyWith({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    return Meta(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      barcode: barcode ?? this.barcode,
      qrCode: qrCode ?? this.qrCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      barcode: map['barcode'] as String,
      qrCode: map['qrCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meta.fromJson(String source) =>
      Meta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meta(createdAt: $createdAt, updatedAt: $updatedAt, barcode: $barcode, qrCode: $qrCode)';
  }

  @override
  bool operator ==(covariant Meta other) {
    if (identical(this, other)) return true;

    return other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.barcode == barcode &&
        other.qrCode == qrCode;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        updatedAt.hashCode ^
        barcode.hashCode ^
        qrCode.hashCode;
  }
}
